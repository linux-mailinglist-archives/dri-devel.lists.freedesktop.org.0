Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eJL6LL3WimnrOAAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 10 Feb 2026 07:57:01 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6783E1178B4
	for <lists+dri-devel@lfdr.de>; Tue, 10 Feb 2026 07:57:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C6F810E4C2;
	Tue, 10 Feb 2026 06:56:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="1C2IBCaA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from SN4PR2101CU001.outbound.protection.outlook.com
 (mail-southcentralusazon11012016.outbound.protection.outlook.com
 [40.93.195.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DFCA410E4C0;
 Tue, 10 Feb 2026 06:56:55 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=l3fdIgSicR4lRmZpSfUW2O01sIgKgguhFflODTDZPu3d+0D37k7PjNuYraz9QDf2p8nUB9X4piQGfaratjecqG11JGaiJh/M7b/SXEDrYJPfeEXAtz88whpFcPb0i9++N5GxCjptlJhZmdzRVNEgj/QnZ6d3Bdjx24bsJqd9xSSJgnx+LrB/yhTqjI3vzWSDj6uVP083ZSoHSZNMSwnwuGz81pWcJnYGok37RqcZa+Okj6w/HIryxpXKyrgriUkefsfclGX3EPZ79PIJBbI8oDm3YLT3mqAL+rASNwfJweKppyquXyvFyuYsGlcgAVRU+uc2JPsIN+kn251rNXdPFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UiOVym0fTnwyRfMLcq5mi+P0Jbk2MyIsGnDl4mJs+g0=;
 b=AEGfmxrgVJSSfsDF9xVsXj24sfaC+QWGdBuBf3hbtjpyl8drxBhM4DxbqPueafit0LoE/VAFzRT7CX9l+fLB3XK1qG6hxYR5wYIIBnFMaKlm9cYn8PdLZJfMvpzRZwROTJUwJCwIPuBOkou4jBWobbqcRPKNcuXDQlWHzzpIk18PARXkZSM4DRfM8LCa7rRLlQxG87pdqKQEdlfArSK/PNcL7bYeDGJuKYiWseL2t9u93cyCkio9yx95S1cxOPTYS9rjC3LixyBhuDRTM5me3Tt5IWSCITn6tu41aeR2p6ml7NUxRpOQK4P9gUgxQxtxqKnTyQxm6vu0AWkUS6hcfw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UiOVym0fTnwyRfMLcq5mi+P0Jbk2MyIsGnDl4mJs+g0=;
 b=1C2IBCaAQdvieu9gz+inj/Iny+H7QbPVTPCsi2NWkGuQ0GwbNUZSumxctsUufOzEiL1H5vXn88neLsNM/xbnnEUG7j5L91aoSlWRpCaP7feN5YSovstQa4ibu5U2kIFXTm8G6VWsh9dL4+iK7keR/5Vn5YHk/M43sGDlOz7qAag=
Received: from SA1PR12MB7293.namprd12.prod.outlook.com (2603:10b6:806:2b9::7)
 by PH7PR12MB7185.namprd12.prod.outlook.com (2603:10b6:510:201::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.19; Tue, 10 Feb
 2026 06:56:48 +0000
Received: from SA1PR12MB7293.namprd12.prod.outlook.com
 ([fe80::be00:34d7:5827:983e]) by SA1PR12MB7293.namprd12.prod.outlook.com
 ([fe80::be00:34d7:5827:983e%5]) with mapi id 15.20.9587.017; Tue, 10 Feb 2026
 06:56:48 +0000
From: "Paneer Selvam, Arunpravin" <Arunpravin.PaneerSelvam@amd.com>
To: "SHANMUGAM, SRINIVASAN" <SRINIVASAN.SHANMUGAM@amd.com>, "Koenig,
 Christian" <Christian.Koenig@amd.com>, "Deucher, Alexander"
 <Alexander.Deucher@amd.com>
CC: Tvrtko Ursulin <tursulin@ursulin.net>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "SHANMUGAM, SRINIVASAN"
 <SRINIVASAN.SHANMUGAM@amd.com>, Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Subject: RE: [PATCH v6] drm/gem: Make drm_gem_objects_lookup() self-cleaning
 on failure v6
Thread-Topic: [PATCH v6] drm/gem: Make drm_gem_objects_lookup() self-cleaning
 on failure v6
Thread-Index: AQHcl2umTLdnWLjAn0GSt8ox1aHA87V7gysQ
Date: Tue, 10 Feb 2026 06:56:48 +0000
Message-ID: <SA1PR12MB7293875F51B77F7EBEDDA334E462A@SA1PR12MB7293.namprd12.prod.outlook.com>
References: <20260206132141.1474191-1-srinivasan.shanmugam@amd.com>
In-Reply-To: <20260206132141.1474191-1-srinivasan.shanmugam@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Enabled=True;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_SetDate=2026-02-10T06:46:37.0000000Z;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Name=AMD
 Internal Distribution
 Only; MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_ContentBits=3;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Method=Standard
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SA1PR12MB7293:EE_|PH7PR12MB7185:EE_
x-ms-office365-filtering-correlation-id: ebc91a44-000e-40fb-b81b-08de68718fc0
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|366016|1800799024|376014|38070700021;
x-microsoft-antispam-message-info: =?utf-8?B?MUZ2N1pBeWxQV0ExV3lCVUp5bndRSmhQbFNzU2taMS9ERmVQUCtPdURFK3A0?=
 =?utf-8?B?SHAvdFlVdW9ia2RCOXZ4SlFJclZZMkt5emRPbW9SMGZ6d2FiRlRRWHdIUnh1?=
 =?utf-8?B?TnVFZ1paUlFPMjdNbXdZTDNIdEF6UFZxbkZPeDIrMmMxNVo5RittRFhqbE82?=
 =?utf-8?B?VEN0dFAwUzIxVWFmeEpaSWN5bDd3KzZkWC9HRkxxMXRvc20zQzl3MmJvay9k?=
 =?utf-8?B?V3l0Y0kvdDN5RllGMjBGQnpBM2lBK1ZIcURUeEUrdFl1VmVpWjdXSUM5VWpl?=
 =?utf-8?B?WDNMTzI3MTI5bjU2RENMSXBUTjRzUG5GTkxXQ3ZsdXJmTWQ1N2RsTXZaUTE1?=
 =?utf-8?B?S0VsTzdDTmR4K2JlUUgzU3ZqR0YwM25DcGFtZnpGekJzUWlvQ0hkc1B0WDZH?=
 =?utf-8?B?V2JvYVMvSVkyelgxWWJtWlM2T0hNQ0ZGN21tbXEwUjQ0V2V1ZFNTWmtPSU9w?=
 =?utf-8?B?UTQ5Ykp1bStHcVlQM1M3YUtTWEh5V0p0NklEbTBIRmNwVkoyOUNVM3hwKzd4?=
 =?utf-8?B?R1JHemVtbWVhbU5td1grUGxqdldWc1hGdmxocEpwc2pKUkpoWUViRmJNK25k?=
 =?utf-8?B?YVllY25NWHpiWkQxdjd1Tk1hOU1LbWN6L3k1SStlVDV5cXNqZVEzUDNFK1h1?=
 =?utf-8?B?dGh2MUduYWhPWlNRZWxHSDRQSmN2aWJuQkh6SU1VMk1vOHlJbzluUzdraVA1?=
 =?utf-8?B?TkpMVUdWYVk5Zk9uUjVqNktqU2xFTndYMVNpL29mWmpveWwwZUlPZ2hrU1VT?=
 =?utf-8?B?eW94dUNnamN1RlJFY0U1aGlvUHBsT1IxZHVrNk9wb1JhblQ2a1c0cWFjaTJq?=
 =?utf-8?B?bEdKWUM1cHhxU2N3VjkzeURVSXJNa3ZqM0ZzejM3eW5Eb054MVRVQVk2ZDNs?=
 =?utf-8?B?K1g0M2p1M29FRFV2TytrTU1qSnc1OU5sWldZbDhaWUp0L3VFbVhWdXVVVVVo?=
 =?utf-8?B?ekJLN1F5dklOdDVubDlkbVpBQnA2bnpTNUE2dXhYTlpmcDhWSVlxTDRvbW9F?=
 =?utf-8?B?WmtzOEpCU2tlNFpOT1hUY0dFWU9GaTRPbC80T0F6V1NtMDNsUENPOHNiU2hK?=
 =?utf-8?B?Mm5SQjUxWXBlQWd2TXNkU1VLWVRWcDhLTDB0bXFDeG5leEdKT2lBR0IxTzV5?=
 =?utf-8?B?dXd1N3NDY2VZcTFhZjlyUDZNa0NVdS8vVjBKOFhOTUQ5N1B1NjYzMkVuazFI?=
 =?utf-8?B?YVdSQ3BGT2ZDaDVhK3VhZ1J3R1BjUTdTeEdBcEJocEJqZ2NsQWwxU3VDdllE?=
 =?utf-8?B?bEtKYWs1TjEzZmpYT3p1cFpXQXhqZXExdzRjejI5dm53OXRDZVdkTjM2blMx?=
 =?utf-8?B?aDgxbk9SRUFpMXh6NjVIa0JDZXZCc2k0NW1aMGt0WlRwb1N1M09WT0QrWlZB?=
 =?utf-8?B?ZkVxbit6d1RBODkyc0szVkMzZTU2bnBYUjlnZDRkMTZPK0M4bEpBcW1QaTZm?=
 =?utf-8?B?ME9tWko5UEg5elY1ODJGNzBMNi9wQjBQRkxxWFlJVkQ3VDI4VkNkZnZTRC9Y?=
 =?utf-8?B?Ylk5MkpITHhud2dHTlhkUmdGR0ZZNWMxTjFITElZR2pCbDBaN1dFN3FkbFdj?=
 =?utf-8?B?VTFVM1BNOU92ZVl3NXZuSkdLZlc3YS9ZNGtCMzdKWXdYNjlqTmVjRlN6MFZW?=
 =?utf-8?B?bTJ4bWd0VVR1ZHJBRWlKS0dyV3VsZ25tbFNKaGVJeVNNM3BLV1Bqbjg2dlJ3?=
 =?utf-8?B?L0ZvcTR0T21KQlp3NmF0c3FTQjNIZTlQYStOMGtabUV1LzdYUkRWelU5Q2tN?=
 =?utf-8?B?cGt2VWppSC9xSnVSUlRoRTd6ajI2SnZGSzRWdE9oNURTL0ZaREJ1TlViS0RC?=
 =?utf-8?B?MGtsZEhvWVJhbUJMZ2hzM1ZlVFZQVzJTZCt0RUFBMmNpQnBweXRoczV2Wk53?=
 =?utf-8?B?bERnSVg2Q2RXR3lIWWcwUlhnVTlxOW56aWs5SW5rUFJKV1ZaaldCSCtqMGI3?=
 =?utf-8?B?dG9PTDdpRjljclJkWVZLOXFDcHhBdWtxVWl6SDE2QjBjeTN6TytVY05Ybkpi?=
 =?utf-8?B?cWRGeDNieVVhSzdGMEFKcHJ0VFhwdGNROEY5T1c2bVhTOGVxVENjYW5NaFRm?=
 =?utf-8?B?RFBheHNhTEEwZW5JT0FSOUYzbFpVeHdXaWE3enBPa0hxR1ZXWkI2Lzd2cmZP?=
 =?utf-8?B?aTFuVG91dzRKOGExbnlJZDZQT1hESHd1YTRiVExsVnFvWEJEWFJpVEoxcUtK?=
 =?utf-8?Q?WjiNpVPm3jwYKxqGh08Omfs=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA1PR12MB7293.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(38070700021); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?aEVQM2VXT3R5Vm1NN3NpL0RCditJNlFnYzRRVG81cVRsQU9NNFJOL1lmZzN3?=
 =?utf-8?B?SGJqNWc0MDdzazgvcU1aRndkbGZiVVhkRVd2bFdMY0xBL0QrV3BTdUR6Tlhz?=
 =?utf-8?B?cHV1SEQ0RkFsT2FGdS9VRS9oNks5NGZydzdZbVByY1NBSDRoaXZibzl0RWdK?=
 =?utf-8?B?WElXazFwRGozdGNaWFp5ejBrZ2RENHoxejZIM2ZPVWU2NHNyQ2ZsdXRlY0g1?=
 =?utf-8?B?d2h5OVRvbFFqSG5TRDFZM20rVjhBSk9HMFQyanVzazRBVVZoZUUyZC95WjFT?=
 =?utf-8?B?L2JlRkJXOU5RSVBhQWQ5QWVvdmhJNHoyMEdacWhWOXpzcGgxZWpxUktQb0J6?=
 =?utf-8?B?QU01b2Nob1RGU0tjdDdYQkZnY3Y4VEtuRkJWVDN3cHI2T1ZZV2VJQ3JvbnRJ?=
 =?utf-8?B?VmZOQWZzcS8wMXEwMGI5WFNUWjFxWTdGY0RCRUVSOE9wVDl1WEtpZzdpNHBS?=
 =?utf-8?B?L05FWnRqQXlhb1hBM29xUzFwTm1qSUgzVWwwelRwNGNUczY4T2M5SkhYSWtz?=
 =?utf-8?B?SkNqanRaZnBOOEdTV3puSFNhUFhSQ3ZLZVYvRm5HMTBIcUdWNXRCd0NEeEt0?=
 =?utf-8?B?b201MjRjVENJdm82aXBncC9GSmt1dkFKdlBqRlZLdW1acThVWEhHeVJ4TDF0?=
 =?utf-8?B?aExSLzVleWo2UTg1S1VHMUlTT1J6ZWczanBXdGdSTWFKZHE0cXJRQWZPRE1l?=
 =?utf-8?B?QjVubEJCR0FqWUNzZ3dPUy9pVERRK1hTVXJkVlpLQS83OFB2eE50L2JQNmtz?=
 =?utf-8?B?bCtONGVkMVdhOTk2WEJkU08zTlAzV1V6S3hIWlliTXNDb1JMcVFYTVY1S1M0?=
 =?utf-8?B?QjZ1U2pPSU5veU1OLzAwWXRGNmJjZjRySVVxbVhMdHpHaVhCazNweHNiZ284?=
 =?utf-8?B?VDhnSlNieVk5MW8ybGhhK09YbXpEandxdE5sbm9OWmxaU3p5anJBN3RMb0FT?=
 =?utf-8?B?N2l3M2RVMjBJaXU5U2tDd2M3VEhiWDhGelU0UUFUQ1VOR3EwaUxjaTR3cDJm?=
 =?utf-8?B?VUdyQkxDQ2xMNEF3S0daUGZkWXdHVWhpR2pqUjlMditMUkhGM1M4Sk5JcGtH?=
 =?utf-8?B?ZnlVRHkrRHg5U3E4VlVoZkErdVhoYWFUMGpaZVNPN2ZTVXJaenhmZm1NQkZz?=
 =?utf-8?B?eTZTTEpGNEZzSVJqTkhuUGhiSER6dVZscmNocmtneWJBWXhTT2VJWnRYT0xa?=
 =?utf-8?B?ZFlRekNHUm5MQVplTTFTUTd4WDRCS0JlRWJCZUhpUFRRSE9ocm5aZVJqcEFP?=
 =?utf-8?B?YnY1aEZud1oraFVFV0RHKzZhN0RieVdUQTdETDFFOFdjd1JQSC9EWUduTE9Q?=
 =?utf-8?B?b0FPNG85akFpaEpUSHVuV1Z6cUdZMGxjTEl0cW0zcDI0WTRSdlNycGVoSWVP?=
 =?utf-8?B?Z3ZkNG9PenJKWFMxa2U2UTBhNzVQenhRU2VOWjlhd2Njd243L1p4anUxVjZ5?=
 =?utf-8?B?REZZUUJWZWlTKzdTTy9OU1NKa2FkM1Q3Uk9DUURSNVA2cGVLZ2dkR1ZmZ0pI?=
 =?utf-8?B?Vzh3NDBmSnpKYVVlckNUNnBRdGpPVUpaRFZlNHFhUEZUV2NGL09TVDlnMWpH?=
 =?utf-8?B?ODd3Q25uZXFQZU9FMm56a2krOEh4Ti8xYXd5RlBZMGsyYVMvMHovZXRPdUJG?=
 =?utf-8?B?ZkxHRE9Za0UyeC9xaGhUWkNoUTh3d3MrQmJZdkNEendXSHp5Mk5idWVRdkh3?=
 =?utf-8?B?UkFPTkNwZGJaRDkyU3U0TU5zeXUxV0hDbENwRW9tZU9OcmxYb2hIQjk4bFV6?=
 =?utf-8?B?YmxFdjVsUnVvSHdpNDdnOHRFY3lVc21uVW9aeVVEdFEzZ2RTVUZRWDdqdkYx?=
 =?utf-8?B?L3NBclY5T0NKcUJLdEdwTEJ1dzNVVS9FeVhscCt1OVZDRGNFWTBydC9GcU1L?=
 =?utf-8?B?cnZOUGR5QVQ1dm92TkNjanJyM2lWS2RMcUU0d0pUV1hsUnFrRis0cGdXZGVS?=
 =?utf-8?B?ZitHZ291bURNRnhveEZvVlJKeG5vb2g2aGFJTThycHh6dE9VUENlZSsyby9F?=
 =?utf-8?B?Nm9tVGxrcnlncDJWTVUwcmtWWGlndDJkcmJyL3VYODh3TUd5U3d6STFoKzV1?=
 =?utf-8?B?R3FNeE1VMjlRdVVZcDV3ODA4Q1NMeFY5bzJ0ZTNHVndhL2NxRUpBMkxpdFB2?=
 =?utf-8?B?NW90aklXWFh1NERnTDJFSmFSNUxLeXAxb3A4RHdGelZrQldDMVA2WEEyZWps?=
 =?utf-8?B?WkNTb3RhM2RLYUx6R1c3VkFGL2VEdXhpbXhSaDRlcjIrcmxEZnhXZ3JBOXBK?=
 =?utf-8?B?YUsrSHE2RjRtV1pqRUlGRk1oRnFSdGN2M2Z5MDQ1Skg2Qzd2enFhUVZDcm1j?=
 =?utf-8?Q?UwwN+gzx1OKuABHmKi?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA1PR12MB7293.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ebc91a44-000e-40fb-b81b-08de68718fc0
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Feb 2026 06:56:48.5223 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: TEOOYHC1XQeysNHtaxRfowMtePx+IJhA7lVZX7t+IIJq0Jfgc9b5s2382i7VQobKC3YPLOA44ZXbyioJphSW2w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7185
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.21 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	FROM_NEQ_ENVFROM(0.00)[Arunpravin.PaneerSelvam@amd.com,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[amd.com:+];
	TAGGED_RCPT(0.00)[dri-devel];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:email,amd.com:dkim,ursulin.net:email]
X-Rspamd-Queue-Id: 6783E1178B4
X-Rspamd-Action: no action

W0FNRCBPZmZpY2lhbCBVc2UgT25seSAtIEFNRCBJbnRlcm5hbCBEaXN0cmlidXRpb24gT25seV0N
Cg0KSSBtZXJnZWQgdGhpcyBwYXRjaCBpbnRvIGRybS1taXNjLW5leHQuDQoNClJlZ2FyZHMsDQpB
cnVuLg0KLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCkZyb206IGRyaS1kZXZlbCA8ZHJpLWRl
dmVsLWJvdW5jZXNAbGlzdHMuZnJlZWRlc2t0b3Aub3JnPiBPbiBCZWhhbGYgT2YgU3Jpbml2YXNh
biBTaGFubXVnYW0NClNlbnQ6IEZyaWRheSwgRmVicnVhcnkgNiwgMjAyNiA2OjUyIFBNDQpUbzog
S29lbmlnLCBDaHJpc3RpYW4gPENocmlzdGlhbi5Lb2VuaWdAYW1kLmNvbT47IERldWNoZXIsIEFs
ZXhhbmRlciA8QWxleGFuZGVyLkRldWNoZXJAYW1kLmNvbT4NCkNjOiBUdnJ0a28gVXJzdWxpbiA8
dHVyc3VsaW5AdXJzdWxpbi5uZXQ+OyBhbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZzsgZHJp
LWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZzsgU0hBTk1VR0FNLCBTUklOSVZBU0FOIDxTUklO
SVZBU0FOLlNIQU5NVUdBTUBhbWQuY29tPjsgVHZydGtvIFVyc3VsaW4gPHR2cnRrby51cnN1bGlu
QGlnYWxpYS5jb20+DQpTdWJqZWN0OiBbUEFUQ0ggdjZdIGRybS9nZW06IE1ha2UgZHJtX2dlbV9v
YmplY3RzX2xvb2t1cCgpIHNlbGYtY2xlYW5pbmcgb24gZmFpbHVyZSB2Ng0KDQpkcm1fZ2VtX29i
amVjdHNfbG9va3VwKCkgY2FuIGFsbG9jYXRlIHRoZSBvdXRwdXQgYXJyYXkgYW5kIHRha2UgcmVm
ZXJlbmNlcyBvbiBHRU0gb2JqZWN0cyBiZWZvcmUgaXQgZmFpbHMuDQoNCklmIGFuIGVycm9yIGhh
cHBlbnMgcGFydC13YXkgdGhyb3VnaCwgY2FsbGVycyBwcmV2aW91c2x5IGhhZCB0byBjbGVhbiB1
cCBwYXJ0aWFsbHkgY3JlYXRlZCByZXN1bHRzIHRoZW1zZWx2ZXMuIFRoaXMgcmVsaWVkIG9uIHN1
YnRsZSBhbmQgdW5kb2N1bWVudGVkIGJlaGF2aW9yIGFuZCB3YXMgZWFzeSB0byBnZXQgd3Jvbmcu
DQoNCk1ha2UgZHJtX2dlbV9vYmplY3RzX2xvb2t1cCgpIGNsZWFuIHVwIG9uIGZhaWx1cmUuIFRo
ZSBmdW5jdGlvbiBub3cgZHJvcHMgYW55IHJlZmVyZW5jZXMgaXQgYWxyZWFkeSB0b29rLCBmcmVl
cyB0aGUgYXJyYXksIGFuZCBzZXRzICpvYmpzX291dCB0byBOVUxMIGJlZm9yZSByZXR1cm5pbmcg
YW4gZXJyb3IuDQoNCk9uIHN1Y2Nlc3MsIGJlaGF2aW9yIGlzIHVuY2hhbmdlZC4gRXhpc3Rpbmcg
Y2FsbGVycyByZW1haW4gY29ycmVjdCBhbmQgdGhlaXIgZXJyb3IgY2xlYW51cCBwYXRocyBzaW1w
bHkgZG8gbm90aGluZyB3aGVuICpvYmpzX291dCBpcyBOVUxMLg0KDQp2Mi92MzogTW92ZSBwYXJ0
aWFsLWxvb2t1cCBjbGVhbnVwIGludG8gb2JqZWN0c19sb29rdXAoKSwgcGVyZm9ybSByZWZlcmVu
Y2UgZHJvcHBpbmcgb3V0c2lkZSB0aGUgbG9jaywgYW5kIHJlbW92ZSByZWxpYW5jZSBvbiBfX0dG
UF9aRVJPIG9yIGltcGxpY2l0IE5VTEwgaGFuZGxpbmcuIChDaHJpc3RpYW4pDQoNCnY0OiBVc2Ug
Z290by1zdHlsZSBlcnJvciBoYW5kbGluZyBpbiBvYmplY3RzX2xvb2t1cCgpLCBkcm9wIHBhcnRp
YWwgcmVmZXJlbmNlcyBvdXRzaWRlIHRoZSBsb2NrLCBhbmQgc2ltcGxpZnkgZHJtX2dlbV9vYmpl
Y3RzX2xvb2t1cCgpIGNsZWFudXAgYnkgcm91dGluZyBmYWlsdXJlcyB0aHJvdWdoIGVycl9mcmVl
X2hhbmRsZXMgYXMgc3VnZ2VzdGVkLg0KKENocmlzdGlhbikNCg0KdjU6IFJlYmFzZSBvbiBkcm0t
bWlzYy1uZXh0LCBkcm9wIHRoZSByZXQgbG9jYWwgdmFyaWFibGUuIChDaHJpc3RpYW4pDQoNCnY2
OiBEcm9wIHN1cGVyZmx1b3VzIGluaXRpYWxpemF0aW9uIG9mIGhhbmRsZXMuIChDaHJpc3RpYW4v
VHZydGtvKQ0KDQpDYzogQWxleCBEZXVjaGVyIDxhbGV4YW5kZXIuZGV1Y2hlckBhbWQuY29tPg0K
U3VnZ2VzdGVkLWJ5OiBDaHJpc3RpYW4gS8O2bmlnIDxjaHJpc3RpYW4ua29lbmlnQGFtZC5jb20+
DQpTdWdnZXN0ZWQtYnk6IFR2cnRrbyBVcnN1bGluIDx0dXJzdWxpbkB1cnN1bGluLm5ldD4NClNp
Z25lZC1vZmYtYnk6IFNyaW5pdmFzYW4gU2hhbm11Z2FtIDxzcmluaXZhc2FuLnNoYW5tdWdhbUBh
bWQuY29tPg0KUmV2aWV3ZWQtYnk6IENocmlzdGlhbiBLw7ZuaWcgPGNocmlzdGlhbi5rb2VuaWdA
YW1kLmNvbT4NClJldmlld2VkLWJ5OiBUdnJ0a28gVXJzdWxpbiA8dHZydGtvLnVyc3VsaW5AaWdh
bGlhLmNvbT4NCi0tLQ0KIGRyaXZlcnMvZ3B1L2RybS9kcm1fZ2VtLmMgfCA0MyArKysrKysrKysr
KysrKysrKysrKysrKysrKystLS0tLS0tLS0tLS0NCiAxIGZpbGUgY2hhbmdlZCwgMzAgaW5zZXJ0
aW9ucygrKSwgMTMgZGVsZXRpb25zKC0pDQoNCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0v
ZHJtX2dlbS5jIGIvZHJpdmVycy9ncHUvZHJtL2RybV9nZW0uYyBpbmRleCA3ZmY2YjdiYmViNzMu
LmM0YTNkZTNiOTIwZSAxMDA2NDQNCi0tLSBhL2RyaXZlcnMvZ3B1L2RybS9kcm1fZ2VtLmMNCisr
KyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1fZ2VtLmMNCkBAIC03ODMsNyArNzgzLDcgQEAgRVhQT1JU
X1NZTUJPTChkcm1fZ2VtX3B1dF9wYWdlcyk7ICBzdGF0aWMgaW50IG9iamVjdHNfbG9va3VwKHN0
cnVjdCBkcm1fZmlsZSAqZmlscCwgdTMyICpoYW5kbGUsIGludCBjb3VudCwNCiAgICAgICAgICAg
ICAgICAgICAgICAgICAgc3RydWN0IGRybV9nZW1fb2JqZWN0ICoqb2JqcykNCiB7DQotICAgICAg
IGludCBpLCByZXQgPSAwOw0KKyAgICAgICBpbnQgaTsNCiAgICAgICAgc3RydWN0IGRybV9nZW1f
b2JqZWN0ICpvYmo7DQoNCiAgICAgICAgc3Bpbl9sb2NrKCZmaWxwLT50YWJsZV9sb2NrKTsNCkBA
IC03OTEsMTYgKzc5MSwyMyBAQCBzdGF0aWMgaW50IG9iamVjdHNfbG9va3VwKHN0cnVjdCBkcm1f
ZmlsZSAqZmlscCwgdTMyICpoYW5kbGUsIGludCBjb3VudCwNCiAgICAgICAgZm9yIChpID0gMDsg
aSA8IGNvdW50OyBpKyspIHsNCiAgICAgICAgICAgICAgICAvKiBDaGVjayBpZiB3ZSBjdXJyZW50
bHkgaGF2ZSBhIHJlZmVyZW5jZSBvbiB0aGUgb2JqZWN0ICovDQogICAgICAgICAgICAgICAgb2Jq
ID0gaWRyX2ZpbmQoJmZpbHAtPm9iamVjdF9pZHIsIGhhbmRsZVtpXSk7DQotICAgICAgICAgICAg
ICAgaWYgKCFvYmopIHsNCi0gICAgICAgICAgICAgICAgICAgICAgIHJldCA9IC1FTk9FTlQ7DQot
ICAgICAgICAgICAgICAgICAgICAgICBicmVhazsNCi0gICAgICAgICAgICAgICB9DQorICAgICAg
ICAgICAgICAgaWYgKCFvYmopDQorICAgICAgICAgICAgICAgICAgICAgICBnb3RvIGVycjsNCisN
CiAgICAgICAgICAgICAgICBkcm1fZ2VtX29iamVjdF9nZXQob2JqKTsNCiAgICAgICAgICAgICAg
ICBvYmpzW2ldID0gb2JqOw0KICAgICAgICB9DQorDQogICAgICAgIHNwaW5fdW5sb2NrKCZmaWxw
LT50YWJsZV9sb2NrKTsNCisgICAgICAgcmV0dXJuIDA7DQoNCi0gICAgICAgcmV0dXJuIHJldDsN
CitlcnI6DQorICAgICAgIHNwaW5fdW5sb2NrKCZmaWxwLT50YWJsZV9sb2NrKTsNCisNCisgICAg
ICAgd2hpbGUgKGktLSkNCisgICAgICAgICAgICAgICBkcm1fZ2VtX29iamVjdF9wdXQob2Jqc1tp
XSk7DQorDQorICAgICAgIHJldHVybiAtRU5PRU5UOw0KIH0NCg0KIC8qKg0KQEAgLTgyOCwyNCAr
ODM1LDM0IEBAIGludCBkcm1fZ2VtX29iamVjdHNfbG9va3VwKHN0cnVjdCBkcm1fZmlsZSAqZmls
cCwgdm9pZCBfX3VzZXIgKmJvX2hhbmRsZXMsDQogICAgICAgIHUzMiAqaGFuZGxlczsNCiAgICAg
ICAgaW50IHJldDsNCg0KKyAgICAgICAqb2Jqc19vdXQgPSBOVUxMOw0KKw0KICAgICAgICBpZiAo
IWNvdW50KQ0KICAgICAgICAgICAgICAgIHJldHVybiAwOw0KDQotICAgICAgIG9ianMgPSBrdm1h
bGxvY19hcnJheShjb3VudCwgc2l6ZW9mKHN0cnVjdCBkcm1fZ2VtX29iamVjdCAqKSwNCi0gICAg
ICAgICAgICAgICAgICAgICAgICAgICAgR0ZQX0tFUk5FTCB8IF9fR0ZQX1pFUk8pOw0KKyAgICAg
ICBvYmpzID0ga3ZtYWxsb2NfYXJyYXkoY291bnQsIHNpemVvZigqb2JqcyksIEdGUF9LRVJORUwp
Ow0KICAgICAgICBpZiAoIW9ianMpDQogICAgICAgICAgICAgICAgcmV0dXJuIC1FTk9NRU07DQoN
Ci0gICAgICAgKm9ianNfb3V0ID0gb2JqczsNCi0NCiAgICAgICAgaGFuZGxlcyA9IHZtZW1kdXBf
YXJyYXlfdXNlcihib19oYW5kbGVzLCBjb3VudCwgc2l6ZW9mKHUzMikpOw0KLSAgICAgICBpZiAo
SVNfRVJSKGhhbmRsZXMpKQ0KLSAgICAgICAgICAgICAgIHJldHVybiBQVFJfRVJSKGhhbmRsZXMp
Ow0KKyAgICAgICBpZiAoSVNfRVJSKGhhbmRsZXMpKSB7DQorICAgICAgICAgICAgICAgcmV0ID0g
UFRSX0VSUihoYW5kbGVzKTsNCisgICAgICAgICAgICAgICBnb3RvIGVycl9mcmVlX29ianM7DQor
ICAgICAgIH0NCg0KICAgICAgICByZXQgPSBvYmplY3RzX2xvb2t1cChmaWxwLCBoYW5kbGVzLCBj
b3VudCwgb2Jqcyk7DQorICAgICAgIGlmIChyZXQpDQorICAgICAgICAgICAgICAgZ290byBlcnJf
ZnJlZV9oYW5kbGVzOw0KKw0KICAgICAgICBrdmZyZWUoaGFuZGxlcyk7DQotICAgICAgIHJldHVy
biByZXQ7DQorICAgICAgICpvYmpzX291dCA9IG9ianM7DQorICAgICAgIHJldHVybiAwOw0KDQor
ZXJyX2ZyZWVfaGFuZGxlczoNCisgICAgICAga3ZmcmVlKGhhbmRsZXMpOw0KK2Vycl9mcmVlX29i
anM6DQorICAgICAgIGt2ZnJlZShvYmpzKTsNCisgICAgICAgcmV0dXJuIHJldDsNCiB9DQogRVhQ
T1JUX1NZTUJPTChkcm1fZ2VtX29iamVjdHNfbG9va3VwKTsNCg0KLS0NCjIuMzQuMQ0KDQo=
