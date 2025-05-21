Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 81C1CABFD8A
	for <lists+dri-devel@lfdr.de>; Wed, 21 May 2025 21:48:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 35AB910E122;
	Wed, 21 May 2025 19:48:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="QCuAXc3K";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2061.outbound.protection.outlook.com [40.107.220.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3964810E7EE;
 Wed, 21 May 2025 19:48:17 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=P9kOVeJH/8y7L815dA3AS1bbCWPhj6GKyyBl4jcofjESIj14n2uxo/X7/zIlPBcRlPLzvHGu0UvrvXcnqVpWKdDTe4MGPaUUnEU79RQLXywJeaRIYP/GvxKJOsmWXCjhkS1MX5IftUOl3cpTdmSBBgtuZqWtY8EVl56oPAW/HE+5+Oth6BUrHq6zkkaMwIbhqPf3DnhWFYI5jIs8P4EClmaPsdWbloavNWH7z31liWJqAS2zwbQthN+6DY01ct7McjdA7odO7UN5dRLMZuoxztRtHSBoQpQ0AoUp5PNN+gP5N6L/e5wjff87ZZNSh5I8GVvzk6Bq4bJDCx2dPGjvig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RLI1sDMRmYbXr9SdcnDzjdBZLAAR7Ht9wbHVSWfPEVw=;
 b=hIgUn+nla/tALXXpF5Mo6ipMqx3eKElimW6966oKxuAm/IJc+E0leOFL1sFlX35iCb7bgaJnA8aQiaGhpgjOrx4rjnim1az7Gei8bII/0LYQlw+XgBsoco00A0ogA0goV+SNoPHCxMt4YcXs4vmRRGbFs/rYXog4l12IK8pxz9GdQ5C8Cbg6mZSsTNsMAgW7Cd0KKc/W8jGKfeMR3AAOc5u2fVBBYxaC4z/9OFRROHT7gTaIkaoicTVOSpqzzs3XpbiyigZ+vSQE2LngDMZVPewEwZvD5lM/YIh7mZEtOtXXSBKCI02c3OUdGdoq3OCXJVxnZudlCGkPWfzp7W0Ptg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RLI1sDMRmYbXr9SdcnDzjdBZLAAR7Ht9wbHVSWfPEVw=;
 b=QCuAXc3KTq3MWhcrsntLJ/6+aZgHI1vHmna0JNKf0R2I4zWDSiB01JMkc9HMt7345Pi2OoML/xOZCWmO23JdG96kVoeYD3yCssHEGhtlE3a4QWntba/vmvCW3T70p4/gb+/iuxLyP+n7Ksarq/MmPxYJrKENQiIt7uTXcbt+Lds=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from SJ0PR12MB5438.namprd12.prod.outlook.com (2603:10b6:a03:3ba::23)
 by CH3PR12MB8076.namprd12.prod.outlook.com (2603:10b6:610:127::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8746.30; Wed, 21 May
 2025 19:48:07 +0000
Received: from SJ0PR12MB5438.namprd12.prod.outlook.com
 ([fe80::65b2:12d5:96ba:dd44]) by SJ0PR12MB5438.namprd12.prod.outlook.com
 ([fe80::65b2:12d5:96ba:dd44%6]) with mapi id 15.20.8746.030; Wed, 21 May 2025
 19:48:07 +0000
Message-ID: <63e934e6-3c27-4128-801b-f1189f12f8f0@amd.com>
Date: Wed, 21 May 2025 15:48:00 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V9 00/43] Color Pipeline API w/ VKMS
To: Xaver Hugl <xaver.hugl@gmail.com>,
 Leandro Ribeiro <leandro.ribeiro@collabora.com>
Cc: Daniel Stone <daniel@fooishbar.org>, Simon Ser <contact@emersion.fr>,
 Alex Hung <alex.hung@amd.com>, Misyl Toad <misyl@froggi.es>,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 wayland-devel@lists.freedesktop.org, leo.liu@amd.com,
 ville.syrjala@linux.intel.com, pekka.paalanen@collabora.com,
 mwen@igalia.com, jadahl@redhat.com, sebastian.wick@redhat.com,
 shashank.sharma@amd.com, agoins@nvidia.com, joshua@froggi.es,
 mdaenzer@redhat.com, aleixpol@kde.org, victoria@system76.com,
 daniel@ffwll.ch, uma.shankar@intel.com, quic_naseer@quicinc.com,
 quic_cbraga@quicinc.com, quic_abhinavk@quicinc.com, marcan@marcan.st,
 Liviu.Dudau@arm.com, sashamcintosh@google.com,
 chaitanya.kumar.borah@intel.com, louis.chauvet@bootlin.com,
 Arthur Grillo <arthurgrillo@riseup.net>
References: <20250430011115.223996-1-alex.hung@amd.com>
 <o4MtjqyDUjuFR4Y9Q1IEZlvVQ7Nkggq0v-KtBcH0aM3pTvEq8UcSoUDxefSBVdTmLj_1_a6GmbjU_mRSFinOb44B4bu1u3mMIckuQhhZWCc=@emersion.fr>
 <3bbd4bd7-7217-4a14-b7bb-383226f44f55@amd.com>
 <CAPj87rNUDdDEopPH+iAF-a=Or6eXH4cMRU8eOj81g_40cq8gdA@mail.gmail.com>
 <f7e9cd32-3e2b-4f06-aa13-049c8b7ba29b@amd.com>
 <CAPj87rMbcZKy2ARe_tp_-+-tMu3FpS0C9R1BHVzjsUpOsU9M4g@mail.gmail.com>
 <5921076d-0150-4e0f-a3ef-1b8dec021630@collabora.com>
 <CAFZQkGymi1XY7m0Ghs8R2HaNRQptE_0NO-5J5Z2c61gDJRho3Q@mail.gmail.com>
Content-Language: en-US
From: Harry Wentland <harry.wentland@amd.com>
In-Reply-To: <CAFZQkGymi1XY7m0Ghs8R2HaNRQptE_0NO-5J5Z2c61gDJRho3Q@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YQBPR01CA0007.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:c01::15)
 To SJ0PR12MB5438.namprd12.prod.outlook.com
 (2603:10b6:a03:3ba::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR12MB5438:EE_|CH3PR12MB8076:EE_
X-MS-Office365-Filtering-Correlation-Id: 9b395380-c421-4f1e-5fbb-08dd98a06863
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?UG1jME1SYkl0TGdVK1ZSUmMxSDc4dTAwcmFKamdIU1g2WGd5UTZGNkRESlhw?=
 =?utf-8?B?Z01XZlp5YXRyTnpQc1p2Sk4rSHZSWlNCTUxkdElxWmJHVzRVcnluVCtHeGJZ?=
 =?utf-8?B?Yy9OSHF4WlE2TER6THo1ckFObytsQVZhTjZUc0lZTkxKdFpCN2dKVXVSNUwy?=
 =?utf-8?B?UmIzSjJFNmdSb3dGZzRoS21XeFhJd085RzdERjlDRGtnemI1RG5lbUxuYkUz?=
 =?utf-8?B?TDd5TmNBdkdVSFJOUGFoYzNjWVV0MXhjV3Y2cURCM3BQb2dPNzczdlZXWHhF?=
 =?utf-8?B?KzJjZlljSFpTWWVoRjhJTjdEWkt0OHVQdjl1aVFrZVE3MWc5SUYwNW9saFhx?=
 =?utf-8?B?YzBDRVFCeURPd1c4a0JRUStMbmVJaC9FSWRlRWdLTnZvS1RpTEZ6RndseVI4?=
 =?utf-8?B?ZHZmaEVoQjJDQUFieUxNbkY1WE80Z2JLV1RPM3JVbTJBaWhEL0xmSXJZVDdn?=
 =?utf-8?B?SlJ2QVdpRzJUQkV6aFphUnBKQlY1VUZCN3N2bzYxWmZXRFVaSFYxdytvQ25L?=
 =?utf-8?B?V1FZT09IM05Qa3JJbmZsOWQ5RXJzRitueXE2dVlFNndFQjE3N3lJMUhIRDB2?=
 =?utf-8?B?RisyNnY1QXVqbVlqZDh1amRVdmJWY1lGVzNuTVk5TnNXdFArTEI4TkxsUU5R?=
 =?utf-8?B?WDB1cDhvT0lpcW1zZVozTWxrT0locElUK1lON1BlVzdGeUs3UEJKTGU3dGpq?=
 =?utf-8?B?OVJhUzVzdjNsM0Y2b0JtWWlvY2wyajltYUp5NXhVY3BIYlljYTNTNll2bDJu?=
 =?utf-8?B?WXlLZTF5SzFXaEU2WXNMbWNmZkNQT3lSSWsvQ1hLbGVTaXJ6a3REd0FHQmda?=
 =?utf-8?B?NHJGMDByMlJRVEhkb2ZKRjRXUUNZUTcrL202NmtBcll5N0pENW1lNGJab0dE?=
 =?utf-8?B?UHRwbGZqanlacXJ2NW9iMTNFOUhKcVRkeHRZM2tNV1p5V052c2ZGelRZdkdE?=
 =?utf-8?B?OWZ1NnJINlI4ZXg3ZjdId1ErbVRDWkQ3dE1SdHRCZithbmN4TUd5MWFnOHBO?=
 =?utf-8?B?cEdmTXRnN3Z0L1Vtb1FZMHlEZVI1dVZuTnZ2ZzM2ajVuci9NS3dZRERwQWRU?=
 =?utf-8?B?UVN0QUZRdVBwMmlwQWg1anBXQms5clVTN2lyZ1UvZk5hbWZySk1vanNhT0Vw?=
 =?utf-8?B?TVhBWHlyT0VyR3Zyd2tZSFpMSUFJVytPVVRHYktoRFhROXZyVW1VWk10eGo1?=
 =?utf-8?B?THZ2UjFyWlRPalpwallpNTRQMXFGeVJtMWNZRm1vOWZucFU3cm16VWMvaWls?=
 =?utf-8?B?Umx6RUp3MzVyRFNxb3l5SS9mQm8zalF5N1kvUXpiRk9ITW5jR0prZU91OFNZ?=
 =?utf-8?B?YWR2U01lK1FpMjNuME11anRPOXNnYy9MbFVZeHJMUTRaT0wwaVNlZ2w2dm9m?=
 =?utf-8?B?OGxEbXlIZmJDYVhJR0psZ3ByQXRoRk1VaVV6K1RtQk9sTlJkc2hDYThFL1hz?=
 =?utf-8?B?S0FjTWFOamV4SnZwQks3ekZjOUFLeUJ2WXd1SExSUjFGTytkeTdIMW5rMWNl?=
 =?utf-8?B?K055Qkk1K1RuZVpLdHpNL1l1VE0yNFovYm5DNTE0SnR6SHJ3V0g1YVB0d2hD?=
 =?utf-8?B?N0t1ZEVGbVEwbXppQWFpQjQrbWZtNnd4cWo0NFpWc1JGT1JDRGR6c1IybUxE?=
 =?utf-8?B?cEZsYXB6TGlGTHEzT3l6YXZTVU00aTdrTVdkbWZ4R1d6b3cxV0ZCSXFSL211?=
 =?utf-8?B?dFFiWmtzUFJTM095ZkZYeDQ1SitRQ0tMbjJqdXBUUHVFSktxbk84anV4YzJE?=
 =?utf-8?B?NGZDSDB6aWdHeFFJRCtxTm5tZ2xmR2dCSFRQemNvcng4dlNpZW45YVBLM2hN?=
 =?utf-8?Q?RjFa0NJ0qSOlFC3ECoO4rmf+PZXd273luccB4=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR12MB5438.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dUtEQ1FCZjQ4M1h0QWNqOFN3WWhSWkRob1E1eExDcy82WEN6c2tMTi9EOVRM?=
 =?utf-8?B?RmVraThrbU5FSWpWWDltV3JsWnl3bjM2aC9uMSsyRGFEVjZVNml5ZUpHRVds?=
 =?utf-8?B?UjNBOWMrRXJ4SXBMY2VjVGthS3FxaVlMLzVCUmFyYWtlcGZuZ3RRNm1JdzVJ?=
 =?utf-8?B?OUVXbms3WHNQdzhHWUZ4N2lqR1lyRmxwcHZXbHR4Q09qZTNGQVBva1g0OHlL?=
 =?utf-8?B?WEo1VEIyT2EyUFQyanZvSmJSRTdZSHdzdEczZVZBSHp5dkYyeERQR1RFeXg2?=
 =?utf-8?B?WU9TTGJXazlTRmlHVXhVME5RVUU1dHk2YUd2bXJ5TlYycDFQZU1hN1V2bUxX?=
 =?utf-8?B?bWNvNW9tcTNic0xTdlJULzVtR1Ruc3ZMZWpYVkhHR1g2blZXaXZLYmtGbmJL?=
 =?utf-8?B?cnBBLzBEcGZmU2Q4eGtFY0VrbHErZDVncERJb21VQlZmeU9NTnNUZTU1UEU1?=
 =?utf-8?B?MlB4U0w2U1R5RFg1NnNHRkZIQS9lVjdjeFhXVjZqcWx2SEtRM3BtUHFpUTZ3?=
 =?utf-8?B?bm1IclhnaG9FNUlOM2tsSjAxeWNJbGlZR2xGRFY0NWNKcHFJUzRpR0JVK1Jh?=
 =?utf-8?B?alZWT3U3VE5PQ2Q1dUZrc09aL0hxVkxremhyRndmZ1Z3KzhQMXFQNXhwZG41?=
 =?utf-8?B?S0xweGFRVDFxYkg3eUxiOXBXa0ZBajJDRm4zayt3ZnNRUTIwS2luSzRQZXZL?=
 =?utf-8?B?LzFqOXdhZHppbDNodjk0elRTdWZnVTlBT3hoZURjQ0d0UU96aG5MZHArcENv?=
 =?utf-8?B?UzBUeEFwQ0NNTFo5MCtEbDc0dDUzbDIyaUhRODlXSmhLZ1h1Si9GdUFFazBw?=
 =?utf-8?B?M2g1TEJidEhGMHlOdU80NklaUHB1empyWS9HWkJ1ZzdTUTVlVldWZ1pleUpo?=
 =?utf-8?B?bnpId1Uwa3A5WCtGdEpjT3pxczJBS2dFb0lucFBybHNOZ2g0YjlLejlZbEFP?=
 =?utf-8?B?bUpNTXM4UXBHd2ZPT004MkVxOGhKTm9adTJ5Mk42L3hHNWtKZHdGOVBVNEVY?=
 =?utf-8?B?QnBXZUo5WmdhZk4zc2FUeW91NjJpcFZ3WW4vZ0R2RjRtb0pRc1p1T1VVTzE4?=
 =?utf-8?B?VTlPYTJFT1BPYUZBQUFOU21iZ3BUM1JnZElxRUFSb2lMQnZsbHF0a1ZGT29w?=
 =?utf-8?B?Zks5bVZoS3RtTHFWMFFkWjByOVVTRStKeWNQMXFENzJ6eVUzSytFZzMyM3ZP?=
 =?utf-8?B?Wkt4Vko3VEk5d2FubGJuVUI2ZHdjSWZjUjZQY0krcmN3MmpJUlFIbXpLb2Fh?=
 =?utf-8?B?SWFUeTFhZy9LZ1lZSnpCODdLVW9udmxXNmNJWnVnR2ZYaXRIL0lsYlNjUkZL?=
 =?utf-8?B?dTlIcDd4NGh6TEtsSnRUZThnbTJKVDZQNWk4TXI3SFpFVkhib21sM3ZRT0M3?=
 =?utf-8?B?Y21FbWpiSHZ6RUhoc0lkWVdPN0IvRXJQS0dxbEJqbmdxQUY0MXB6UmU3Mytq?=
 =?utf-8?B?dmR4dVBxNnZ5NmpDa3MzSmhhR0V0VFVJVXdDYjRCZTk4RVBWZTNFM2U2clZw?=
 =?utf-8?B?ZCtFYWhBNVdjTzBValdLUDlldjJtajdKdkI2L2tKME1WY2tzanZTOGhTRHJY?=
 =?utf-8?B?OVRZZWg5blhvZGVYRWFGcElRSlVraVVZdnFVWjBCSUw5MDZiT290SkcxUjJT?=
 =?utf-8?B?THJxRHRHV3FCUE9kb1lUWTRhNmJoOTZGNE5MbTdTdEFMdkZjMWt2RWlQRExI?=
 =?utf-8?B?ZGk5RklXSTBSa0ppb2JtNWpHVHdCMlRwK0FrYUdobDRhSlh3ZWdObUtaQkY3?=
 =?utf-8?B?RkQxbFVlTlFUZGNHekFQaVRrUU9pZUZZd25VR0hPeWZTMEh2Sms2Wm0wcXhJ?=
 =?utf-8?B?emxza0s1eCtBY3QrMlRBWGNtU3RxT2hRNk5iNWZxZ0JidmRNV0ZuaHVEWXF6?=
 =?utf-8?B?b0xMMWFKTWI1OWxDRzVlenpVSHdRa0hsaG0vYklxTUt6R09PU056RmptRmVh?=
 =?utf-8?B?Uk5iKzA1UzlTWGF5Yzhic2dmUjhwUE1OalpIdytWOTVRNTVRc3hTUEtSRm9O?=
 =?utf-8?B?K2xXckppODRmcFVJdDFld3VReUJtZFgrdndRMHVTazQ0cW9aaHhxN0huUGFU?=
 =?utf-8?B?dXRxVXZoVWxDOTdjaUpFb2Y2LzFkRHBEaDUvTEJ5SWtsYUdrenVITEsvU2hD?=
 =?utf-8?Q?V+L5wL6+CKUEcX2EFTbprCzrM?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9b395380-c421-4f1e-5fbb-08dd98a06863
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR12MB5438.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 May 2025 19:48:07.2395 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wjpMPSTpRug9atcDJBQ8HjLywBaRuWHD2VgMMz5nTzD021kWegAaRiE0SIw4fdv5SEG62wabYvdita8pqh+lnA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8076
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



On 2025-05-17 07:51, Xaver Hugl wrote:
> Am Do., 15. Mai 2025 um 22:00 Uhr schrieb Leandro Ribeiro
> <leandro.ribeiro@collabora.com>:
>>
>>
>>
>> On 5/15/25 15:39, Daniel Stone wrote:
>>> Hi,
>>>
>>> On Thu, 15 May 2025 at 19:02, Harry Wentland <harry.wentland@amd.com> wrote:
>>>> On 2025-05-15 13:19, Daniel Stone wrote:
>>>>> Yeah, the Weston patches are marching on. We've still been doing a
>>>>> little bit of cleanup and prep work in the background to land them,
>>>>> but we also can't land them until the kernel lands. None of that work
>>>>> is material to the uAPI though: as said previously, the uAPI looks
>>>>> completely solid and it's something we can definitely beneficially use
>>>>> in Weston. (Even if we do need the obvious follow-ons for
>>>>> post-blending as well ...)
>>>>
>>>> We can't merge kernel uAPI without canonical userspace that uses it.
>>>> To move forward we'll need a userspace to at least publish a branch
>>>> that shows the use of this new uAPI.
>>>>
>>>> Do you have a public branch for the Weston work for this?
>>>
>>> Yeah, https://gitlab.freedesktop.org/wayland/weston/-/merge_requests/1702
>>> has been around for a little while now. There are some driver bugs
>>> that Leandro commented on, but they don't seem material to the uAPI as
>>> such?
>>
>> Hello,
>>
>> Yes, there's nothing related to the API that is blocking us. It seemed
>> very flexible and easy to use. The bugs that I've spotted are probably
>> internal to AMD driver.
>>
>> I'd say that the Weston patches are converging nicely, we just need time
>> to get them fully reviewed. We had a few preparation MR's to land
>> before !1702, and now there's only one left (!1617).
> 
> I also updated the KWin MR
> (https://invent.kde.org/plasma/kwin/-/merge_requests/6600), it can now
> use all the available properties and I think it's ready. I found two
> issues with the kernel patches though:
> - while attempting to set COLOR_ENCODING and COLOR_RANGE results in
> the atomic commit being rejected, the existing values still get
> applied if you use YCbCr-type buffers. I would've expected the color
> pipeline to operate on the YUV values in that case - and leave
> conversion to RGB up to the compositor adding the relevant matrix to
> the pipeline

AMD HW always operates on RGB values, so there'll always be an
implicit conversion of YCbCr-type buffers to RGB. What we should
do is reject YCbCr-type buffers with the color pipeline until we
implement support for COLOR_ENCODING and COLOR_RANGE as a new
CSC colorop.

> - the interpolation mode drm properties for 1D and 3D LUTs are
> immutable, I think they shouldn't be - to make it less annoying if in
> the future we decide to add modes that userspace can set
> 

Makes sense to me.

Harry

> Other than that, I agree that it's ready to go.
> 
>> Thanks,
>> Leandro
>>>
>>> Cheers,
>>> Daniel
>>

