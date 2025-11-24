Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CF93FC82C63
	for <lists+dri-devel@lfdr.de>; Tue, 25 Nov 2025 00:09:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A9D310E321;
	Mon, 24 Nov 2025 23:09:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nKRIrcVK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF80610E328;
 Mon, 24 Nov 2025 23:09:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764025744; x=1795561744;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=HPmvDgqW0o7KFrVII9c0bjs8iyy6yyEw7YoSvWPiKzY=;
 b=nKRIrcVK6koWm0TmhHFEAmoFIuvY80WEuRMHMNWb3oMeLox6OfoQ5itc
 TJeYKiW620REzeXVTY23x6Ky6E7rPnPTIK2qSVLcNfYn/EGS1EbueJWJO
 8pSN2YFnLVtB2Ii2cH/kEqBs4yjmrYRZGYkMDJiw1ePx+lQhJ0zadQAPU
 zEN7Kj6FzUizbx+TYSx5tNXXheK/Ela2PC3QLs++Aa3HBVdaOUqfL/0dX
 87Lp1xHol2r3I/qhEwbJ/6dEgBKnqaDoQW9VhSZjyCcEn8/JcTwNcLL5O
 kZVnmcSh5OGPP72kpYuZScJJuVvKV38lGqw73mGN8HSj7h/6gHCc/QNMC g==;
X-CSE-ConnectionGUID: AfMg2h/nSRWyB+ymItSLNw==
X-CSE-MsgGUID: CQg0SabXTIGuDmMCfXey3w==
X-IronPort-AV: E=McAfee;i="6800,10657,11623"; a="65923815"
X-IronPort-AV: E=Sophos;i="6.20,224,1758610800"; d="scan'208";a="65923815"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Nov 2025 15:09:03 -0800
X-CSE-ConnectionGUID: Ck3a/8mdSUiXvDEIFjkdDg==
X-CSE-MsgGUID: OYDIe4ihRBOoV8sfdtxOWw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,224,1758610800"; d="scan'208";a="229739006"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Nov 2025 15:09:03 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 24 Nov 2025 15:09:02 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Mon, 24 Nov 2025 15:09:02 -0800
Received: from CY3PR05CU001.outbound.protection.outlook.com (40.93.201.0) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 24 Nov 2025 15:09:02 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SAbS2lImVCACDV9OfKYB9hayF490FQK9cm9crCYW888Ml+4c7nndwmIKEWOX5eAgy0YAjgyjY9VIv1xsiNLPh+8IbhRoWv0807QABmkr1UUBVGht+W1VY3GtYx6EzHcHbgvZgQ3np/Iyj9naqhD0BY9C7s/Fdw8YUlWCuS7OmArBOkKYXNxpyMwHMEHoKBaD5Fycx7HomdZ5bBoMMhk7Xun3bLg26zm9jD8H4BTIaCEDzSlMAUx0aFsMXdxTQ57TeuKx3z/2hIIH/jY+rqkTcVMQnJh5DP1f3o3JNHMsAv1vYSwYSEDNyoTe1bcm/SXzhzrvkNQRHtIIYlXwzjMiPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=o28swCYrS/Mv/oq3O76m4cw6AeCACTz0/I/A3kk3Abc=;
 b=CvjHAFxKqlidjYQlDEyyuHUBJb4bUISl1e+XLAnQfmnUYo2LpXJ/sKKd6tqv8vtRA+oU1OUt/h7HpVEGLXurHmWwSsWrEjVTLplBMnAyfNilu6vNxZglw+WYO9BppSD0RIfK0YjWzGpZBJg6RTVACgepokOR+dZ06FhWB7SIApu85IQBlgZb0NrhQQ7lSUW/TUd/fi4cVct+yiZ0osDsu+lb7tUdJQ7u3w/V7Znd7IsyZIlreUGhIYKA335gZtrnKpPuPsFEdd+vEHRDCoRoy4GQ0gN0itRWUfWZ5TJE3wDygqmFhVKNqamqyl1bGU/cVc3un5h5j7r/j54b2B9Jdg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5373.namprd11.prod.outlook.com (2603:10b6:5:394::7) by
 DM3PPF9EFFC957B.namprd11.prod.outlook.com (2603:10b6:f:fc00::f40)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.17; Mon, 24 Nov
 2025 23:09:00 +0000
