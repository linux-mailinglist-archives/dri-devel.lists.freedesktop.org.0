Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DB67AD51E9
	for <lists+dri-devel@lfdr.de>; Wed, 11 Jun 2025 12:32:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 43D6010E60D;
	Wed, 11 Jun 2025 10:32:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="A8AIHZ+x";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE4AB10E608;
 Wed, 11 Jun 2025 10:32:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749637943; x=1781173943;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=F4bpOPbMvXWciA1pS50UQejiLZ95tWEf0PXGThXJTPA=;
 b=A8AIHZ+xIOW/oYKDDCxYTEA4Go4BV6OnEdRUgexjX3GiUmYkOJilxYxw
 l1mZp1FKBr95k5fPJiepib0sqK3ql2t7NvSlqowJTun+XzuFba++x3/2s
 dJfTntNXnPH2MWEfocOXC6lHXK2UVYUnzb/IqM8Mel4SFlBlo/jNVmmF6
 5tZ8EM/DgPrJWubgzU4gi53Xr+fvhXuzOvs3C9ufel5ZQXc7QxLg6s+89
 UQ0Nip1yY5+e13lI/DqFO6t7HzZAIdLURzvOWrB7x+9rPMCAI8Wp8x8Bc
 3aS4vFjSZ+0PupQX4kSmucy9wK5FS9i172qg4kC2ZtXQk8toevIIRBg6d g==;
X-CSE-ConnectionGUID: ar+jTbqzTzuLzRQs1u/TJQ==
X-CSE-MsgGUID: fNBDhyq/Sl60fXlwAXKBgg==
X-IronPort-AV: E=McAfee;i="6800,10657,11460"; a="54406450"
X-IronPort-AV: E=Sophos;i="6.16,227,1744095600"; d="scan'208";a="54406450"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jun 2025 03:32:23 -0700
X-CSE-ConnectionGUID: t4yag5XtQJKQVg0DN5iwng==
X-CSE-MsgGUID: wAJB/jZ7Qi6ZT0pbkE47Jg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,227,1744095600"; d="scan'208";a="147649345"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jun 2025 03:32:22 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 11 Jun 2025 03:32:22 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Wed, 11 Jun 2025 03:32:22 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (40.107.220.78)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 11 Jun 2025 03:32:21 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eii9Mnf7Z3FiwGGrYny86S+WynA0GmF8E5PPD7/T0UEIQGWTJ3qb9U+iTWqQPpotsnNDv9WcOmgZ5AY+iANGbwqzJjduFPxeLESON5QQZoaPHREd5OMl53ShA1pGL4zfRD8bQW4Hj8PxaaECLrmVLP3Gv4NQO6P/c4x2amAgvhG0StfaIded8cJvPeuH3vC+gofiS3TgH8SL4gsVqhwI1ZGg4M6XezNdlmbeFi4XuN6c6ipKyyk3nCnulE5n2qURFH1HjxGIzyayDn1M7Eogqz6+fKMjg4TU4c/Yf9PrXSMmYt48He8T+zcPtBP5zLXfE4O4x94J5d0Z7RrMP6fXpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XAa9cRFh5woP+E7MOpAZ5FDQpRpUoOKW7AXEJwNVZZ0=;
 b=l9hZTneyhMyn0SFbr/ZOiB/LS6bpqlNNnhGWcWgDPXNOheYG29pFkuS2QspbOChaWKF4iA8eShtM0c3an26uOJNfKt4AP1r79ts0Xnpm9EEvW8ARPHtmb02/d5QeMPR9qVdqSwB7I9b5zF+2nQchfpRbCzJBStgayvIOHZEq96YKgV9Fz0Y6VI5qFS1mVjEGWBpGDeNWcabF79Or4KeThGyfg53agIGAzDBW8wO2f9Dqf/Thlb0JKvpdpaVU5b09OKw1H5pe4rVh6X7IdKlrjc40rK2WvSUOaUv4zW5jIQudpU9RNEaDxFwR0yU5dStEtSwzabbf/8Y3lnK5yecoEw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CO1PR11MB5057.namprd11.prod.outlook.com (2603:10b6:303:6c::15)
 by DM3PR11MB8714.namprd11.prod.outlook.com (2603:10b6:0:b::18) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8813.31; Wed, 11 Jun 2025 10:32:15 +0000
