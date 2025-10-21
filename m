Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 60E58BF4284
	for <lists+dri-devel@lfdr.de>; Tue, 21 Oct 2025 02:37:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E0A110E549;
	Tue, 21 Oct 2025 00:37:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EI/s0b5n";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 47AA110E548;
 Tue, 21 Oct 2025 00:37:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761007037; x=1792543037;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=KBHh+n9CCWFTjG7eObh+A12+n9axXcdYZpssDarOnlY=;
 b=EI/s0b5npL9Y8gb+27QbR+Bfm5CDnGq22qKRsCYdkDdDnP8Bi0QF6QFO
 IgsecQ1K1xskgMqC8IKxkMFjXfQaU/ZKgQTplQ+M21BDpnA1MgUphVe+c
 +KMGO/03iL9Hx7wTNnwHfWsowXTkTnFmik4mRdYgJKpHp0iHkYAaf4odU
 TONDEL9W5eSP0OgQn9v5GneR3lKgeDEaa6egasTwquQTJ8fFgoR6+J/L4
 cfEevH1A6nN8OVLNdd5yok9bjTOnl0DgTXOTEYW8poicBh9rWZWwYcEmF
 Byu95ZtWkcGuT/lD0XM+W8spVZFUhYMY7K/mxNt9kjn7QuEKcuiElNxcd A==;
X-CSE-ConnectionGUID: vxZ8Av0WSXWmb/G1f9MHUA==
X-CSE-MsgGUID: XNPftypOQ0Koq30seKH82Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="63038955"
X-IronPort-AV: E=Sophos;i="6.19,243,1754982000"; d="scan'208";a="63038955"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Oct 2025 17:37:16 -0700
X-CSE-ConnectionGUID: J3sJW4aXRYiPgSC5fTk10w==
X-CSE-MsgGUID: BCy+ModSRViVJWzJJVm5oQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,243,1754982000"; d="scan'208";a="183014877"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Oct 2025 17:37:16 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 20 Oct 2025 17:37:15 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Mon, 20 Oct 2025 17:37:15 -0700
Received: from CH4PR04CU002.outbound.protection.outlook.com (40.107.201.1) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 20 Oct 2025 17:37:15 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rpXvks+ieB+Yl2OYu9UEToPnc+CGGG+IbMZxHZDtr+nAgFTsOuaPVyOFD9o9GDc8cdfRWdMKtjXPTGSHHLU6uanG/BoqmpJ4yw2alEeG/aUIo/AH+lieTMl++pjannXtI4et6Qczm2ROvgow529I+kIxs+A9Y2CdP6lROr3+WPe7SK/AmINPaJCxY8PzH2JFFEfkRMTzcm71xE+Et/fzeNUeIHjXdpu7etzVWCta5JkkhFoNJE0NJSt80qVWf+iNiQ3OqI6WmFaAc1IfHKgqXn68D9oTrnhMnhd4JZ4IiVPcLGHXbRcVqqcyhILhpDRB+IKjyKarotp3tIcfDLXzcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2DJv19V6pVD2gS7ef1bdhd4HEq8sAHCzrUR2dIYU950=;
 b=ZnrXmro8kl9wE4mXr/8xGIC+kLxepDhS7cs7ft3BqJcZQeOJwFAbrBGc1WsovJPunRgKdBI/T048ZDQWRf3ycpnBARFgol8As9XkrRDAZuHXWyVxKnC48yOieEy6pIXXMMsIQWONhtumL6GdHgUFeTK9JpR2IPObk7DXD5NSUG5OK4Nsu+hgeiEOrQZq7nXbjY09o8+I/1L5HDk241CSTBd23tyi9yavvHvRn/MjkCXklErXyWmSt6KvO8CimewoAIJT0vhw86VrvTAE7jcf/JaDTzeEKzab/39p6nvTgXBK8YpFikPJQAqM//9odGmL/dyWqnhEvLiFc9hiCxP0lQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5373.namprd11.prod.outlook.com (2603:10b6:5:394::7) by
 SJ2PR11MB8370.namprd11.prod.outlook.com (2603:10b6:a03:540::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.16; Tue, 21 Oct
 2025 00:37:13 +0000
Received: from DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::927a:9c08:26f7:5b39]) by DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::927a:9c08:26f7:5b39%5]) with mapi id 15.20.9228.016; Tue, 21 Oct 2025
 00:37:13 +0000