Received: from DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::927a:9c08:26f7:5b39]) by DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::927a:9c08:26f7:5b39%5]) with mapi id 15.20.9343.016; Mon, 24 Nov 2025
 23:09:00 +0000
From: =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>
To: Alex Williamson <alex@shazbot.org>, Lucas De Marchi
 <lucas.demarchi@intel.com>, =?UTF-8?q?Thomas=20Hellstr=C3=B6m?=
 <thomas.hellstrom@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Jason Gunthorpe <jgg@ziepe.ca>, Yishai Hadas <yishaih@nvidia.com>, Kevin Tian
 <kevin.tian@intel.com>, Shameer Kolothum <skolothumtho@nvidia.com>,
 <intel-xe@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
 <kvm@vger.kernel.org>, Matthew Brost <matthew.brost@intel.com>, "Michal
 Wajdeczko" <michal.wajdeczko@intel.com>
CC: <dri-devel@lists.freedesktop.org>, Jani Nikula
 <jani.nikula@linux.intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Tvrtko Ursulin <tursulin@ursulin.net>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, "Lukasz
 Laguna" <lukasz.laguna@intel.com>, Christoph Hellwig <hch@infradead.org>,
 =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>
Subject: [PATCH v6 2/4] drm/xe/pci: Introduce a helper to allow VF access to
 PF xe_device
