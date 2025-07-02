Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AF7EAF0B9D
	for <lists+dri-devel@lfdr.de>; Wed,  2 Jul 2025 08:25:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2701010E106;
	Wed,  2 Jul 2025 06:25:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CLfZsY+a";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8CF1110E30F;
 Wed,  2 Jul 2025 06:24:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1751437500; x=1782973500;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=dQN3XBJVtSh1I7ZdFQM0VLOkDTYnl1OWNo+oJ99LXV4=;
 b=CLfZsY+afZEUM9NJ/SjahACVhqWM5v2Z5O9nEiOqnugm75y90Ica4F80
 ItWT/bOy/oW1tP5zlBmgf0RYi97lprxJ1exhzYVxd8qVQG70tvlAULxOL
 Pv925sbwBNzrYWQP1jtGO9OtvfbK7oUR9jiI3pmn7Fl9k2qd0Lv59k8Gf
 sgKbwD48fbizCFD3/iP1PI87b5Eq4aIPgZoZP/7vUM/IcWUJE88lgkMJL
 h5c/WkQZUTCH64fLhUSx5Tc9m1y5ucjUkd7qOf8W5cC7ANI4Gg/uO8l0n
 dFUemR168lb6EClgdM6p3/IiUOaYZ92HE+HH500W/wS7SUq3puTk2GvS0 Q==;