Date: Tue, 21 Oct 2025 02:37:08 +0200
From: =?utf-8?Q?Micha=C5=82?= Winiarski <michal.winiarski@intel.com>
To: Matthew Brost <matthew.brost@intel.com>
CC: Alex Williamson <alex.williamson@redhat.com>, Lucas De Marchi
 <lucas.demarchi@intel.com>, Thomas =?utf-8?Q?Hellstr=C3=B6m?=
 <thomas.hellstrom@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Jason Gunthorpe <jgg@ziepe.ca>, Yishai Hadas <yishaih@nvidia.com>, Kevin Tian
 <kevin.tian@intel.com>, Shameer Kolothum
 <shameerali.kolothum.thodi@huawei.com>, <intel-xe@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>, <kvm@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, Michal Wajdeczko
 <michal.wajdeczko@intel.com>, Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, Tvrtko Ursulin
 <tursulin@ursulin.net>, David Airlie <airlied@gmail.com>, Simona Vetter
 <simona@ffwll.ch>, Lukasz Laguna <lukasz.laguna@intel.com>
Subject: Re: [PATCH 09/26] drm/xe/pf: Expose VF migration data size over
 debugfs
Message-ID: <a34gq2vnvmfdyfpahbwkuupusr33nzl5y37e753fl2e7gug65i@rz3zzuynbw6f>
References: <20251011193847.1836454-1-michal.winiarski@intel.com>
 <20251011193847.1836454-10-michal.winiarski@intel.com>
 <aOv+SpcZvMQXWEc1@lstrano-desk.jf.intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aOv+SpcZvMQXWEc1@lstrano-desk.jf.intel.com>