Date: Tue, 25 Nov 2025 00:08:39 +0100
Message-ID: <20251124230841.613894-3-michal.winiarski@intel.com>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20251124230841.613894-1-michal.winiarski@intel.com>
References: <20251124230841.613894-1-michal.winiarski@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: WA2P291CA0031.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1f::12) To DM4PR11MB5373.namprd11.prod.outlook.com
 (2603:10b6:5:394::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5373:EE_|DM3PPF9EFFC957B:EE_
X-MS-Office365-Filtering-Correlation-Id: 626ef816-adfa-4a05-6f7c-08de2bae73cc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|7416014|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?b1drekkvQWQ3UDA5UWNIZUhwM1VtRDFSZHpPS3NQUkIvYlgvZ1kvd1dmTFRy?=
 =?utf-8?B?YlN4T0lOU2piWG1CbHNVdExRUmM4WXQ0Q0Z3UWVTS3paQkdVbVZMNlVVcWZr?=
 =?utf-8?B?SXNDY1cyVVlvRkIwQ0l2dFc1Wkw5MVlObFJlVFBKeTdPNExHTjNVdStrWjNQ?=
 =?utf-8?B?SEQ1Rk5ZQ1hoTk9oMm9sUitDUkV3N0hlOEJkWFBMZWNQR3lIQzNPUC9lWDhL?=
 =?utf-8?B?Ykc2V1RDQXJ5UmcrenR4WUF2blg0NnVjalVYWWFtY280VWU0R01XOTFaclAx?=
 =?utf-8?B?a1NmQ3ZQSnJBMDYxYWFZK3BQcE8walFDeUJ0NUEvOFVmR1RZWGlBaU9JeGQ2?=
 =?utf-8?B?T0l5c0ZlMXdmYjdDUTkyTUM4YnB0NWFEdVZOakJWaElwR0lLaStXeEZqT3VO?=
 =?utf-8?B?L1Z2UUMxNjIzbUVCRDF5RjZjcm43UG1zcUZtUjdjWHNqQXBJZnB2QTZ5WGwz?=
 =?utf-8?B?VWVrWnFsTm5TNVBtZ3IyUVJreWNzblpQRmVidGNLdVlPbSt6Ym5vTEZVM2JL?=
 =?utf-8?B?VHRWcEpMZmNadnFoeDBnSGVHRzZLeWVUTDdjb3NRdnhwbXpLQlg4Mmd1RnFE?=
 =?utf-8?B?VlRZNmdqSlZ2MmJkQ3lwUEhKQmRhSkZ2Qm5VVnlRQmxGTTJqazdUSkVXNjJs?=
 =?utf-8?B?d2E4c01IWG1MQkY2RmJDbmVQS3NTM1l1QVhhYzlKTU5NSHh1bG5QMnlUaUJV?=
 =?utf-8?B?TW90WXRiU3VrTTZqN05tZ2s4Q3E3Y2syWVdkV3BIcmplQmt5WFFEeFhVbXN2?=
 =?utf-8?B?elZPVEdBdlYyc1lWNWN0RGVUTXZGd2htclJ2bEhSaG9vTDRMaDM0K1Zyb1No?=
 =?utf-8?B?a1VvWUNxa1IxYUNTUThBenJqRXg2WVN0NUl6SHZwd0hZSDluTVVGRGJORWlw?=
 =?utf-8?B?NjlEdDZhOXpob29aa0twS1ZNdW1nWUZpb2pZWU81RjRyaWtURGZqVTBsM25X?=
 =?utf-8?B?SS9aWXkvcXVQR3Nsc05iU3RlZWV5NUF2b0ZKZ0dlZU1NSmhxbXZNZk9MbnZP?=
 =?utf-8?B?a3RBby9iVWtTM041ZGcxaFRFa3ZaclNNNVIwUDFEQVhGM1lvTXpMN21PbTBP?=
 =?utf-8?B?UWwrTks1cEZHenRQUG9NY1VDWnE0MDNiZU9OVzd2SzZmeTRadER3QTgzd1Z5?=
 =?utf-8?B?VXYyZDV0VmYzSXB4R1RZR0Z2VXRwMnk3L0FCMWdIcGMzei9BZE11R2lhZWVC?=
 =?utf-8?B?Ung3dVdTN0hManhiSi82NlhKOW81NHZ0VXc5OW91TWdmMEdOTy9qaEhkKzdX?=
 =?utf-8?B?aEFTd1Y5Zm1WY3RtT2VZOUNSVnFIeHAyOWVybGd6V0VnWFdrUlJDejlDam4z?=
 =?utf-8?B?Nkk4bHNLVHN0S2ZZMEFYRS9nbWd3SGpoRWh1UFUyRlpETGNXNEVQYzNaMWtP?=
 =?utf-8?B?Y0ZuM1lmSG5jUzZnM3F5bmovaURYVjE1dk42OGQ3T2lyVjFQQ0dNVW9kZzI2?=
 =?utf-8?B?L2N1aFhzcUE2VFc0QVRrckt3eUgwYS9wN0hrTVQ3TUhXZEx0eEFDeVZvMTRF?=
 =?utf-8?B?NTU3NUJYYWxQbytUbENxQ3pLb1NUUVc3RWJUbTlFUml3Y25MM09vM0tTWVZi?=
 =?utf-8?B?Y3R1Yjd0MFpvMGNCSFhUKzFvUUtjbXRXU3c4NXp4b1dSM2wyc1JYNUU2ak9t?=
 =?utf-8?B?QmhHTk45em1tME0xWFNmNGxEMnpkYzAwQ1laVE1TanlUTTZNVSs2QldSQWxi?=
 =?utf-8?B?dGs4L2V5em5ETUNCbGFVZFlDK0dHa2RzVTVNWUNCQjRDdDQrTHBvN0x0bVJP?=
 =?utf-8?B?ck1kRGYyanRFcytUTzhVdlNJd2hId3dzdjVTZ0FCamw1L0sxVVBLK2dnejl3?=
 =?utf-8?B?bzlrZWw5dXVxL2t4ejlXSHNFeEtIazd5aERaSG02dHN1b2dNaWUvWWtLSUZR?=
 =?utf-8?B?b0pJWm5sWlFWbHdSVEEvcElYOGZMQ3JJZzF0TUI0VlJNS3E4dG9DMVBXTGtW?=
 =?utf-8?B?L0FqaUtkZGtxVXExcVF3VHVxRFpTY284d2Vud0xRMkMxdzEwcjdFWDcwb0tN?=
 =?utf-8?Q?iXgdgLBPB3X3y93+XPAFYW4V3rcKvs=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5373.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(7416014)(921020); DIR:OUT; SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aUZwTWxsMk93SWFyZU5VcmxIRDlLL3lYcE0yV2MzdWcwM2tjZktreTJ1Q3ZK?=
 =?utf-8?B?TFNzUkU2T3NDVzF3V2dVY2V5UFFMbE1Yck1sRURSMDVWWTdxMWhtbjd2UE5h?=
 =?utf-8?B?dVRadDBpQzJQNXk1cEtkUTg4ZTlnR2J0V1d1elpVdjBFb1ZDWGJsQUR1Q1Ux?=
 =?utf-8?B?ZEVHbzFPeEF1ZjhxcGczUkpnTDZkRXFYdFlsTEdOYm5yRG5OTlp5YlR4RXk3?=
 =?utf-8?B?YzNLWGFzK1FkUzdDSUpTUHU0WVFBMGx2a20wVEUwdzk3a2pnTXZwbXN2azVl?=
 =?utf-8?B?emJYWGx0L3lKSXRPdFNOVGFkdElNTnR0MDR1bEZLd1IvdUZvSEpicy93Rmor?=
 =?utf-8?B?QzNLUmZqRjErUC92RXJkeU1sRFFYdHFLbWI4OFRNWGFZUmRuUFkwb294OGFK?=
 =?utf-8?B?WTVtazFFTHZjaTJWQW5TeWhxSHUzcERXUUJIZTZ6UHhhbnZOdE00anYrNm1L?=
 =?utf-8?B?aDFpcm5JYU1kUWJZZURVcWIvbkhjZ0ZjODl1d3NzN2FidUNyOFA0dWtlMk5Y?=
 =?utf-8?B?WG1PWm9WdW9IamRvMVgrd2JxekNnUFRJa3dKRXJySFUvWTBsOTBmOVpaODNU?=
 =?utf-8?B?bWhEeDJnVlViRHRVSXAzYjVDd05hV3E1M3ZoZFNhZ2lYbVBrWkRDaS90VWJ2?=
 =?utf-8?B?NEJZdG9TNDBYVTJjQWUwNDRRTStXbzlQeG5sejFSZzZIMEFDQTdzWWdXQ0V2?=
 =?utf-8?B?RlpleEhSZnU4WEhVWHowa2tIb2NKcmZ4NEgrdjZWZ25mZGxUZGNaOTRuSHNQ?=
 =?utf-8?B?Q0RsWkx0bFBnZVRSR0pOUmQ3OUNobGg5MFZEZ3JFQUxCU2hXZnFZNUlZTURM?=
 =?utf-8?B?OWdodmxCNFhwL3RXbHkrWGExWEJYRXdGM0tPS292MmFzUGpWZ2NzWGE2bUxD?=
 =?utf-8?B?OTZvVG5wRXVVWmdGS2NsMUwrMWN4Y0tMZUdWY3diaFRpRnE3Yml3dUxSK29q?=
 =?utf-8?B?ZnRyQnd5VmRHTFU3UHFjVnVTOXVJQUcvKzR6ekwvVk94QXZtbm4xTU9UbmZH?=
 =?utf-8?B?bE5oNEFJRlZLRUhqZldXMm5wYzhGWWhxaTA2eEF6R08wUFg3TXJ6Rk1QMlB4?=
 =?utf-8?B?eVFydDNJN0dSL0NmL3RhUU9Makc0Yi9GRUFHWkx4RVZqaFlyTWdrZnBZT0x5?=
 =?utf-8?B?cHlsdFZ5U3RTb0FGL3BucFpJaFFBL2cra0ZuN2dWejIrRmszaXpFOVN6WmFh?=
 =?utf-8?B?Um5rcFRPM3NYUDQvMlRNenFtQU4zN3RtSi9jclc1YTh2SzEvdkZqK1EvQjQ3?=
 =?utf-8?B?bTJoVnVVdDlhdWx5Vll2clg5K2lRREFZQTZ5N2FHdFVlNS9ScCtLQXNqUkdq?=
 =?utf-8?B?VzF6c0V4QnRDdUIwYTM1bVJTeFF5VTNRcU93cENCNTJEVnVSUlNON0FXRGc0?=
 =?utf-8?B?S1BISWVKNzlTaFlDc0R3ZkRERGJKZmd2VHFKQzBwSmhybk5RVXgyWE9FZzhN?=
 =?utf-8?B?aGRKQUJCOFZJa1VkS3ZCa20rbHVxZTBHTC9NRnR0N3Q3cXpETmJCRE9NOTRw?=
 =?utf-8?B?cUNFZ1dEK1kwa3ZSZDBJdDd0eVVRQzFRc0g2VlFxZTIzUXpTMENlMjU5ZXFP?=
 =?utf-8?B?alpjbDFZSld2S2tRMGF2U3o5aGZqL0h3TDFOUjhsZ2gxeHZHNGIvYk1mR2ln?=
 =?utf-8?B?MFF0Z2RZZjg4NGhkNFBaZWRYRmRHdXBENW1MZW1RUjdsVUFWM1FOOWRzdTM2?=
 =?utf-8?B?VEM1cnROaHJFd2ZMSXZuZVA3MjVqNDY1RSt3aURabjhoMmNPNFFxUUZVaGtD?=
 =?utf-8?B?dThFR21yVk0ySEJmYzNhNkp5TjJCMHI1QXJCNGdBV3pla0J5ZDRzNnNOaHls?=
 =?utf-8?B?NGNhY1VjMEhDb0Z3djJFN25neE5nT1dTdmFrUkQ2Q3M2LzJLaUc2U0ZOY3pO?=
 =?utf-8?B?RnBFR3ZmeW5nMVFYRmJ0ZzExMGk0akM2c29HK2Myb0pUVDFpRTBnSE1LRFoz?=
 =?utf-8?B?c0FBRWNKMFlKWFFEL3BuUzZsL1cxWlVBMkRLMHlVamJSWDBEbzN4WlVDVWlM?=
 =?utf-8?B?OGxuYVhydE1WclI5emdLZUk0UnZkdTY2Z1ppTkxUa054YmM2Wndibm5ZVlM5?=
 =?utf-8?B?dE5nY0NQc2tSUm5FSG04TjRic1NQYjJPdDdtcmJzN0doZ1hSVVlGTFNUVE8v?=
 =?utf-8?B?NEVRUXJEKzdYMEVidE9NVXZkQ3FoNTR6bW5CSjIraDBHREROYUtjV1dwMUhp?=
 =?utf-8?B?eWc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 626ef816-adfa-4a05-6f7c-08de2bae73cc
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5373.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Nov 2025 23:09:00.4033 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4TyB6+9Gk4KGkhRAHrpYUM41kdk3ORcn3iGRVSZgMT7I3bWSpaXbYE/XVQQd8aZHKdrSsEwqkq3dj/RRJ4Xicin6TWin6nglDvFM4PgURoQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PPF9EFFC957B
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

In certain scenarios (such as VF migration), VF driver needs to interact
with PF driver.
Add a helper to allow VF driver access to PF xe_device.

Signed-off-by: Michał Winiarski <michal.winiarski@intel.com>
Reviewed-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
 drivers/gpu/drm/xe/xe_pci.c | 17 +++++++++++++++++
 drivers/gpu/drm/xe/xe_pci.h |  3 +++
 2 files changed, 20 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
index cd03b4b3ebdbd..b27f6364faa0f 100644
--- a/drivers/gpu/drm/xe/xe_pci.c
+++ b/drivers/gpu/drm/xe/xe_pci.c
@@ -1224,6 +1224,23 @@ static struct pci_driver xe_pci_driver = {
 #endif
 };
 
+/**
+ * xe_pci_to_pf_device() - Get PF &xe_device.
+ * @pdev: the VF &pci_dev device
+ *
+ * Return: pointer to PF &xe_device, NULL otherwise.
+ */
+struct xe_device *xe_pci_to_pf_device(struct pci_dev *pdev)
+{
+	struct drm_device *drm;
+
+	drm = pci_iov_get_pf_drvdata(pdev, &xe_pci_driver);
+	if (IS_ERR(drm))
+		return NULL;
+
+	return to_xe_device(drm);
+}
+
 int xe_register_pci_driver(void)
 {
 	return pci_register_driver(&xe_pci_driver);
diff --git a/drivers/gpu/drm/xe/xe_pci.h b/drivers/gpu/drm/xe/xe_pci.h
index 611c1209b14cc..11bcc5fe2c5b9 100644
--- a/drivers/gpu/drm/xe/xe_pci.h
+++ b/drivers/gpu/drm/xe/xe_pci.h
@@ -6,7 +6,10 @@
 #ifndef _XE_PCI_H_
 #define _XE_PCI_H_
 
+struct pci_dev;
+
 int xe_register_pci_driver(void);
 void xe_unregister_pci_driver(void);
+struct xe_device *xe_pci_to_pf_device(struct pci_dev *pdev);
 
 #endif
-- 
2.51.2

