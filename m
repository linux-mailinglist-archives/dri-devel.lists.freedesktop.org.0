Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CDCAB17299
	for <lists+dri-devel@lfdr.de>; Thu, 31 Jul 2025 15:57:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B47B010E7AB;
	Thu, 31 Jul 2025 13:57:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="WbRRSDOP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2076.outbound.protection.outlook.com [40.107.236.76])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C45E10E7A0
 for <dri-devel@lists.freedesktop.org>; Thu, 31 Jul 2025 13:57:33 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=u5RZMVBPvs2ZAb14SvkB1dPaqjhJL00iv09AZ8Qz4yqy5bRK08kwtqeFnlnZFu3pvEXz4ojlwTk4R0m3d7kF8OAvjUs5bfWd2szuNWm6UU/kOOoJ+58M8ok4U1jigFgOSoQVYQJZAEYIL/+7ATwdG0vke4SbAI2fBDMimll2oubDo3USyGcDInaRU0dNz1KJOIGLOgESynyBCt/mMrC3RzssFZIy2pVKSLgJS7RmcwhiQHKGXhlBlppSzdnTSALu0BZecEbumzQaTIdybW72UHt2rHWSswO+cSJ2mj2WAj5nvhPl2g1OHIvHOOzVaa35lpQToUddGvcIZw87GhfgFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jK8QG77EGT3EcziZEl9Uf4RDFj1DcIPR69qWAXBxGcw=;
 b=xxOHjfUvvwlnOuRUYkvHc9Fnsp8mEVGCJ6T4ZfbUgz937v2emkwMDKr87H2bAbOQCax3mzkEaJCYrn0Rzd6KU1rjRFRkTdSIYaBjRtI4ROXTm3hJ1iSDcITA+tl1OV3w6CJVkkMUJBGdEiK5r+GPm8S2/R2tzFhzt1hTYEgYIC+CBHsONAm/+F8/BsPRLx9Fj531Ed1hW0iSNUJ9it0Qo6nSdbvH65JRYXoEur5DPbVE4xy3N7HUGT+Zr2LHWzYQL4PCxMJtilnSBG+5HQ5esy3ntSN1wNiE4FeByk+Fb4UizGkDQVgmbCEmKdJhCcHter81IQrphgSuP2Z2J9isLg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jK8QG77EGT3EcziZEl9Uf4RDFj1DcIPR69qWAXBxGcw=;
 b=WbRRSDOPnADtb1p2Ffn9mZ1r3+3+1DwXsZW8JJxd/NvlMSiYQP8//vlCg9WF2/3OOsvmi14QijQLXmPrr5tA/qcGj3HamjeSR+uPiYELKThcaNZ938t6BRlgy1Qg+mkseiXKr9N8IXNsymS3nP4/edF0CqFS/Xc9KxuZ/R8w5HA=