X-ClientProxiedBy: VI1PR09CA0161.eurprd09.prod.outlook.com
 (2603:10a6:800:120::15) To DM4PR11MB5373.namprd11.prod.outlook.com
 (2603:10b6:5:394::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5373:EE_|SJ2PR11MB8370:EE_
X-MS-Office365-Filtering-Correlation-Id: dbcba04b-1805-49f3-1c09-08de1039f9dd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|7416014|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ZTdaelN6OWlhV3lnem1odWZJNXh5RUVDeFdOT0s1MElTNWsydmlESXNaMlgr?=
 =?utf-8?B?dGRMb1ljMU1IdTc5RHl2U0IxQWxCbHJBMnJiQzMzREpobkEvVFVVMzJZYkZ1?=
 =?utf-8?B?U0NFVy9ES2Y2aTBKbStnTHJXTjdINXBhcERwa1ZObmRjWXFRclo1TU5wVnlq?=
 =?utf-8?B?UE5HNmMyS3FPQm4wcnVzQXlwL0FLOUZqaUdDRkxmSnE0Wk13TkcwbWRIVkZz?=
 =?utf-8?B?ekZjZVdZQW5hUDJQbVBMZVRSakl1SUhBamZwUkUxdVVnMkNHRitodXM1SXor?=
 =?utf-8?B?bXBVUVY3czJieVZ4YzJrNENpSnFsSU9rK1c4R1A1czZ5dHlkQklQcGsyNjk0?=
 =?utf-8?B?cTZZWFBxUlFOSUJGQ2loL2VZMVdXaGkvQ2RaQVk1QkdUUEcvQWgrNGNLdlNX?=
 =?utf-8?B?M0hiN2lySzlmWFpXbEdqaDl0OUpSOStlQlBmR0FPUURTNm1XdjZITU5OcE82?=
 =?utf-8?B?cDVLRDZwQTlMRWJ5NEFreFMxUTVOeFlBNUhXZlBiWUtVT0ZST1BaaEU2cTlQ?=
 =?utf-8?B?a3pBZE5GMEcvNHo1SzZ1V0FwZlhjK1krUCt6QzluenNYTm04WmpaVjNHaGpu?=
 =?utf-8?B?cURlSHlUK2Q5QTNEb2hpWG5BYUFrVENid2plTHQvT0Y1WllFbDBCZDVRUGJk?=
 =?utf-8?B?OXNmWWFHR3dhUFFYcFptQjRIMlNqYzgvWE12Y0dOSXBGTVlLeWVwTUcyUERE?=
 =?utf-8?B?K25ReWZ2RTU5YUZIOEoyL2k1V3gyd3l2Qm5wUWhFUk8yck00MkNBM2tBMUYr?=
 =?utf-8?B?RkdJTEpCd0M5U0RxajRSeDZ3N2RRMGhyUk8vNXhma3luTlE1b001ak9JWEVW?=
 =?utf-8?B?bXh2ckFibmdtWm5aT1ZnSDNYL092aisvU3ZHeW1HbFJaR0Z4Snk4Q2JVTUVq?=
 =?utf-8?B?Skl4RVJ3TDZ5dTZWdi91aHEzOXhtUTFRL3djWkR6YWhmYUd1a2xZQno5SUNO?=
 =?utf-8?B?Y1JocVBnTlBNV2k3NEdiU3NTd2ZaM1JyK1lSUGVUL0dJZUdOUzQrNUk4Vmgv?=
 =?utf-8?B?K21Ed0VVbWFmNmx0NTFpVnVoRlpzWlFrOExnUm5ZT2NBdHRRUGVYY3R0d2Vy?=
 =?utf-8?B?eWRJNUtZK3lZTnV2cm53YWdCM0VHZjBGTFkwcm9IM0N2UWVCNHhwK0RCK0tM?=
 =?utf-8?B?cml0aVBCcmRsQlU1TndvVDhVVG5kWml3ZTN6Sjcxa0NyV0Rmc2pQSGFPa09W?=
 =?utf-8?B?WlZJWDlrSkpwK01XRlQzdFM0bkgrV01hZ2ZVL1pSTUxGUTcva3ltbWRySmgz?=
 =?utf-8?B?SGdJMC94MkNDcnNVaktXaXFZUkEwNm43cEMyVGl5dERHZjh0S0pQMkxRNEUw?=
 =?utf-8?B?Rlh1VTJyeVQrK1h3WTdxNUI1WUpUTDNTUCtrT0ZseEVUbjhPcHhhSzJrU0No?=
 =?utf-8?B?ZlA3TVRjYkZ5S1BFcUdSWHJmMUpPMEo2eWU3U0puZ1N0M1VsOHVCUHU3cXNW?=
 =?utf-8?B?M0M1Sm5MNXZFVTVmc3RiWHRJZnVQOWtGSkM3TG1lNnFHSWhGZlU4RmloS0Qw?=
 =?utf-8?B?WjRENTE4SEozcjEzNkkxa3BXOHluWGxJM2pFRTd3b0RhN3JXemdseFdaSVJW?=
 =?utf-8?B?M0RuVWhmcFJJTXIwUGw1MTcxM24xYlErK2tGTFZNUXg5REFqaFpQbENOcmdT?=
 =?utf-8?B?Mit1YWx4Sm81Z3VWNkFYMDl6Y0NHZWdza21xWXVsMXhVNW82Ky9EUTlQNTNC?=
 =?utf-8?B?aEoyQXN0RnFkeG5EU1I0ZnVaK3dkamJ2Q3ljRGpwWXZ0dktSUlRYanpuQnFi?=
 =?utf-8?B?WWtnOUVxUUsvcmtmNjNiUFVoeUcrMmRGZCtpVzdCVUtmUUxWU2R3K3k5d05U?=
 =?utf-8?B?VDF2bFZZQVJqbmR2V0taZTluR3BPcmtTWDJ2VC9raEdLRUhxaHFlYnhBbzBr?=
 =?utf-8?B?K0NGSlk3UUxuQVRtNDNmVElsT1VSdDdKdUIxdmg4cnFrcTh2N1RqYzNnZTVl?=
 =?utf-8?Q?IxyqFKRygtbgHE+7865sZWxasFuCzBxE?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5373.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(7416014)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?R1ZBMDF6TDhYYjNTMVZ5bXZMVGp0OXFSMVA0VTBVZ0VhNTkzYVRHc1VKcEJU?=
 =?utf-8?B?VDg1UW5Wcm9hclAwVExVNzlwVno5RXRYcm5nU3JJcGhlRWNNdTJHN0R5VUpV?=
 =?utf-8?B?Ly9ubno2S3RVRnBBSll1eExocUZXMFVvY1JDL2N6N1BSZVhBZjV6c0hERG10?=
 =?utf-8?B?aFk1N0xIN0h6SDYwaG9qbGoyREhnQ21seWFGRks4bDdZZ3lZY0Z6L2pUa0Vj?=
 =?utf-8?B?NW1ZeTNNakI2bnpXWTB2ME5jcnc0UFpRMVo4ZmxRZElRRFpaMkNPRlNFc09v?=
 =?utf-8?B?RnpReHByYmg5RGJXanVFYXBzeVlxdWdQRHdTb2xPdWlRK0w5K0JXS0JzdUFv?=
 =?utf-8?B?Z2hxZnhrMkVNTnRpSm5iVGtGZkRJYTk0RVFlbXA1eFlQN0RmTFMxUUtQSmhW?=
 =?utf-8?B?M1dubEV0TG0vL2ZUaFdpUkhNWEg0N3JaWTFRMmVLVStWY3F4cnJHSHhKT2NY?=
 =?utf-8?B?WG1HZ2FmYlc5TDZKVW5Vd2hob1FZVXA1RkZETlV3UWJPcFpRK2l1N1h3dHhO?=
 =?utf-8?B?TUQ5dU9EQkhORHV0R0MyWVh4UGVQSU8ycDJIWkthNWdzdWxuSUZtUzlGbUdT?=
 =?utf-8?B?TDRJRGg5NldVc2t3NmdIWi9ZdG9xb1pxcDE2VlQ1UmoyZGVDaU5CaXVFM3Rh?=
 =?utf-8?B?NUdGTk5LaVBIS3Btc25GK1dLaENQcEQ5bzF0UG5BelJNZk82VWExdVNaSTlE?=
 =?utf-8?B?QmdHMUlIS0p3REozZnE0TGVoMDA4UEtlb2JGTTQzMGMyVEZPckZYd28zK1R4?=
 =?utf-8?B?emxPck9QdWVnaUkyTWVJVXBnRGQ1VTNqSEFpbzlnS2laQi9IdGoyeXRXSzRw?=
 =?utf-8?B?TDBkQjdncXJKN2FJZm9pc1NoSjREZkdLTGE3Uzg5YjBENmJtc0ZVQWd1TVJX?=
 =?utf-8?B?SzhOa1oxSmhvNlNCLzhtcDFGR3NZSUozM3dZZGRGVGF4R21ub096NGJQN0gz?=
 =?utf-8?B?VGdBcitNcjErbHBBSzlCVFNWczZMV29maDBKVzJvc1BVYld0Yk9GK2w5c3VQ?=
 =?utf-8?B?R1E4eXcvRmRieWpZZXdPNDQvQXN3RDJ4QWtSMkpDM1AxbkxxWDRqSVRZbWkv?=
 =?utf-8?B?UmFlM2pXelRrcEFOWTBmRnp6RUo0YzVGT0U0aVIrQStuVkd2d25QWVRRaVFl?=
 =?utf-8?B?eVdtSnljc0Mvdm80cnZVcDUya1JFODd0cHlXOTQ0V3FSZThDTmw5OXVPZjBS?=
 =?utf-8?B?OHVXV0tlaUVVMjNleFlDajE4K0tKb1ZyUDBnNlc3TjlFYVRsQmkwSUo1WnNM?=
 =?utf-8?B?WTJNUkJQYlZJWVA1bTR4REx2UUkyTTlHcHNIa2NwekpMY3hseTZzMXp1UDR5?=
 =?utf-8?B?UmNsWGR2YUNCOStLK0RHN1hMbHhXdDA4dHprVnVOYkVzZlFJa2p3TFd6N21Y?=
 =?utf-8?B?ZXhZaTBNcUdXN2FYbk10Nnp1aHBNWWlqdktVQ3A3VmUyalVoWjlGbTNxeVlO?=
 =?utf-8?B?TFpGdllIaUhEN2VxUGh0RDYwZ0YwdEszL1N5M1VCcXdqbUR3dmJzM2JMZFFB?=
 =?utf-8?B?a1VEeGNqVnVnekQxWkhXc25JNjJXNlJYQ1hFclRIQ1h6a3licGdzS1dmTUhM?=
 =?utf-8?B?VzNHQktxN0lRS3kzblkvKzhnT3QveUgwYWpLeWg0MGdod3lsa2pNUkJ0STNR?=
 =?utf-8?B?ZEtuY1UxSWR1bUxweHBKUTBxdUEvS013T0dUWEM5c0pid2NydnN3dnZrNE5S?=
 =?utf-8?B?RXgyR3Z0UUpUVlpHTVpxNVU1a0doRnM4SFNoeFpXWEcwTEE3bG0zWWtwZGJh?=
 =?utf-8?B?eDgzYU41aHh0TENxQzFaa0RtSDNOaVRHUGI2YlhYNkFyRmRzanIxaUwrN0dL?=
 =?utf-8?B?L2FqeUJJT1EzY1hKbnFDZzdqRk1sQjhXeW5BL1FZQ3dWNWFsS04wbE5pMG4y?=
 =?utf-8?B?d21vS3kwR2E3Z0JWYWRGOWVLWFY1azRiWTNPdEZXbHoxKzRiV2RDY0M0ekFM?=
 =?utf-8?B?VnV4RFU0VDduZlZhWXRBNDRoWlBxWlJ4Z2RPeld0blpiWC9CRUtUV2lyWkpD?=
 =?utf-8?B?Z21Cc1huaFlzTjVNelVKVEVzMVd5K0RsZndoNW81WHlGMmNaMytUM0xaZ29q?=
 =?utf-8?B?d3VVekpJSXpwL09OTlJUNTVUUnlnRDZDN3NzV0lQQmN3dXh1aHIzdWVsRHVG?=
 =?utf-8?B?VlhPdFBhdTlMRXdBUXVjQno2TU1ZU2lkY3UvMUJ0YzB2RmYzYkVqalVNUkx1?=
 =?utf-8?B?UFE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: dbcba04b-1805-49f3-1c09-08de1039f9dd
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5373.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Oct 2025 00:37:12.9188 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QA2UjiLMoau+YaF5eTBpLkQnidaB42mk39M/B8D9xAVSUnhj3N+UTqjkVU6Lg9QuFMV1F9PbREk+KCChb5NQecDJ/1EMwa38mRlL4N24rRg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB8370
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

On Sun, Oct 12, 2025 at 12:15:22PM -0700, Matthew Brost wrote:
> On Sat, Oct 11, 2025 at 09:38:30PM +0200, Michał Winiarski wrote:
> > The size is normally used to make a decision on when to stop the device
> > (mainly when it's in a pre_copy state).
> > 
> > Signed-off-by: Michał Winiarski <michal.winiarski@intel.com>
> > ---
> >  drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c | 18 ++++++++++
> >  drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.h |  2 ++
> >  drivers/gpu/drm/xe/xe_sriov_pf_debugfs.c      | 34 +++++++++++++++++++
> >  drivers/gpu/drm/xe/xe_sriov_pf_migration.c    | 30 ++++++++++++++++
> >  drivers/gpu/drm/xe/xe_sriov_pf_migration.h    |  1 +
> >  5 files changed, 85 insertions(+)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c
> > index 582aaf062cbd4..50f09994e2854 100644
> > --- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c
> > +++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c
> > @@ -395,6 +395,24 @@ ssize_t xe_gt_sriov_pf_migration_write_guc_state(struct xe_gt *gt, unsigned int
> >  }
> >  #endif /* CONFIG_DEBUG_FS */
> >  
> > +/**
> > + * xe_gt_sriov_pf_migration_size() - Total size of migration data from all components within a GT
> > + * @gt: the &struct xe_gt
> > + * @vfid: the VF identifier
> > + *
> > + * This function is for PF only.
> > + *
> > + * Return: total migration data size in bytes or a negative error code on failure.
> > + */
> > +ssize_t xe_gt_sriov_pf_migration_size(struct xe_gt *gt, unsigned int vfid)
> > +{
> > +	ssize_t total = 0;
> > +
> > +	xe_gt_assert(gt, IS_SRIOV_PF(gt_to_xe(gt)));
> > +
> > +	return total;
> > +}
> > +
> >  /**
> >   * xe_gt_sriov_pf_migration_ring_empty() - Check if a migration ring is empty
> >   * @gt: the &struct xe_gt
> > diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.h b/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.h
> > index 1e4dc46413823..e5298d35d7d7e 100644
> > --- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.h
> > +++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.h
> > @@ -15,6 +15,8 @@ int xe_gt_sriov_pf_migration_init(struct xe_gt *gt);
> >  int xe_gt_sriov_pf_migration_save_guc_state(struct xe_gt *gt, unsigned int vfid);
> >  int xe_gt_sriov_pf_migration_restore_guc_state(struct xe_gt *gt, unsigned int vfid);
> >  
> > +ssize_t xe_gt_sriov_pf_migration_size(struct xe_gt *gt, unsigned int vfid);
> > +
> >  bool xe_gt_sriov_pf_migration_ring_empty(struct xe_gt *gt, unsigned int vfid);
> >  int xe_gt_sriov_pf_migration_ring_produce(struct xe_gt *gt, unsigned int vfid,
> >  					  struct xe_sriov_pf_migration_data *data);
> > diff --git a/drivers/gpu/drm/xe/xe_sriov_pf_debugfs.c b/drivers/gpu/drm/xe/xe_sriov_pf_debugfs.c
> > index ce780719760a6..b06e893fe54cf 100644
> > --- a/drivers/gpu/drm/xe/xe_sriov_pf_debugfs.c
> > +++ b/drivers/gpu/drm/xe/xe_sriov_pf_debugfs.c
> > @@ -13,6 +13,7 @@
> >  #include "xe_sriov_pf_control.h"
> >  #include "xe_sriov_pf_debugfs.h"
> >  #include "xe_sriov_pf_helpers.h"
> > +#include "xe_sriov_pf_migration.h"
> >  #include "xe_sriov_pf_migration_data.h"
> >  #include "xe_sriov_pf_service.h"
> >  #include "xe_sriov_printk.h"
> > @@ -203,6 +204,38 @@ static const struct file_operations data_vf_fops = {
> >  	.llseek		= default_llseek,
> >  };
> >  
> > +static ssize_t size_read(struct file *file, char __user *ubuf, size_t count, loff_t *ppos)
> > +{
> > +	struct dentry *dent = file_dentry(file);
> > +	struct dentry *vfdentry = dent->d_parent;
> > +	struct dentry *migration_dentry = vfdentry->d_parent;
> > +	unsigned int vfid = (uintptr_t)vfdentry->d_inode->i_private;
> > +	struct xe_device *xe = migration_dentry->d_inode->i_private;
> > +	char buf[21];
> > +	ssize_t ret;
> > +	int len;
> > +
> > +	xe_assert(xe, vfid);
> > +	xe_sriov_pf_assert_vfid(xe, vfid);
> > +
> > +	xe_pm_runtime_get(xe);
> 
> You don't need a PM ref here as this is purely software (i.e, the
> hardware is not touched).

Not in the case of GuC migration data size. While in this patch GuC is
not yet present as a migration data resource, we should assume that
xe_sriov_pf_migration_size needs a PM ref.

Thanks,
-Michał

> 
> Matt
> 
> > +	ret = xe_sriov_pf_migration_size(xe, vfid);
> > +	xe_pm_runtime_put(xe);
> > +	if (ret < 0)
> > +		return ret;
> > +
> > +	len = scnprintf(buf, sizeof(buf), "%zd\n", ret);
> > +
> > +	return simple_read_from_buffer(ubuf, count, ppos, buf, len);
> > +}
> > +
> > +static const struct file_operations size_vf_fops = {
> > +	.owner		= THIS_MODULE,
> > +	.open		= simple_open,
> > +	.read		= size_read,
> > +	.llseek		= default_llseek,
> > +};
> > +
> >  static void pf_populate_vf(struct xe_device *xe, struct dentry *vfdent)
> >  {
> >  	debugfs_create_file("pause", 0200, vfdent, xe, &pause_vf_fops);
> > @@ -212,6 +245,7 @@ static void pf_populate_vf(struct xe_device *xe, struct dentry *vfdent)
> >  	debugfs_create_file("save", 0600, vfdent, xe, &save_vf_fops);
> >  	debugfs_create_file("restore", 0600, vfdent, xe, &restore_vf_fops);
> >  	debugfs_create_file("migration_data", 0600, vfdent, xe, &data_vf_fops);
> > +	debugfs_create_file("migration_size", 0400, vfdent, xe, &size_vf_fops);
> >  }
> >  
> >  static void pf_populate_with_tiles(struct xe_device *xe, struct dentry *dent, unsigned int vfid)
> > diff --git a/drivers/gpu/drm/xe/xe_sriov_pf_migration.c b/drivers/gpu/drm/xe/xe_sriov_pf_migration.c
> > index a0cfac456ba0b..6b247581dec65 100644
> > --- a/drivers/gpu/drm/xe/xe_sriov_pf_migration.c
> > +++ b/drivers/gpu/drm/xe/xe_sriov_pf_migration.c
> > @@ -249,3 +249,33 @@ int xe_sriov_pf_migration_produce(struct xe_device *xe, unsigned int vfid,
> >  
> >  	return xe_gt_sriov_pf_migration_ring_produce(gt, vfid, data);
> >  }
> > +
> > +/**
> > + * xe_sriov_pf_migration_size() - Total size of migration data from all components within a device
> > + * @xe: the &struct xe_device
> > + * @vfid: the VF identifier
> > + *
> > + * This function is for PF only.
> > + *
> > + * Return: total migration data size in bytes or a negative error code on failure.
> > + */
> > +ssize_t xe_sriov_pf_migration_size(struct xe_device *xe, unsigned int vfid)
> > +{
> > +	size_t size = 0;
> > +	struct xe_gt *gt;
> > +	ssize_t ret;
> > +	u8 gt_id;
> > +
> > +	xe_assert(xe, IS_SRIOV_PF(xe));
> > +
> > +	for_each_gt(gt, xe, gt_id) {
> > +		ret = xe_gt_sriov_pf_migration_size(gt, vfid);
> > +		if (ret < 0) {
> > +			size = ret;
> > +			break;
> > +		}
> > +		size += ret;
> > +	}
> > +
> > +	return size;
> > +}
> > diff --git a/drivers/gpu/drm/xe/xe_sriov_pf_migration.h b/drivers/gpu/drm/xe/xe_sriov_pf_migration.h
> > index f2020ba19c2da..887ea3e9632bd 100644
> > --- a/drivers/gpu/drm/xe/xe_sriov_pf_migration.h
> > +++ b/drivers/gpu/drm/xe/xe_sriov_pf_migration.h
> > @@ -14,6 +14,7 @@ struct xe_device;
> >  #ifdef CONFIG_PCI_IOV
> >  int xe_sriov_pf_migration_init(struct xe_device *xe);
> >  bool xe_sriov_pf_migration_supported(struct xe_device *xe);
> > +ssize_t xe_sriov_pf_migration_size(struct xe_device *xe, unsigned int vfid);
> >  struct xe_sriov_pf_migration_data *
> >  xe_sriov_pf_migration_consume(struct xe_device *xe, unsigned int vfid);
> >  int xe_sriov_pf_migration_produce(struct xe_device *xe, unsigned int vfid,
> > -- 
> > 2.50.1
> > 