X-CSE-ConnectionGUID: inVpWOJmQiSFZ+DyNJ2q3Q==
X-CSE-MsgGUID: yuEGs9OmT2arXoDDORVPjA==
X-IronPort-AV: E=McAfee;i="6800,10657,11481"; a="53812154"
X-IronPort-AV: E=Sophos;i="6.16,281,1744095600"; d="scan'208";a="53812154"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jul 2025 23:24:59 -0700
X-CSE-ConnectionGUID: ghe6A9A8RAO5Lr51HaGvOw==
X-CSE-MsgGUID: s06qyli8T2ibCRcRLht1RQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,281,1744095600"; d="scan'208";a="153761520"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jul 2025 23:24:58 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Tue, 1 Jul 2025 23:24:58 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Tue, 1 Jul 2025 23:24:58 -0700
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (40.107.102.87)
 by edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Tue, 1 Jul 2025 23:24:57 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=i1NryTgakFOmgjWEVl+CU52Rd4nIVo15A2U0ZquQlaOFTafOvXtHSizQ//jXP5uvfLTWbPMPtuyfo/t9Vnxg4d5vrl6qcCJF3xUi+mRzvM6uqz+jw9fCkfmP4/n4rHspLPrQ5F0HAJef4aKgva+Q2CAmumfZ5XB/QyHRtOhGYTAOABX2laCFydAiJUsPgERazygepLPE4V30qBbdeHu4MgTtwdAmOta6/7+4PjdrjdpbWUDTM7c3lSxCZTpjCvHYvaclCC4HeeWSr5SjAQ7ZAyEgjyZI42G3Os1R5V81Kh3MRh5NSFCXzZu+niABo4628s5yQmj+9ZTAiUf/c+sZzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dQN3XBJVtSh1I7ZdFQM0VLOkDTYnl1OWNo+oJ99LXV4=;
 b=EZPuH9SKjEWKgjp7idY3BuIFeaJWtixfkCnZCmJiBRTIgS2K6dfIwiPtwVzufklgvCuHN9ILmuypPrrR648uiHsk3vcHHnJe1PJELm/lyiN8tKyKQqHM6+fSqA/IvEoF/X2IfrdpqEtBSqhxHZI333g3yW9CBE+0EPEAr3K2wxz6Rx5oUikKROr54dmLnAC+kxF1n9NmbPtBAAKa8/liXcXzwKsZY4jzroE1TzJ48vLif0oKdmeb3Yw0EukslEp1UQOVgjb57dqac1qMDvlBu9BviCnFh0YhnLm9pJdmRJT+W+Pj0DKU7qH0V2Ajl6Yb/fTWoAathuQwfIaWMWtDZg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CY5PR11MB6366.namprd11.prod.outlook.com (2603:10b6:930:3a::8)
 by IA4PR11MB9132.namprd11.prod.outlook.com (2603:10b6:208:56d::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.28; Wed, 2 Jul
 2025 06:24:55 +0000
Received: from CY5PR11MB6366.namprd11.prod.outlook.com
 ([fe80::6826:6928:9e6:d778]) by CY5PR11MB6366.namprd11.prod.outlook.com
 ([fe80::6826:6928:9e6:d778%5]) with mapi id 15.20.8901.018; Wed, 2 Jul 2025
 06:24:55 +0000
From: "Usyskin, Alexander" <alexander.usyskin@intel.com>
To: "Vivi, Rodrigo" <rodrigo.vivi@intel.com>, "Nilawar, Badal"
 <badal.nilawar@intel.com>
CC: Greg KH <gregkh@linuxfoundation.org>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "Gupta, Anshuman" <anshuman.gupta@intel.com>, 
 "Ceraolo Spurio, Daniele" <daniele.ceraolospurio@intel.com>
Subject: RE: [PATCH v4 02/10] mei: late_bind: add late binding component driver
Thread-Topic: [PATCH v4 02/10] mei: late_bind: add late binding component
 driver
Thread-Index: AQHb5fIovEVVgypf8kmRHl0YtfTjo7QYgX4AgAR36YCAABR1AIAALxsAgABFPwCAAA7SgIAA1oPw
Date: Wed, 2 Jul 2025 06:24:55 +0000
Message-ID: <CY5PR11MB63666F0FDDB0C69CB7D11981ED40A@CY5PR11MB6366.namprd11.prod.outlook.com>
References: <20250625170015.33912-1-badal.nilawar@intel.com>
 <20250625170015.33912-3-badal.nilawar@intel.com>
 <2025062834-scraggly-barracuda-7ea6@gregkh>
 <205cc43a-4254-4d27-9b4f-139006e871e4@intel.com>
 <2025070140-dad-jaywalker-0774@gregkh>
 <eab7307a-d6a2-402b-945b-674e9c5f608b@intel.com>
 <c48b565e-73c9-4222-83b6-dc3597427db6@intel.com> <aGQcQbiqDxKplFZO@intel.com>
In-Reply-To: <aGQcQbiqDxKplFZO@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY5PR11MB6366:EE_|IA4PR11MB9132:EE_
x-ms-office365-filtering-correlation-id: 62dd7a7d-8f62-4fb2-64ae-08ddb9312962
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|1800799024|376014|366016|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?TC80c0pzWnlCLytDRHB3T1pON2xOekhWbytGbE9POVliVldBWlZyMEFVR2Z5?=
 =?utf-8?B?VGpaelpuR28zeGZTTEhHWnBBZlFyR3NZSGpzS3VCSFRySExNTU5Mc0lBcXdv?=
 =?utf-8?B?QmhhSjAzSThpSGF6QU5POHVMM01WbitJbVFiYStId3dFVkRHWXBFWVh0eWhy?=
 =?utf-8?B?ZmI2Y3ZteStwS0Fzd3FYWUVqbExod002TFRPaFVmQzNYNnozaDBJRUhxQ2Vl?=
 =?utf-8?B?a2VpV1RtSHUxbUNXT3k4RVErUTVvd0w0YkR2NGJNVXpwQ0V2YXN0Qm5JN2xm?=
 =?utf-8?B?Y0dGaXBVVUdnWWF2Y2ZsZjNBa2EzYmFpOFlZOWg0RWZUUXZNTDExdXJKKzZD?=
 =?utf-8?B?VGJZUTgyT1ZBUzc2ZnM3ZVFYRElxUHZRTWEydFc5TmxRSUFHems4SzJHOS9Q?=
 =?utf-8?B?NGZBTXRNUytmajFkWWdnNE9JdVk0WFhGNXRtakNCYWpsL29JK09jME5NeUR0?=
 =?utf-8?B?T0cwNVRleUpYa0x4SWdoUFlqZG16dUxzaG5tMWdaNEJLbEtBeExjR3RveDZl?=
 =?utf-8?B?ZEszcVFaclNONFJTMVZUeHlha2daODR4VUhscS9GYWZQMjMzYjZsc2JZTzZP?=
 =?utf-8?B?YnJyR0V5TXZCN2NNdTN4OVM1eFdxNFlSMEZxRlFNNnVaTzFZcm8vWFZLTjN0?=
 =?utf-8?B?V1pqQlRJNjhPUXJZWUtQVEhPaFFlTXRpdnpsOVRnZ1hIMUhaWGVBSWpUM0p5?=
 =?utf-8?B?dEp6Y3N0Q0sxYWx2TmRxZHpGTjV2QzdDTkcvSnBpLzNCRlZ2bVF3K1B1dVRt?=
 =?utf-8?B?clQ3cWxSQVlXd0JFM2QrT0twM09XQzVQQks5SG9KYmVZYjVYa3RJRXVzcEpZ?=
 =?utf-8?B?NG9VWHdENTlnSUVlSzBhcjhvdkxkRll4Mkp2QU13a1ZnVXRHMDdQNlJlOEpo?=
 =?utf-8?B?d25wUkVkNUxWMC9CR3NuYTJyMEZIaFNYaUQ1Mk5QTWtWazRaUjBIL2tRb3o4?=
 =?utf-8?B?dVRDa3hDRWo1TTBiZmFWZEpxOVE1aFdkNzBwOHdWeXFhY3A2WHVxcEhBenBW?=
 =?utf-8?B?aUdSVmZ5WGJCOWdkRjB5Wkh6ei95OVBmUXZpd1FTWGhISnN2VVhpenBPbWFy?=
 =?utf-8?B?ZW9pdDJuL1p1ek5xekJYWWUyYjR6R1p2ZkR3VTNOSURYLzROUmFHSjB1SGYw?=
 =?utf-8?B?cEIzbmZ1TzBCN3pJZXhJUU1DbTNZVU1JMUJXK3BYUTNQSzc5dFkrVXY4TGZt?=
 =?utf-8?B?a3d2UXlGU0M5UDNQenJiUVFXSEhLYXEzSHNwRjg1cFVsOGpQYy9DcVdUa1VQ?=
 =?utf-8?B?c3hWcEZINUt2QlJDYUM1QngrMnU1eTRnZ3o1aXJCQUpwNmMrZWp4WkdkSXJn?=
 =?utf-8?B?OFhaVkd4WWtiWFFHQndibE9kbGxadmZQTG5EYzlReUV0cGUvT0Q0Q2lVaVg5?=
 =?utf-8?B?cjFRQWwrZmVkSVdUektDYXlnS1IxclRDYy9KSzhXSkhndGNnSElzUk1XTTBa?=
 =?utf-8?B?RjZUck9NQTJUaForcmdZVUt6RVdhODJTdjMrMThyMStGZDAwYjdOQmpucSs2?=
 =?utf-8?B?NnNERmhXVUFLbHVFWHNNd1VER0VtSmF3RCt4VGdzT2EyVW9PdlVrYjNSbXNU?=
 =?utf-8?B?dCtLWTNseVpWOVdsU2UxempnT2ZFMzF2Z0duSU9BSWVvNk5obkQ5Snl1Q2F4?=
 =?utf-8?B?OGNZNHMyM0EwVGhPT2ExZ3ZiOGhwLzh6d2puS21zVElIUUtQRkoxK3l1YlVw?=
 =?utf-8?B?Z0NsMmFqSWJiT2V6V2hRcnEzTmZmZHBIdVVuajEzVTBSTm01WTZTQmFOY0Ro?=
 =?utf-8?B?cGVQRmliRDQ3ejl5TnRRU1JOL0xRdllJTCtvd0hoMHFIdzUydndKcUxzNTNM?=
 =?utf-8?B?RnhsaUVUNGFFTjgzQk5ySTdDbFFlbkhXMVFwZWNaaXk4OEw4SFdXS3llMy9S?=
 =?utf-8?B?OHlzdG5lMnh1b2FldVZpdzVJMkJ1OGxnQUZ2ckl6VjVYYlk5Z3hBekpxS0Rt?=
 =?utf-8?B?N3JNUDN0b0EyekxQSzhib3NzMGxoekNKKzM3Y0xwNHMycmZXTHRIdFZqM0JC?=
 =?utf-8?Q?dMpaT9clal3rjSciWQW3MWQCUxTv8Q=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6366.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?R2VrSzhDNnYxRE9UMmlKYzZYQnZMRCtGZDRwZmswUUxUQSs1NXFJVDRBM284?=
 =?utf-8?B?N3RPODRSSUFFQ1dDNlM5SWxsWmpXZXJKRyt5aEs0QlVDN3ZvMVNyU1U3SXU3?=
 =?utf-8?B?QkJhZ2t5bWxVamVIYnVvVXMwcW9wNzdadFhOVnNnd3BrNVVqanNlMS9OclQy?=
 =?utf-8?B?akE1K2pvVGxEZTNPSGphYTMxOERFamhJRDkvMUlkamlLVDZLTXNYbEYySVBn?=
 =?utf-8?B?enlWWVdjSDJSTnVwK0tQclZqZTNYelZQTVlpNENmdUxad3lhaU1BZUppWnNw?=
 =?utf-8?B?a1czWE1aVTVQeVp3TVpaUXNSeHIyaldCM2J6SldmY2R2a1NjNEFPTlVCTFpU?=
 =?utf-8?B?RnRZOTE5eTNuSnRjZGorR21XdWNveUppd0VET0pvM21INjIwK0Y2cGxwL3pn?=
 =?utf-8?B?bFp2M1BpK0syNUh4a1lMeVl1bU4ydHNmK3JRa2pyYXNUWE94UndXZktteHFw?=
 =?utf-8?B?SEN3SlEzYllVcXJXRzF2QmRSMEhXajJaRUg5dzFUcE9kWWo0Q29MUWxNanN1?=
 =?utf-8?B?N3FFQVZ0YjY2b1A0RExxaE8zOGhsSGY1eWRTSlhNZHU4aDdldHE5ckppSmlv?=
 =?utf-8?B?bnVnN2hMUVRZd0dFQlAvQkI0Vjkya3lLM3NTUnczY3BJcTFHdWhKUVRhZmh2?=
 =?utf-8?B?SkJxMjY3NnJFL3ExN09lU29lMTNmTldEQkZMK1FyME1EZDd6SUkzTGlPZWd6?=
 =?utf-8?B?M2pwc3NXc1M2MU1OUmtHSThqSGNZUkFIcG5CNTZiamU4Wk4yUEo1OC9TaHNK?=
 =?utf-8?B?c0hVQmI2TzN4eGNVdkxUK1pHdmh3dnRiV1JzSEVZWm5Zd09PQzFoU3FjNDRV?=
 =?utf-8?B?SHU0ZFQrME1hY0M2eHBaRFRqUUQyZk9zQzhiQ2xPeC9mOVd0dTlpVHJXZ01V?=
 =?utf-8?B?SEg2MzYxcFRueklqeVFtVldWcSsvUHVhRDd1UVBnalpBY3ExOFZJdjBuMnVn?=
 =?utf-8?B?UnF3TE9VcHJ4OHExdW1WaWF3Ri9HZTdtKzRWYndqY0YzVlo0WDU2RjVMNTlM?=
 =?utf-8?B?OFBnb3dIUm9xNDZDa1cxaDhhMWh3WWdCTXpDT04xMFdwekZZcExVdklDajdj?=
 =?utf-8?B?U0wrWCtVUnV1OURhaTJOSkJMMjlBTXl0SXV3Y3ZVRUVLbFR5bmNPUUorUS8x?=
 =?utf-8?B?cHBreWRLWXVIVEZXc0QwQjQ2cG9pbUh2R282RXdGSTVFQU5QTXF4dGpPK2VR?=
 =?utf-8?B?U2g1dnc2TGlEMk5PMmJQcWNDcVM3L2t0Q0Z6OWtMUDFXQThseWhiaDJOYlBS?=
 =?utf-8?B?eVlZTEJNcTZCWlhaVktmSkJVZkc2S3RpSXQvZEZteVF1VnJBS01mUHNnbEE4?=
 =?utf-8?B?NnhEOG1hSmR3WjNYWTJZcGRoMzAyMVFiMm9YdEQxSWt2V21lWlJ3THpCNlBu?=
 =?utf-8?B?TWdMU1pNNzFTQ1pnNllNMk9YSTJLWlpSYU5zWEh4bVVXQWVDQlRMS3RTanBt?=
 =?utf-8?B?ckplUTRVYlQvVGlzajl6bnlJSFJTdmtTQzRJcjhOQi9sQ2oyR3QwcThhT1Ew?=
 =?utf-8?B?d0Q5bHZKQnJnQ1dZWUZPNmZFTnNFSW4wZ2VteGhwanBxUFlmRklUZWtUMmdz?=
 =?utf-8?B?TVVHMEo1OU5DNm9uVVJUSUhVSlBSMnJjdTlQOFpXOFEzUkF2bEVaSm5iR3Fv?=
 =?utf-8?B?MWl5YkpzeSs2RWFUbmQyU2Mwd2ZXNnNpWVE0SnBuNXNJcEt3a2E4NkxJV0pO?=
 =?utf-8?B?SmZ0bU00L3BFclc4R1NPU2lWY1RMcmY0ZVRieEhLN3l2UTFjdUlaOG5KYkg0?=
 =?utf-8?B?bGhWdnhSWG8zY3pjc2VrV2EwNWhiQ0NoRkZ6WlVuRm9Rc0lEUzBHSXpXUHho?=
 =?utf-8?B?VGdDS290RmI0K1BGS3FMRldkT3FmQ2JWbklqUzdDSGtJRmVMMk5CNDhTQWI1?=
 =?utf-8?B?cXZsT2tpdlVqemdTTnVxa2s3OFRWY3hlZXJCN3lwRzVYK3grRHlDZFdYSkIr?=
 =?utf-8?B?M2lISDI3cnJQaDlmVndONjYwbmFHQkVnaXdSUk9tcGNtWEVxS2p0UU0vVGVI?=
 =?utf-8?B?aUFORGRBUUpPRi9oSlhFMy9lUVN2YXdRMmQ5b05hUmhSOUs4SWVjQmdiNCtw?=
 =?utf-8?B?WThCeDQ1aUFuQ1Uzbjl4RFY1eHFyK3VhaDJtUFIrRTBtU2VCZ3hnS0gxbVVB?=
 =?utf-8?Q?F8UHdY6DwlFzVDL2WSt0G44oi?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6366.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 62dd7a7d-8f62-4fb2-64ae-08ddb9312962
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Jul 2025 06:24:55.4803 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: sodJy1YBRN1c39ksBpO5lW/3BdJyTgPzkOdgMTH8E2qddykfmzRmcgfSdDDoL3HlZEdad06nF0ZvywtvXHGsiPHS0Ii0xeKwsHbruKwloqA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA4PR11MB9132
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

PiBTdWJqZWN0OiBSZTogW1BBVENIIHY0IDAyLzEwXSBtZWk6IGxhdGVfYmluZDogYWRkIGxhdGUg
YmluZGluZyBjb21wb25lbnQNCj4gZHJpdmVyDQo+IA0KPiBPbiBUdWUsIEp1bCAwMSwgMjAyNSBh
dCAxMDoxMTo1NFBNICswNTMwLCBOaWxhd2FyLCBCYWRhbCB3cm90ZToNCj4gPg0KPiA+IE9uIDAx
LTA3LTIwMjUgMTg6MDQsIE5pbGF3YXIsIEJhZGFsIHdyb3RlOg0KPiA+ID4NCj4gPiA+IE9uIDAx
LTA3LTIwMjUgMTU6MTUsIEdyZWcgS0ggd3JvdGU6DQo+ID4gPiA+IE9uIFR1ZSwgSnVsIDAxLCAy
MDI1IGF0IDAyOjAyOjE1UE0gKzA1MzAsIE5pbGF3YXIsIEJhZGFsIHdyb3RlOg0KPiA+ID4gPiA+
IE9uIDI4LTA2LTIwMjUgMTc6NDgsIEdyZWcgS0ggd3JvdGU6DQo+ID4gPiA+ID4gPiA+ICsgKiBA
cGF5bG9hZF9zaXplOiBzaXplIG9mIHRoZSBwYXlsb2FkIGRhdGEgaW4gYnl0ZXMNCj4gPiA+ID4g
PiA+ID4gKyAqIEBwYXlsb2FkOiBkYXRhIHRvIGJlIHNlbnQgdG8gdGhlIGZpcm13YXJlDQo+ID4g
PiA+ID4gPiA+ICsgKi8NCj4gPiA+ID4gPiA+ID4gK3N0cnVjdCBjc2NfaGVjaV9sYXRlX2JpbmRf
cmVxIHsNCj4gPiA+ID4gPiA+ID4gK8KgwqDCoCBzdHJ1Y3QgbWtoaV9tc2dfaGRyIGhlYWRlcjsN
Cj4gPiA+ID4gPiA+ID4gK8KgwqDCoCB1MzIgdHlwZTsNCj4gPiA+ID4gPiA+ID4gK8KgwqDCoCB1
MzIgZmxhZ3M7DQo+ID4gPiA+ID4gPiBXaGF0IGlzIHRoZSBlbmRpYW4gb2YgdGhlc2UgZmllbGRz
P8KgIEFuZCBhcyB0aGlzIGNyb3NzZXMgdGhlDQo+ID4gPiA+ID4gPiBrZXJuZWwvaGFyZHdhcmUg
Ym91bmRyeSwgc2hvdWxkbid0IHRoZXNlIGJlIF9fdTMyPw0KPiA+ID4gPiA+IGVuZGlhbiBvZiB0
aGVzZSBmaWVsZHMgaXMgbGl0dGxlIGVuZGlhbiwgYWxsIHRoZSBoZWFkZXJzIGFyZQ0KPiA+ID4g
PiA+IGxpdHRsZSBlbmRpYW4uDQo+ID4gPiA+ID4gSSB3aWxsIGFkZCBjb21tZW50IGF0IHRvcC4N
Cj4gPiA+ID4gTm8sIHVzZSB0aGUgcHJvcGVyIHR5cGVzIGlmIHRoaXMgaXMgbGl0dGxlIGVuZGlh
bi7CoCBEb24ndCByZWx5IG9uIGENCj4gPiA+ID4gY29tbWVudCB0byBjYXRjaCB0aGluZ3Mgd2hl
biBpdCBnb2VzIHdyb25nLg0KPiA+ID4gPg0KPiA+ID4gPiA+IE9uIF9fdTMyIEkgZG91YnQgd2Ug
bmVlZCB0byBkbyBpdCBhcyBjc2Mgc2VuZCBjb3B5IGl0IHRvDQo+ID4gPiA+ID4gaW50ZXJuYWwg
YnVmZmVyLg0KPiA+ID4gPiBJZiB0aGlzIGNyb3NzZXMgdGhlIGtlcm5lbCBib3VuZHJ5LCBpdCBu
ZWVkcyB0byB1c2UgdGhlIHByb3BlciB0eXBlLg0KPiA+ID4NCj4gPiA+IFVuZGVyc3Rvb2QuIEkg
d2lsbCBwcm9jZWVkIHdpdGggdXNpbmcgX19sZTMyIGluIHRoaXMgY29udGV4dCwgcHJvdmlkZWQN
Cj4gPiA+IHRoYXQgU2FzaGEgYWdyZWVzLg0KPiA+DQo+ID4gSSBiZWxpZXZlIF9fbGV7MzIsIDE2
fSBpcyB1c2VkIG9ubHkgd2hlbiB0aGUgYnl0ZSBvcmRlciBpcyBmaXhlZCBhbmQgbWF0Y2hlcw0K
PiA+IHRoZSBob3N0IHN5c3RlbSdzIG5hdGl2ZSBlbmRpYW5uZXNzLiBTaW5jZSB0aGUgQ1NDIGNv
bnRyb2xsZXIgaXMNCj4gPiBsaXR0bGUtZW5kaWFuLCBpcyBpdCBuZWNlc3NhcnkgdG8gc3BlY2lm
eSB0aGUgZW5kaWFubmVzcyBoZXJlPw0KPiA+IElmIGl0IGlzIG1hbmRhdG9yeSB0byB1c2UgdGhl
IF9fbGV7MzIsIDE2fSBlbmRpYW4gdHlwZSwgdGhlbiBpcyB0aGVyZSBuZWVkDQo+ID4gdG8gY29u
dmVydCBlbmRpYW5uZXNzIHVzaW5nIGNwdV90b19sZSBhbmQgbGVfdG9fY3B1Pw0KPiANCj4gSSBo
b25lc3RseSBkb24ndCBiZWxpZXZlIHRoYXQgc3BlY2lmeWluZyBlbmRpYW5uZXNzIGhlcmUgaXMg
KipuZWVkZWQqKi4NCj4gSSBtZWFuLCBpdCBtaWdodCBiZSBmdXR1cmUgc2FmZSB0byB1c2UgdGhl
IF9fbGUzMiBhbmQNCj4gZmxhZ3MgPSBjcHVfdG9fbGUzMigxIDw8IDApIGp1c3QgaW4gY2FzZSBz
b21lb25lIGRlY2lkZSB0byBwb3J0IGFsbCB0aGUNCj4gR1BVIGNvZGUgdG8gcnVuIGluIGJpZy1l
bmRpYW4gQ1BVLiBWZXJ5IHVubGlrZWx5IEknZCBzYXksIGFuZCBtdWNoIG1vcmUgY2FzZXMNCj4g
dG8gcmVzb2x2ZSBiZWZvcmUgd2UgZ2V0IHRvIHRoaXMgZ3B1IHVzZSBjYXNlIGhlcmUgSSdtIGFm
cmFpZC4NCj4gDQo+IFdlZWwsIHVubGVzcyB0aGlzIG1laSBoZXJlIGNhbiBiZSB1c2VkIG91dHNp
ZGUgb2YgR1BVIGNvbnRleHQ/IQ0KPiANCg0KVGhlcmUgaXMgbm90aGluZyB1c2VmdWwgaW4gdGhp
cyBvdXRzaWRlIG9mIEdQVSBjb250ZXh0Lg0KVGhpcyBtb2R1bGUgaXMgdGFpbG9yZWQgZm9yIEdQ
VSB1c2UtY2FzZS4NCklmIFhlIGRyaXZlciBpcyBib3VuZCB0byBiZSBsaXR0bGUtZW5kaWFuLCB0
aGlzIG9uZSBzaG91bGQgYmUgdG9vLg0KT3RoZXIgc2ltaWxhciBtb2R1bGVzIHVzZSB1MzIuDQoN
Ci0gLSANClRoYW5rcywNClNhc2hhDQoNCg0KPiA+DQo+ID4gPg0KPiA+ID4gPg0KPiA+ID4gPiA+
ID4gPiArew0KPiA+ID4gPiA+ID4gPiArwqDCoMKgIHN0cnVjdCBtZWlfY2xfZGV2aWNlICpjbGRl
djsNCj4gPiA+ID4gPiA+ID4gK8KgwqDCoCBzdHJ1Y3QgY3NjX2hlY2lfbGF0ZV9iaW5kX3JlcSAq
cmVxID0gTlVMTDsNCj4gPiA+ID4gPiA+ID4gK8KgwqDCoCBzdHJ1Y3QgY3NjX2hlY2lfbGF0ZV9i
aW5kX3JzcCByc3A7DQo+ID4gPiA+ID4gPiA+ICvCoMKgwqAgc2l6ZV90IHJlcV9zaXplOw0KPiA+
ID4gPiA+ID4gPiArwqDCoMKgIHNzaXplX3QgcmV0Ow0KPiA+ID4gPiA+ID4gPiArDQo+ID4gPiA+
ID4gPiA+ICvCoMKgwqAgaWYgKCFkZXYgfHwgIXBheWxvYWQgfHwgIXBheWxvYWRfc2l6ZSkNCj4g
PiA+ID4gPiA+ID4gK8KgwqDCoMKgwqDCoMKgIHJldHVybiAtRUlOVkFMOw0KPiA+ID4gPiA+ID4g
SG93IGNhbiBhbnkgb2YgdGhlc2UgZXZlciBoYXBwZW4gYXMgeW91IGNvbnRyb2wgdGhlIGNhbGxl
cnMgb2YgdGhpcw0KPiA+ID4gPiA+ID4gZnVuY3Rpb24/DQo+ID4gPiA+ID4gSSB3aWxsIGFkZCBX
QVJOIGhlcmUuDQo+ID4gPiA+IFNvIHlvdSB3aWxsIGVuZCB1cCBjcmFzaGluZyB0aGUgbWFjaGlu
ZSBhbmQgZ2V0dGluZyBhIENWRSBhc3NpZ25lZCBmb3INCj4gPiA+ID4gaXQ/DQo+ID4gPiA+DQo+
ID4gPiA+IFBsZWFzZSBuby7CoCBJZiBpdCBjYW4ndCBoYXBwZW4sIHRoZW4gZG9uJ3QgY2hlY2sg
Zm9yIGl0LsKgIElmIGl0IGNhbg0KPiA+ID4gPiBoYXBwZW4sIGdyZWF0LCBoYW5kbGUgaXQgcHJv
cGVybHkuwqAgRG9uJ3QganVzdCBnaXZlIHVwIGFuZCBjYXVzZSBhDQo+ID4gPiA+IHN5c3RlbSB0
byByZWJvb3QsIHRoYXQncyBhIGhvcnJpYmxlIHdheSB0byB3cml0ZSBrZXJuZWwgY29kZS4NCj4g
DQo+IEkgYWdyZWUgaGVyZSB0aGF0IHRoZSBXQVJOIGlzIG5vdCBhIGdvb2Qgd2F5IHRvIGhhbmRs
ZSB0aGF0Lg0KPiBXZSBlaXRoZXIgZG9uJ3QgY2hlY2sgKHJlbW92ZSBpdCkgb3IgaGFuZGxlIHBy
b3Blcmx5IChrZWVwIGFzIGlzKS4NCj4gDQo+IFdpdGggdGhlIGNvbnRleHQgb2Ygd2hlcmUgdGhp
cyBkcml2ZXIgaXMgdXNlZCBJJ2Qgc2F5IGl0IGNhbid0IGhhcHBlbi4NCj4gU2luY2UgeGUgaXMg
cHJvcGVybHkgc2V0dGluZyBpdCByaWdodCBub3cgYW5kIEkgZG9uJ3QgYmVsaWV2ZSB3ZSBoYXZl
DQo+IG90aGVyIHVzYWdlcyBvZiB0aGlzIG1laSBkcml2ZXIgaGVyZS4NCj4gDQo+IEJ1dCBpZiB0
aGVyZSdzIGEgY2hhbmNlIG9mIHRoaXMgZ2V0dGluZyB1c2VkIG91dHNpZGUgb2YgeGUsIHRoZW4N
Cj4gd2UgbmVlZCB0byBrZWVwIHRoZSBjaGVjay4uLg0KPiANCj4gQnV0IGlmIHlvdSBrZWVwIHRo
ZSBjaGVjaywgdGhlbiBhbHNvIHVzZSBfX2xiMzIoKSBiZWNhdXNlIHdlIG5lZWQNCj4gc29tZSBj
b25zaXN0ZW5jeSBpbiB0aGUgcmVhc29uaW5nLCBvbmUgd2F5IG9yIHRoZSBvdGhlci4NCj4gDQo+
ID4gPg0KPiA+ID4gRmluZSwgd2lsbCBkcm9wIHRoZSBpZGVhIG9mIFdBUk4gaGVyZS4NCj4gPiA+
DQo+ID4gPiBUaGFua3MsDQo+ID4gPiBCYWRhbA0KPiA+ID4NCj4gPiA+ID4NCj4gPiA+ID4gdGhh
bmtzLA0KPiA+ID4gPg0KPiA+ID4gPiBncmVnIGstaA0K