Received: from CO1PR11MB5057.namprd11.prod.outlook.com
 ([fe80::4610:6d6c:9af6:2548]) by CO1PR11MB5057.namprd11.prod.outlook.com
 ([fe80::4610:6d6c:9af6:2548%6]) with mapi id 15.20.8835.018; Wed, 11 Jun 2025
 10:32:15 +0000
Date: Wed, 11 Jun 2025 10:32:02 +0000
From: Krzysztof Karas <krzysztof.karas@intel.com>
To: Jeff Layton <jlayton@kernel.org>
CC: Andrew Morton <akpm@linux-foundation.org>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Jakub Kicinski
 <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Simon Horman
 <horms@kernel.org>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, "Jani
 Nikula" <jani.nikula@linux.intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>, Kuniyuki Iwashima <kuniyu@amazon.com>, 
 Qasim Ijaz <qasdev00@gmail.com>, Nathan Chancellor <nathan@kernel.org>,
 Andrew Lunn <andrew@lunn.ch>, <linux-kernel@vger.kernel.org>,
 <netdev@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <intel-gfx@lists.freedesktop.org>
Subject: Re: [PATCH v14 4/9] ref_tracker: add a static classname string to
 each ref_tracker_dir
Message-ID: <r3mbkrgrok3yh3txuxmddgezsvvpwnackv725ro4wg3xa323xr@36hii2pcv3gp>
"Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173,
 80-298 Gdansk - KRS 101882 - NIP 957-07-52-316"
References: <20250610-reftrack-dbgfs-v14-0-efb532861428@kernel.org>
 <20250610-reftrack-dbgfs-v14-4-efb532861428@kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <20250610-reftrack-dbgfs-v14-4-efb532861428@kernel.org>