Received: from CYYPR12MB8962.namprd12.prod.outlook.com (2603:10b6:930:c4::13)
 by DS4PR12MB9561.namprd12.prod.outlook.com (2603:10b6:8:282::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8989.12; Thu, 31 Jul
 2025 13:57:29 +0000
Received: from CYYPR12MB8962.namprd12.prod.outlook.com
 ([fe80::1526:ce9:82c4:5ecb]) by CYYPR12MB8962.namprd12.prod.outlook.com
 ([fe80::1526:ce9:82c4:5ecb%5]) with mapi id 15.20.8989.010; Thu, 31 Jul 2025
 13:57:29 +0000
From: "Varone, Dillon" <Dillon.Varone@amd.com>
To: Alex Deucher <alexdeucher@gmail.com>, Linus Torvalds
 <torvalds@linux-foundation.org>
CC: Dave Airlie <airlied@gmail.com>, "LIPSKI, IVAN" <IVAN.LIPSKI@amd.com>,
 "Wheeler, Daniel" <Daniel.Wheeler@amd.com>, "Deucher, Alexander"
 <Alexander.Deucher@amd.com>, "Liu, Wenjing" <Wenjing.Liu@amd.com>, Simona
 Vetter <simona@ffwll.ch>, dri-devel <dri-devel@lists.freedesktop.org>, LKML
 <linux-kernel@vger.kernel.org>
Subject: RE: [git pull] drm for 6.17-rc1
Thread-Topic: [git pull] drm for 6.17-rc1
Thread-Index: AQHcAdfbTzwMjs0ZCEmduOOy3uOt2LRLrluAgACGtACAAAumcA==
Date: Thu, 31 Jul 2025 13:57:29 +0000
Message-ID: <CYYPR12MB8962F7B39D2CFE2AC0B3F2E3FE27A@CYYPR12MB8962.namprd12.prod.outlook.com>
References: <CAPM=9tzVm80-v6_5nt6kko3nR+aQLZ7R98i419FV8f4-ayQWUw@mail.gmail.com>
 <CAHk-=wirxHy+KU6jmtO2dzmGQ1BwaOdd5Mjtrc40fGvZVULQQg@mail.gmail.com>
 <CAHk-=wjn5Pg2Gp=o2NVv-nRKqE=E75AxUypWCCpQ7MDXuHx+YA@mail.gmail.com>
 <CAHk-=whnuRuQEky2GsCDRQSf1dZbpoqnK+puw=qdR-D7aap9SQ@mail.gmail.com>
 <CAPM=9tygJqtbmYzB5gktxp-7fBfv_9gNq9p9+SdZ6wiYE2-6PQ@mail.gmail.com>
 <CAHk-=whB1X1c6rWbY34wZVGcnaY=yfPGLOtjd5h3mMDGV9Lbkg@mail.gmail.com>
 <CAPM=9tyb1mELymOJv62KJom4mGF0UBifbVqLJUFdS1C7Eeu3jg@mail.gmail.com>
 <CAPM=9tzDWmYBKQGB0ybDzhYHkg0p98_6PJA8OuPahRep8+QPvQ@mail.gmail.com>
 <CAHk-=whOb_ebQQbnXeqb8uXf32WA32nrL3=HQ2y8hBm9hFgVOw@mail.gmail.com>
 <CAHk-=wh+79KkMXsNqyPxeU+c5U2h-n13ko6J_QzwtjyYCKhrSw@mail.gmail.com>
 <CAHk-=wgEGn0azq0n5BfWg4ZStrZYanLCX1a+quug7HKmjimhpw@mail.gmail.com>
 <CADnq5_NBM1Kso==+N=1xCjF+xiS7Vy4g47uvUN7sSWs8bontZQ@mail.gmail.com>
In-Reply-To: <CADnq5_NBM1Kso==+N=1xCjF+xiS7Vy4g47uvUN7sSWs8bontZQ@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Enabled=True;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_SetDate=2025-07-31T13:51:21.0000000Z;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Name=AMD
 Internal Distribution
 Only; MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_ContentBits=3;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Method=Standard
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CYYPR12MB8962:EE_|DS4PR12MB9561:EE_
x-ms-office365-filtering-correlation-id: 99e72ed1-2f53-4ce8-0ca7-08ddd03a3028
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|1800799024|366016|376014|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?aTRMT1I4UWUyc0pZdDJQOEtlaDUzSkVzT3JFVU1qbTM0eW1DcFgrZjFRVDk5?=
 =?utf-8?B?R3kwdEpmSHdlNE9Da2R0Z2VJZ1J2b3ZiUjVWU1RBb2V3cG5UZXd3TnYzdzVo?=
 =?utf-8?B?MHFlUE51RlN4UGN3eEZ3ZkNsNlpMT2Z3TWZwT2tvWkgxWVczMm83NmRCVkpm?=
 =?utf-8?B?bGk3Mm4zdkc0bWRMTUUya0tFaG1mMWVYRUxMYkdZNXN1RlEzZ0ZmYTZTUXpl?=
 =?utf-8?B?NVAxS1Q2RkF6RUVYL3dqSWFYM2k3N0s3d1BCYzl6aWo3Q0tOQ3F5ZkdpMDZs?=
 =?utf-8?B?a3E0blh5bFR0UzNGanVRWC9HZTg5R3hhZTJkMlZDdWMwTWZnK0U4eExQc1pP?=
 =?utf-8?B?bi9qNUlYbUIreHBaRTNDZ2pSNUdkMHU2SlZmc0JRa3JIaThLWGhIY0xaa0w5?=
 =?utf-8?B?MHlUVHhXS05EZWtyTXlaNWl4NG03S0dzdmRGSXYvaEVJZGlJcW9DWlBzV3Za?=
 =?utf-8?B?VEtEUHplZE9QMDNMR2xqNHBOOXo5cTA5Y2x5cllXV3cvZ3k2S3lnZUJubkl2?=
 =?utf-8?B?OEFDRWd3WFdlWUFva0JuOE9KQ05kZkxXZktiMWp4ZGQxVWE2ZTN3TStheDN6?=
 =?utf-8?B?c2V5V1V5Uy9QZElTRFphRlMrMmp5ZGM5OFgzeFViMXc5bkdsTnpUK21iay9Y?=
 =?utf-8?B?L0Q1QTR4TUUxcjVkayt5TnFFaW9rRkhLS0J0MktUeDNORDVtSGVCWk5La3A0?=
 =?utf-8?B?V0pBRG5iUzc3UVRPaitNSktTUnpvQUk0aStzQWFkSlNHNVVDSHUrSHZ6Nkwr?=
 =?utf-8?B?dHoxc2srY0tGT3JBdFp6SVM0am9yNWVhNUQvcGo1bmFnRkRmeU5kbGpvTHBi?=
 =?utf-8?B?YjhSYVlkalRvTGY5N3VtRGFyTjNkcWs1TE1vbmR1Sm5yMnBIK3FWYkwwakgx?=
 =?utf-8?B?UGo5MnRoT0l2RzZOSUFpbHRhRHo3cVkwN0NJRXpaN29pU3NoeVVoQWZYRmVC?=
 =?utf-8?B?YWVianFrcXJ4eW9PR0tFUDNJL0VYdWdYaGNBZ0paSWsyQWJ4bjR4aGxKcFJr?=
 =?utf-8?B?UXpaUExCODZoMlMxNnRMMVVhNjZyaDUwRE9EMXVmT1J0SWV2MTlVNDVwMVhK?=
 =?utf-8?B?Ujl1OGE5WWZ1dDU3cDZCNEkrVVdLdHVmSG9TdUhtZ1R3a0ZrRWgyTkRyc3Qr?=
 =?utf-8?B?Y2xpQWdCSHIraHA1N3lxODYvM0tiSVB6OE1HcU40U3BSMnA5SmdKNmlRN2pj?=
 =?utf-8?B?SnE4cjFiSmFWTVpYdExnMWU3Njl5YSs2ZkJLYkhiRVBIaVBKVTRyaU9nY2s0?=
 =?utf-8?B?UnBuSzEyakhYTlQ5a2xnUFVIbzlNcllnM3A3LzFBaENPbm40R1FuWXJTSXdX?=
 =?utf-8?B?OS9ScWYyOUlmOHdEQm5ob1BTdHozYUlrdHlSWW9CeUJTb0FaaFR3RmR4b2RZ?=
 =?utf-8?B?QUhvMzIrdis3dXBIZHZEOWRoQ0tjZnM2YXNCaGE1V3RyT2d5bXBSMm5vVngy?=
 =?utf-8?B?amJ3dkRFR0puNDMzcVNodW8zaFQ4ZTBmeE5Yc2lTQ1I3RmVFRFFoNjRnNGU5?=
 =?utf-8?B?Q3RwdVdwTXRBYTdFa0FUNEpSY0I1NmlNVFllVHJVTXg4WTRFZzA5dlAxYjU3?=
 =?utf-8?B?a0ZGcHZ6cFBjcWp3WUp0bVAzVXdCVkZnUFZudGx0UEpmNzkyQVFDT1NNd0lr?=
 =?utf-8?B?OUM3N2JwWll4OHpqSnZUc0l5Q0piY25zRlBqU040NHc2UjRVbmJmMm8rWnlw?=
 =?utf-8?B?MHhEekZvNUlXUXlLQTVLd2ZHdlJUTkRWUjV6QTF4akx5NDZHc21YV1JwK1VQ?=
 =?utf-8?B?MlhjajRmYkVhcnBvQ0htYmd2T0t4WTU4eXE3OE5KcVQ4THllZzZXeHkvTHU0?=
 =?utf-8?B?dW9kaFB5RFgxajJQNExiUXYwK0N0akVSd2FSSGFzM2ZGazVZZHArekNYZmFV?=
 =?utf-8?B?blY5M0pjVjZYNTVHWlFLc2UrL3Izc0FERlVjVTBHdUFxZzl6UlA3S1BKd0JP?=
 =?utf-8?Q?Ml2vP43B5JY=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CYYPR12MB8962.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?NUNaSEw1UUVqbEVrd0ROcmNnSnNmeFJpMjQvNkNEVGsrVTVvQVd5MVJ4WjlF?=
 =?utf-8?B?bElPY2JVSmdWcFpmOENOVEZoeTRwbGNlNmtNOHp1UzhoaUlFeEF5Z1JtRktE?=
 =?utf-8?B?bzRrbTRzejU2WE9VMkhqcTF4YVZvZjV5Zkx5dkhmQXA4TE1QVGVLSUZnd3hD?=
 =?utf-8?B?eHdSYlRtR24yWTE3VklhdnJTd0Iwdzk1Tk5XNUZwakZ4b2dmS1J3MHpGVlhI?=
 =?utf-8?B?MXViejZzT2lVaWRRcG8rNWF6dXh6VW1CWFZDMnoxTm9lR3I3bkR5YXlpbmtt?=
 =?utf-8?B?NE8wcWFya0RVdnRJR0RBTi9IenBnOGc4SnllWmNZQ2kvZWxUSW5UZTI4ZmFN?=
 =?utf-8?B?YjA3VnBZRklaQllDamJ4RVp2N2l3aW5FRE1aamNMekZZQ0ZyT1RlOTdtRytM?=
 =?utf-8?B?ZFZ0OUxPeVJOUkR4bkYvM05XT3NMSVIzWjFTQ0ZXaXVldVpPODYzVkNkNE9j?=
 =?utf-8?B?V1h1SVNnbU1kdUc1N29uL3NESDBCUHV3MC85eitoU3I0L0hadS9URDdMSnBD?=
 =?utf-8?B?V2V1ZENNdUsvWEg5T3pvbVEvYVNTdUxHVkZqQWR4VW9USzlFZzBwdGY4enAr?=
 =?utf-8?B?MmNncjlGS3ZNTHV2ZUJaMkdBQTNNSnpVcVBIbS9wUFRDcEJCeXpsZVc5NHpy?=
 =?utf-8?B?czNYMkxMMlYxVkNsVS9DMzkxNEU4amxOQUJPQmszZHIwVWVUNXFFN25LeEZD?=
 =?utf-8?B?YnMrbW1nNi9YS0Fsc2hpSEZiN1BBQVFTZmgzbitRa01WNzU5bWx5MHA4YTYw?=
 =?utf-8?B?VzZwbDFLMlFnVFIvSXZvaTM0S0VSY2JqT2Y3RVRycTFYbmpBaHZsZnBpeU5G?=
 =?utf-8?B?V3llR0J1c0lIUDlLZDBuRjBUdmFub0JxeGwyWVI3ZHBST2R2dU5qZkVKQ2tO?=
 =?utf-8?B?NXkvZkRtNG1oWkNmK21hbXgwWGhCOWFPWW9JTjNqU1dIWGdyQXZlTGE0Zk1R?=
 =?utf-8?B?WUNmUlVvd1o0WEpKdjlrZ2hFNnViVWZxTjlDeTh6RWNNNHJ6WU51YWtTSVFO?=
 =?utf-8?B?NzFoRFkzVGlZbGhWTE55SGU0Vnl0YXlISTV6TzYyTjlhQVZuWkRpdzhpa0V3?=
 =?utf-8?B?UTd0YTR3K1EvYXFvUEUxbGltSENuNXFidlk1azNXMjV4NXNNVU5xYU1ody83?=
 =?utf-8?B?NURtSU00VEh3RGhFbmtXM3o0dVlUazN2U3Y4UEpCN0NwdkQwdGRWTTVKdkRE?=
 =?utf-8?B?Z0FXSjhIT1dETUF4QkcrRCtwZU0xOVFEV2xnSFJpanpMbmQwTlNJUVIxSW9t?=
 =?utf-8?B?ODJZZ2xaTTIrYm5sbS9JK25IQXRLMVJ1eGtCa1RWOFB2REJ2RlBRNVFSb3BW?=
 =?utf-8?B?djZxNWJHUW9QRDNhTml2UWpuVjFNWlF4ajBKM0YvRWlWbytiVUlWWEJGd0JC?=
 =?utf-8?B?QWV2eVRHN0RLd0xFRnBZMklIenhyazI1RkkvWWZxVm5NNU16ZmdVRDFMOURX?=
 =?utf-8?B?d25yNlB1YTNNT0tBUWswbTRPUnZwSWVueUk4L240ZzNuVzVlK3lLcEpOUThi?=
 =?utf-8?B?WFpObjV4STM3eThyWmd1SGc5SjZyc1o5d1pNZnpWUFQ0Q0Jia2o1ZlZrZHZh?=
 =?utf-8?B?RUFFNnNWVWo4ZUZEcEdVSkF2WGNjNzNTS0hOTHlKRzUyQkZFV3FnWFlpQXJa?=
 =?utf-8?B?QjUzcDZnNmxyMHVZZm9idDg4UmF2YkYxd3QvSys5SXNUSEVSSWw1R2ppZnZF?=
 =?utf-8?B?K296N2hkdUx5YUhGblpBTUY0TDBSeFV5ckdyT2RETk1tMnpGcktMYUVRdTBt?=
 =?utf-8?B?YlZjZjNzNDhxNUxuVlFNbzZBaE5kNk1NcmlrSWkra2VCUUJPNTFJRmZVK21h?=
 =?utf-8?B?eE00U3JyMU5wajJEQXNWS29MSFNFMXJncHhPQzFiamkzdjhReVFUQXl5VXVx?=
 =?utf-8?B?NE5vMytkcDhpSFlaQmY0NEJ5Rkthd0RLMUl2MERCVi9BdnVvd016UkttbkpV?=
 =?utf-8?B?ZUJaZUxBODRQdm9JNEpWZEZSM0VzQmZJRTFDRUVyMnZ1dmN5d2laUzN2OFhn?=
 =?utf-8?B?ZFM3cG1PZkN5S3VxY21NaERmaUZvNjJpT2k2dnFXejRrTFcxMUtsM2R4bjdq?=
 =?utf-8?B?amVWRTBYQVZ6S0czemIvRzBMRXhJc1VnNnEwS2gxTVdzcXIrcHc0UW1JbU9h?=
 =?utf-8?Q?iNv8=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CYYPR12MB8962.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 99e72ed1-2f53-4ce8-0ca7-08ddd03a3028
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Jul 2025 13:57:29.0978 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 6d0C5L6rRABiuSscsDgIeVy4L4Kgdr5vRllJA23i1t4JCHge6yxBat1leqxS6wa0d0O5XfSN7HPJ2xKqOYhoAw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PR12MB9561
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

W0FNRCBPZmZpY2lhbCBVc2UgT25seSAtIEFNRCBJbnRlcm5hbCBEaXN0cmlidXRpb24gT25seV0N
Cg0KWWVzLCB0aGF0IHBhdGNoIEFsZXggbGlua2VkIHNob3VsZCBhbHNvIGZpeCB0aGUgZGl2IGJ5
IHplcm8gYnVnIGZvciBBU0lDJ3MgdGhhdCBkb24ndCBzdXBwb3J0IERTQy4NCg0KUlg1ODAgSSB0
aGluayB3YXMgRENFMTEsIHdoaWNoIGRvZXNuJ3Qgc3VwcG9ydCBEU0MuLi4gc28gYWxsIHRoZSBy
ZWxldmFudCBjbG9ja3MgYW5kIGNhcHMgc2hvdWxkIGJlIHplcm9lZCBhbmQgZ3JhY2VmdWxseSBm
YWlsIGFueSBvZiB0aGUgRFNDIGNoZWNrcy4NCg0KLURpbGxvbg0KDQotLS0tLU9yaWdpbmFsIE1l
c3NhZ2UtLS0tLQ0KRnJvbTogQWxleCBEZXVjaGVyIDxhbGV4ZGV1Y2hlckBnbWFpbC5jb20+DQpT
ZW50OiBUaHVyc2RheSwgSnVseSAzMSwgMjAyNSA5OjEwIEFNDQpUbzogTGludXMgVG9ydmFsZHMg
PHRvcnZhbGRzQGxpbnV4LWZvdW5kYXRpb24ub3JnPg0KQ2M6IERhdmUgQWlybGllIDxhaXJsaWVk
QGdtYWlsLmNvbT47IFZhcm9uZSwgRGlsbG9uIDxEaWxsb24uVmFyb25lQGFtZC5jb20+OyBMSVBT
S0ksIElWQU4gPElWQU4uTElQU0tJQGFtZC5jb20+OyBXaGVlbGVyLCBEYW5pZWwgPERhbmllbC5X
aGVlbGVyQGFtZC5jb20+OyBEZXVjaGVyLCBBbGV4YW5kZXIgPEFsZXhhbmRlci5EZXVjaGVyQGFt
ZC5jb20+OyBMaXUsIFdlbmppbmcgPFdlbmppbmcuTGl1QGFtZC5jb20+OyBTaW1vbmEgVmV0dGVy
IDxzaW1vbmFAZmZ3bGwuY2g+OyBkcmktZGV2ZWwgPGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3Rv
cC5vcmc+OyBMS01MIDxsaW51eC1rZXJuZWxAdmdlci5rZXJuZWwub3JnPg0KU3ViamVjdDogUmU6
IFtnaXQgcHVsbF0gZHJtIGZvciA2LjE3LXJjMQ0KDQpPbiBUaHUsIEp1bCAzMSwgMjAyNSBhdCAz
OjAz4oCvQU0gTGludXMgVG9ydmFsZHMgPHRvcnZhbGRzQGxpbnV4LWZvdW5kYXRpb24ub3JnPiB3
cm90ZToNCj4NCj4gT24gV2VkLCAzMCBKdWwgMjAyNSBhdCAyMTo1OCwgTGludXMgVG9ydmFsZHMN
Cj4gPHRvcnZhbGRzQGxpbnV4LWZvdW5kYXRpb24ub3JnPiB3cm90ZToNCj4gPg0KPiA+IGQ3YjYx
OGJjNDFlZTNkNDRjMDcwMjEyZGZmOTM5NDk3MDJlZGU5OTcgaXMgdGhlIGZpcnN0IGJhZCBjb21t
aXQNCj4gPiAgICAgZHJtL2FtZC9kaXNwbGF5OiBSZWZhY3RvciBEU0MgY2FwIGNhbGN1bGF0aW9u
cw0KPiA+DQo+ID4gTGV0IG1lIGdvIHNlZSBob3cgcGFpbmZ1bCBpdCBpcyB0byBqdXN0IHJldmVy
dCBpdCBmcm9tIHRvcC1vZi10cmVlLg0KPg0KPiBTbyB3aXRoIHRoYXQgcmV2ZXJ0ZWQgKGRpZG4n
dCByZXF1aXJlIGEgbG90IG9mIGZpeGluZywgb25seSBtaW5vcg0KPiB1bnJlbGF0ZWQgY29udGV4
dCBhZGRlZCBuZWFyYnkgbGF0ZXIpLCBjdXJyZW50IHRvcC1vZi10cmVlIHdvcmtzIGZvcg0KPiBt
ZSBhZ2Fpbi4NCj4NCj4gVGhlIHJldmVydCBJIHVzZWQgZm9yIHRlc3RpbmcgYXR0YWNoZWQganVz
dCBzbyBwZW9wbGUgY2FuIHNlZSBleGFjdGx5DQo+IHdoYXQgSSBkaWQuDQo+DQo+IEl0J3MgbGF0
ZSBoZXJlLCBJIHdhc24ndCBnZXR0aW5nIGFueSBtb3JlIHdvcmsgZG9uZSB0b2RheSBhbnl3YXks
IHNvDQo+IEknbGwgbGVhdmUgaXQgbGlrZSB0aGlzIGZvciBub3cuDQo+DQo+IEkgY2FuIGNvbnRp
bnVlIHRvIGRvIHRoZSBtZXJnZSB3aW5kb3cgd2l0aCB0aGlzIHJldmVydCBwdXJlbHkgbG9jYWwN
Cj4gZm9yIGEgd2hpbGUsIHNvIGlmIHNvbWVib2R5IGNvbWVzIHVwIHdpdGggYSBwcm9wZXIgZml4
LCBJIGNhbiB0ZXN0DQo+IHRoYXQgb3V0Lg0KDQpJIHRoaW5rIGl0IG1heSBiZSBmaXhlZCBoZXJl
Og0KaHR0cHM6Ly9wYXRjaHdvcmsuZnJlZWRlc2t0b3Aub3JnL3BhdGNoLzY2Mzk3My8NCg0KQWxl
eA0KDQo+DQo+ICAgICAgICAgICAgIExpbnVzDQo=