X-ClientProxiedBy: VI1P191CA0011.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:800:1ba::19) To CO1PR11MB5057.namprd11.prod.outlook.com
 (2603:10b6:303:6c::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR11MB5057:EE_|DM3PR11MB8714:EE_
X-MS-Office365-Filtering-Correlation-Id: ee54adfe-5007-4b92-798f-08dda8d33b99
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|366016|1800799024|376014|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?UVRtL2JrVlVzemkyOHNSMFlBSTlKNzc1SUZXU2tkUmJ4aXFpOEVJdVFzdUpS?=
 =?utf-8?B?bTlaN3lKWG53b3lueFIzS3BYN0lSdEsvVVBJZ1NqK0R4SGw2Z2NmTTBONDUy?=
 =?utf-8?B?TXhSSFNOQmthMkF2TVRWdFpKeHBkQmQxY0x5b1FYQmJTdzZYengwRWVFUUFX?=
 =?utf-8?B?OGszTHh0U042Yjh6VytRaURGNGw5c3dPTDNpSm0xR1RzVWh0SG9oMVBKTkNN?=
 =?utf-8?B?eVNvUExtc2lYOVRzbTQxazRZTGxWUjBFVFp1bHkvbHcxYmdRZEZiOWI5K2tD?=
 =?utf-8?B?dXlYOGs3Q01JTVlYTHhsdWk4YU4xNHJvQ3dYWHo4UXBBbUJhbmdvSTROc2J3?=
 =?utf-8?B?MWJSWFJiU1prMElBN200OXNJdFEyMlB4bVZhUDl1aXA0Z0hUSTI1Zkt5d25a?=
 =?utf-8?B?SXZMU2JoRGhqY2pFSGtaWUlLMWxTN3pwRW9jak54c29Ya0N3WVRsRXoyMDF3?=
 =?utf-8?B?TnFxQ1VsSElCWmlFVm5KOHc1cnpCS0V0UTM2LzZpODdza0JvVUYyTDQ5Zkhj?=
 =?utf-8?B?OG1lZ3h0RXhhSVZVbWRSbE02WHVqM1dZa2xQaDBnNVFsdThyMEo0SUp3MkFY?=
 =?utf-8?B?SENrdkpWTm9TWk9lOFhvVWd5R1pMYWd1QndjSlVZcWZLL1Jkcngwc21RUmYw?=
 =?utf-8?B?Qnl1RHl6OHR4RklnY1JzcDFzUklmeG9za1ZxM0U1UXMrOW9zVEdQTzBvTkdH?=
 =?utf-8?B?Rmd5NktEdytzMU5SOVZvU3I0aWM2NWpZWWs4U3U3R1p5TjR1LzNCM2RmeWhk?=
 =?utf-8?B?T2pScy9lYjlDSmhhREliS296QUd1RVpva1o4aUtFR25lS01HeUhhNUZkL2lP?=
 =?utf-8?B?ZmErN29oQ2k2dkJoMGUxTjdTS3U0RU1WVmY1NE05YjEwWnBJSjFmOXFtaGFR?=
 =?utf-8?B?ZXUxL0lYd3NURG1PV25pTHZXenpaODlTT2RGdUd4Wkc4cW5Gb0dxOUovTjlM?=
 =?utf-8?B?SWdCOWxQQ0plbDlTNFUwL3NiNGUvSTdSVnRtMzRpQVdGZWpyOWY3MEFTYXd1?=
 =?utf-8?B?WnZRVjNrZ2NXeG81ZUYyTmpJT2NoTHhLeG5EVXRram5FWlNjckErSXBrS1Ju?=
 =?utf-8?B?UmxxWkpwSWhrcWVGWjUrS09nOEpKZVJmTU5IZktlRFpBa1FkRkZSNWZBT0pj?=
 =?utf-8?B?ZENPVWxOUHU2Rlh3dnlybFQ3WmltSitXT3BZd3dsU1RXUm9hZlhHK256VDE2?=
 =?utf-8?B?aFlhT29ZQkd1Y0Q4cUhOM2hRb2NDalRvd24wUW1GbEswTEFLT3RQaDVLYldO?=
 =?utf-8?B?WEVkdG1aZ0ZFTVIrTkNvSHRSbUZUNWd2RXN2b211a1FQMWlaQUJoMzNObTlt?=
 =?utf-8?B?UHlhOTVVdlZ2eGlLd1grYm5WcGQwQ0t4SThYSGYwSXhNSnU3aTBFVEk5eVlx?=
 =?utf-8?B?S3Yza1VYS2dsY2JIbkhLWkZselF4dm1JNTBmN3BSWHIwaE40TDJOZnVOUlNV?=
 =?utf-8?B?dE5XcUdxNHphaUlqeSt1NDlJYmNxYnF3cU1ENkE0MEp5QUlYaGRhY0tnK2tU?=
 =?utf-8?B?dGhhOElKellKb0k0NmVQQk9oUkkwQ2ViVER0amoyRHJEc1k1NXFPMjJVMWJi?=
 =?utf-8?B?NVI3b1l0VlZ4SmNuUHExbXpQeGY5VURmbnQyRFlEYkY5Q1R4U1ZmY24ydEN5?=
 =?utf-8?B?MllpcmVVN3Z0MHdJTHY3dzJiZld5YnI5aExHalJZOEprZkp1TWk1VWR2SHlx?=
 =?utf-8?B?Y08wUnliWUQyY1I2eFVzSnh2Z3VkNTB5QmJzaUJ4KzNKNWk4VEV0RmMzcENz?=
 =?utf-8?B?NG9kSWVzZy9YNTYrL3lxZ2VmbVo2WDJsK1ZMd0owNFZFODNVN3k5NnUyVGx5?=
 =?utf-8?B?U0l3U0Z1Rk93Q0YvcFVGSWovdE00UGZtZmZtNWs5TU5BS2c4TEQ0QUhiaU96?=
 =?utf-8?B?clBYNTBzNFlxY3NuYXdoeWwzWmZlcFVqVXZ2MnkvWE5ET1E9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR11MB5057.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(366016)(1800799024)(376014)(7053199007); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NXBHUjlnV2VCNkZBQkZaYkY3SGZTZ051UCszQnJpYjF2SndLZ1g1YjZrVTU0?=
 =?utf-8?B?NEtQcVY2ZXBzVTFtNThvT084MDVUbGdmVTRrenhGanY2NzMxd2F6VVZ6S0Rr?=
 =?utf-8?B?Zy9XaXpjaGhCNnBua0NqNSsra1VyQ2RIZlNwc0pPSERVbndpYXQyYUtWNTB1?=
 =?utf-8?B?ejBJWlNuZ0xUN0U0L1hFaXVhN2g3WE85eU0xMjMzSzFWZGJvTERDN201elNT?=
 =?utf-8?B?U0dpalJaL2VHR21ieHBNR3laQXVCWUlJSUVVd2VmNWFOZEplSVBJMElDeUhi?=
 =?utf-8?B?VGxyYnlkWkVRb1JhMnNITkg2UkJHTnpTbGZxZlArL1JJZzhpcGM2WDVRN3NS?=
 =?utf-8?B?eEJTbnExUG4vWU9DQVl3WE9USU5QL1BleXQ4R3ZrSXhyd2ZRZDJhNjRjZHcv?=
 =?utf-8?B?emh2eE9WdmN0aXQzQnlNa2tRNEZaRDB0U3BDOUFVdXoyTGdLNVZnL1pVdVVI?=
 =?utf-8?B?YUsvTy8xZ2U4Y1d3NWk5L01sVGc4ckR6K1ZMTkt5cmR1bCtUR3VLVStqaVg0?=
 =?utf-8?B?dERJMXVGdHJzTllVeS8xK0EyWHpKRmlpOEh3QnJXUEswRVNsQlM0NkhNSmgv?=
 =?utf-8?B?bUJ5MDIxQldGbFhRcnhxRWs4OENQUjRHRER4M2Z1clFwWlBUQk5sYjF0OFlI?=
 =?utf-8?B?R1pTZkRvUVZ5ZnhWbVhOTlRrVlNxbHE2aHFjOEV4NTdwaFl5QzUwUk9xdE1k?=
 =?utf-8?B?NHZ2dXJ5UUpuWkJKMWJJazBKb2JTcUJDY2pqbFNYTHFXVWV0bWRlaXNDb0ZI?=
 =?utf-8?B?dS9haDBoY3NPYlgxZGdtSkljckgxZnJxVnlSVXovSUFmSENVZUxYNmhweHpn?=
 =?utf-8?B?d3B0Z2Q5cjV2S2Y2RDlMUmYxVklocEFrQ0lib0ZiSG83N01CU0JOdjdKaVNH?=
 =?utf-8?B?cGQxSmxlSWFTWlN4aUo0aHFyNDJvbnp3ZmplbW9rU3JIV2VtWVJ1dHFDUWJh?=
 =?utf-8?B?Ym95TWVFd0ovT0NTYU1MK0I5aW8zNEdRL2QzcFZ0d3RGQlQvZVkrdTVGVEg4?=
 =?utf-8?B?aWhMdENlanZSK3ZuaW55bkFIaFJLa21YM1J1aU0zbjFIUGpBYkFIN2sveC9W?=
 =?utf-8?B?aElYREF6MS9QUUI5dkdRQXhpUFgxaVhob3V1SVc5UTVsbDlBTUd5QnpJbEtq?=
 =?utf-8?B?ZnBiR3RpL2pWTy8rZEo1NlFuZ0cza3RsS1o0M1Vlc1gyWFlOdTZhTnhwUnhv?=
 =?utf-8?B?NzYwMWd0TFp1NjdvaTZaYm5NeHZpL3ZTT3pKeEljelNpSklKTVJIZ3ZsQUEz?=
 =?utf-8?B?VDJ2VFdvT1hkRXVBSC9lZWV1RjdjcW9PQThLSUJLY1FkVk5DeElTRU42bjQy?=
 =?utf-8?B?WmFqYmZhdjFDRWMrQ1VLQ0xHUFZXT2ZvZm5vRjZRQlZYWHV5ZXVWem51ZFhC?=
 =?utf-8?B?MVI4NG1qNmZ2NkIrdzVRKzVOaXdaZzVNRHp3R2s4anAyVW92TlR1Vmo1dU1j?=
 =?utf-8?B?WW9jY2xTNFhZWXV1Y0FMWTYvYUlnbHpvdzJKckFobC9jeVJLYjFXaTYyOXpQ?=
 =?utf-8?B?NVVWdWxXeEJ2b3pybC9jcC9rZjZacFk2ODVHN0dxVE9CbGVjY2xMa0h4L2NE?=
 =?utf-8?B?emw2dnI5aVZ6TVE2eFFTWGVWTlZOZGVLYkN3OTYybUZ1SGV5MUN5eUlLU0Ja?=
 =?utf-8?B?L3dNOGxaUm5XNGYxWVNFNXpGTUJlRUM3aVJMRFo0bkdmdkQ5MzlZRENrazJB?=
 =?utf-8?B?QVV6ZDZRRU1yQUV5dERjRkxxUGc5OTlrZlZwbE9QV2F1RFhyQU1lMEpXSCtY?=
 =?utf-8?B?T3ZwYVZ4cUFKa2x5RjY5V0xOaE5zeFhYVi9Hcmw4QzRRaGVwK085T2NTUnJW?=
 =?utf-8?B?WEwvbmZaaWJpdDVCNlp0MWdwTG9yMFVNNWVYU3BhYVFYcS9DajVLT3F5QlNr?=
 =?utf-8?B?YlhGTElTa2pSMEd1L1l5THpTYStrbGZmY3VpeGR5VC9KcFVpS3pXVk1nK3pk?=
 =?utf-8?B?NTV3TEVvem13REsrTGEyTEZLb2c5aTdpdFBWVUpnYmtQVHpEb09IMml3Zk9K?=
 =?utf-8?B?Sms3NEpUZnhoQlJ4UGhzVjBmemtJYWZXTVYwQllNT3ArQmlMWFQvMjA3Tlh2?=
 =?utf-8?B?U0ptbjllTUd5b0E2ZnljTFhMcVZvTjlSVzhnRGMwdGdyVURFd1hlK1hycW4w?=
 =?utf-8?B?a3FvR1U5eTBmM1pIR0xobFEra1NxRXNjL29CTTJ6QXhxRHNuNDV2VUxKaVQ3?=
 =?utf-8?B?YkE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ee54adfe-5007-4b92-798f-08dda8d33b99
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5057.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jun 2025 10:32:14.9834 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UaDlFl/QtbQIIQx/hQUSvLKmZzmfOcltGGD0PRqZ3QIBLbUO9sd3qPaDiXel4CTUIZFso6NeRvABuN/+7EDMVVLb4aGZI06CARK71B4K5Yo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PR11MB8714
X-OriginatorOrg: intel.com
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Direct Rendering Infrastructure - Development
 <dri-devel.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Jeff,

> A later patch in the series will be adding debugfs files for each
> ref_tracker that get created in ref_tracker_dir_init(). The format will
> be "class@%px". The current "name" string can vary between
> ref_tracker_dir objects of the same type, so it's not suitable for this
> purpose.
> 
> Add a new "class" string to the ref_tracker dir that describes the
> the type of object (sans any individual info for that object).
> 
> Also, in the i915 driver, gate the creation of debugfs files on whether
> the dentry pointer is still set to NULL. CI has shown that the
> ref_tracker_dir can be initialized more than once.
> 
> Signed-off-by: Jeff Layton <jlayton@kernel.org>
> ---

Looks good:
Reviewed-by: Krzysztof Karas <krzysztof.karas@intel.com>

A side note:
I was wondering if we could improve naming a bit, but I think it
is not worth the effort. Names like "dptun" instead of
"dp_tunnel" and including "wakeref" only in
__intel_wakeref_init() but not in init_intel_runtime_pm_wakeref()
in "intel_runtime_pm" string stand out, but it is quite clear
what these names mean, so I added my r-b.

Best Regards,
Krzysztof
