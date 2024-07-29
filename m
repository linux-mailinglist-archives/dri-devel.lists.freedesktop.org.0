Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 212EF93EFA5
	for <lists+dri-devel@lfdr.de>; Mon, 29 Jul 2024 10:16:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2549710E208;
	Mon, 29 Jul 2024 08:16:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="CApQENIu";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2081.outbound.protection.outlook.com [40.107.243.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EBC8210E200;
 Mon, 29 Jul 2024 08:16:27 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OefREA4BBJ+Cbmh2HtDjTSyl8cENS7bVlUU7BMTHuK57ybj9Qe+gDVuzvqtE+x4/WuwklVo167S3avf/+ODEgzw1RBbJ1scz4MITup6zyd7OxAqWyyidPtLlLtvRNrpHdTYVloz9uvk+LDiCv3KsngmCC0mimxOQANFTJIpUxG7muJzHooNJGfNkTB2NEigZrf6F2xb9PX6tP9ZqA/kgnO1FKhmXf68v4WBG6qvlYIYAyNpZzPteUNMcqPRbVEXgUyITL0oIvZxYSREATubTC54WiX4ngUD2t1xM9+J0qVSuSrV9R4EqgXKvgb5NEUB/J/Q5KS3JGuIUJXboLuvWdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pGICi4aIESKpMvOANF2f6mpQPu9HUe0TZsLhZv0skrM=;
 b=GZ4zeDkGQFkJh3P74b/guVc5As0Jh6R2dtqaAn6JAZGG2UsWnAYAuDFWe7ZgxUfn/ZRv6mR6yrKzP3R06dMg1V5HiCUZcD4Gtru773zjBR2hfpgklIT6TIDTTYFmix2U0pFFjH+BKOtTkoqJaT6fyv4N9SCAa+2hFFdt3eY3N5YegRVwGce1vjCK1E4rcAWPOvkH3P7/ba/5Zz0mHyYdpOSTSo27z7t7Z4RsQIfAXc5sM+685+0lJB1JEIFDncIvZ2uUf/9vwQU8dSomeWObRxJr6EKLkPk3ZwufztJ4gnPFRcPfFF3JLnINJWETB1SQEaLjagU3eyzTOamqzVR9WA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pGICi4aIESKpMvOANF2f6mpQPu9HUe0TZsLhZv0skrM=;
 b=CApQENIuIQXdZoxAJRlqggsdAKCaiht07TKFxzQBEsmJfnSppfKWHCVL/XqnI8u336Cij5qBfVkDs2PM3/Id99tsfFgRC8AA2FzlMlr/yOVLPZPhJJ9G7zNqcjLz2Hg3mH1igBObkegyYUBv3kRgnmAi43M9Ac0QyPgdONb1kaQ=
Received: from CO6PR12MB5489.namprd12.prod.outlook.com (2603:10b6:303:139::18)
 by IA0PR12MB7650.namprd12.prod.outlook.com (2603:10b6:208:436::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7807.27; Mon, 29 Jul
 2024 08:16:24 +0000
Received: from CO6PR12MB5489.namprd12.prod.outlook.com
 ([fe80::5f4:a2a9:3d28:3282]) by CO6PR12MB5489.namprd12.prod.outlook.com
 ([fe80::5f4:a2a9:3d28:3282%4]) with mapi id 15.20.7807.026; Mon, 29 Jul 2024
 08:16:24 +0000
From: "Lin, Wayne" <Wayne.Lin@amd.com>
To: "kevin@holm.dev" <kevin@holm.dev>, Linux regressions mailing list
 <regressions@lists.linux.dev>, "Deucher, Alexander"
 <Alexander.Deucher@amd.com>, "Wu, Hersen" <hersenxs.wu@amd.com>
CC: "regressions@lists.linux.dev" <regressions@lists.linux.dev>,
 "stable@vger.kernel.org" <stable@vger.kernel.org>, LKML
 <linux-kernel@vger.kernel.org>, ML dri-devel
 <dri-devel@lists.freedesktop.org>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>
Subject: RE: [REGRESSION] No image on 4k display port displays connected
 through usb-c dock in kernel 6.10
Thread-Topic: [REGRESSION] No image on 4k display port displays connected
 through usb-c dock in kernel 6.10
Thread-Index: AQHa4EIHlXNw8ZbqLEehA7MTA0aCA7IKx3CAgAKT1cA=
Date: Mon, 29 Jul 2024 08:16:23 +0000
Message-ID: <CO6PR12MB54897CE472F9271B25883DF6FCB72@CO6PR12MB5489.namprd12.prod.outlook.com>
References: <d74a7768e957e6ce88c27a5bece0c64dff132e24@holm.dev>
 <9ca719e4-2790-4804-b2cb-4812899adfe8@leemhuis.info>
 <fd8ece71459cd79f669efcfd25e4ce38b80d4164@holm.dev>
In-Reply-To: <fd8ece71459cd79f669efcfd25e4ce38b80d4164@holm.dev>
Accept-Language: en-US, zh-TW
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_ActionId=093394d7-c65c-42c8-a2e4-9a20ccfb951c;
 MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_ContentBits=0;
 MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Enabled=true;
 MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Method=Privileged;
 MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Name=Open Source;
 MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_SetDate=2024-07-29T08:04:24Z;
 MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CO6PR12MB5489:EE_|IA0PR12MB7650:EE_
x-ms-office365-filtering-correlation-id: d2dba14a-b85d-446d-2d3e-08dcafa6bc8d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?NGQ4YlYwcTVXTDNWZFBzQ3NBRTFaVVlxQkRERWQ1SlF3M2g4d1hhcmxleTlo?=
 =?utf-8?B?Z2d6Z0xPelpCUWVpUUl6cnhIK1c1cytJUlU5M09GSy95cCtDRklULzdsdmZT?=
 =?utf-8?B?MFpiS1h1czFYeU1LYlBHV0I4T1M3N0xnTXUwTnRHWTlHUXArSmdIakl2QU1B?=
 =?utf-8?B?Y0F3ZVNpaHpxc29CeXFpUXVyQ3ZZQ2NSMlZ3M0ZWSSs2cW5UbGM0ZjRZTmN4?=
 =?utf-8?B?Njl6QnlOUDYvUlBkQVA0WTRpbHUvWS95aUttRHJLNjVoRW44WE1mWWNkK3Iv?=
 =?utf-8?B?cFhJdm5xbUg2TXVFeEhYU0JZZVR5RVF4VWNIcUVGZEMzZ0tnQU9XUEVkMnJS?=
 =?utf-8?B?dmU5L2NPRUlmcGJ4UENqTzMyRlFKcXIxMzgyeEE2N25kOGtIdjBjemliNS9N?=
 =?utf-8?B?VE83OVZDaytjeVZBclZCT0V6dHdPSnozSDNCSk1BbU9sUmRsVENKOE1UQ2t0?=
 =?utf-8?B?aG9yb1I5Z2RVUzNYR3JncEliVEdXRml0NmNodStFUytwZHgwSEEzaHphZnF6?=
 =?utf-8?B?Y3djWjVpQnVZWWdpMWQwUFpRRHNNNGwzYzNOdG02Qzh5NVBXbVJibW9ENkNy?=
 =?utf-8?B?K3JrOXZWRkpPSDBtMklTb05vRi93SDlndG9iVERYQUdrb05KTlIxNURiTGhH?=
 =?utf-8?B?c0krS1dmMWcyeGdGUnduN0FRMlRua1c4Zm9BaHNpTlpPSEFwa1BGSExDSUs2?=
 =?utf-8?B?L3BvaVUzeXhtd29SZEpYTGpmQkF3clZaNjdEUWZFak8rdktNaUt2TmVsOUxy?=
 =?utf-8?B?MmNibWFlZ1BNdDRHZTI4RTc0ajdHT0ZQdXNCanV3SytER1JJYUF1c3Z4dS9k?=
 =?utf-8?B?eFhYd3dldnJxeHI2VHRIeTJrK0Q4TVJibXFQeDYwT1FzMkh5c0gxY0pqOWNB?=
 =?utf-8?B?NUlxSXpacFY2WWZXNXdzNnV4ampXTk83YVZkVzdCYzZROFhHc0RYZWJvRXgr?=
 =?utf-8?B?RlBoTFYvVjJoMFc3WkJrOEFENmpsRExaVW56bWdCS1krY0pkeUNtMG10dkQr?=
 =?utf-8?B?NUlsUndTeUx4aGQzd0VTdEdFa1ArVWlqZmJYR01MYXMxdDBUMzVUeEkxd2FG?=
 =?utf-8?B?MjN5WEpxejIxbkRYd0NMRTZCNGMxQnBMc0lDMjZzMTF5dUFydG9BdjY0a0ZO?=
 =?utf-8?B?dkF6OXpFY0Vjc3JOcnhqMGNJeFlxY3V6R3owNzJWM3JJSTNDbWg3VlZjU2xL?=
 =?utf-8?B?c2xUdjdIS0xLZFVqU2U5WkRUUzRsOXNFSkNSTVhjZ1JCVDVoSzQ5N1BrZXht?=
 =?utf-8?B?N2xoMFc2eFJKU1lubUZvNWQ4MU0vU2ZQVnRPYUtxMzhiNThnaUIyNVcvaWFm?=
 =?utf-8?B?SXcxaEJiaGxodndzejZBZkxMaFRIbUVKTGhtSi90R3RDcjhUUEpMUHExT01o?=
 =?utf-8?B?Tlp5YzliTjJFbkR2MGZXWkFqb2U1eFhKZGtzMFpMSmRIWWllRjkwTE9rMmxn?=
 =?utf-8?B?ZGZUU1RiaG5COEVBeTMxVVQybC8vVGlpaGlGTldJQUhuOXFBYnljSFB2UE53?=
 =?utf-8?B?WTJOWm91QXhCSiswUE1CYU9tZjAyYUpqTTNzQTdJcnFDTDUwZDg4U1E5bE5q?=
 =?utf-8?B?RFlwaFEvRFpSSGdaOHBYZkNRYmpxOG9JNDJLMmVoeFlYSHJyc0h2Z0UwM0p5?=
 =?utf-8?B?NXRzOUtpV1IrWkxxMmkxbDYvQTJmc0pZcFVMM2dxYkNVQ21ZaWg4SUNnUkZn?=
 =?utf-8?B?L2RaMFhEcUp2dDRQYSs2WS9ZT3B4U2hjN3pKZ2dTOU9kTmh4MTVZalJrWFJF?=
 =?utf-8?B?NFd0d1JYcVdKOG11K1c0Ym9yUkVQTlBXTThVcXJ5K1BncDVKVUdDcTdhbEwx?=
 =?utf-8?Q?hWZPMPehO8RoMbLW8FTuNPXey+wDEa4P7pcps=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR12MB5489.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?WEErMnJBM3dTbFNxcS9ha2g2MVdwSDQzZ1djeWlGWnQwZ0dlTU83M0pUODFS?=
 =?utf-8?B?YVdod2xRRDBaVSs0V1Y4STc4aFBsK1Foa1h4NnpqSFk1bEYwVUN2NjBIbmli?=
 =?utf-8?B?bDVtekc4aEtWZm1xL05YcTZ0YVFzbk9reGM4bDYvWjh0L1RxTjJSNnIzVDAx?=
 =?utf-8?B?TkpXeTVnQTV2YnZQbGJEbWFRVytUOS9TRkhCdFpCdVRKanNUWlRmdWxPYXcw?=
 =?utf-8?B?OGVacG02eWpIc2FhMmwyajJNWXVvZFNYaHB2SzdNWW1oTFBiOEtZSTNyTUVk?=
 =?utf-8?B?ZEFpTFMxaWhEZURyY0hCdTBacnNTUis4WnN5QWdCaWZ3aGszZk94RmRjSkZT?=
 =?utf-8?B?MUhOUkJSYlZzazJLbzRqM2tXSTdJb0ZRa2toWi8wUm13N2lSbVN3V3ZYdEEx?=
 =?utf-8?B?UTVNUnFka08xU2VLeGJjN0lJMElQWlBna3o0VzlEZzhoMXRCRHdOSm1nV2k3?=
 =?utf-8?B?U0RDb2VtcFdmdEwrQ3JXOVZXS0U2ZmVYcjJ5Mm1qT2sxY3FlZXBDSktDUlNL?=
 =?utf-8?B?N0lKbi9PelEycy9oYlRLOXY4RkRHSmFvdTJvQ09JQ1hpYk1RT0VBakljM05x?=
 =?utf-8?B?dFhTQ0VxQWliVmJQOTdSTEFOdFRaZkZJRUdKK3ZXMFlPYmhvQlNZQzJSQTJC?=
 =?utf-8?B?VzFpVEprdjgycFplTndacVVxQnZrU09DR1Zja1UyK0wvaGY3cFdyRlkzZVBw?=
 =?utf-8?B?NjhSKzVmOUFGdjdaSHpyUEhXVVVMUHdxUngvbXEwNmo3ZXBkN2hOREFxT3dG?=
 =?utf-8?B?dUJweG5SNmFNamFab0t3OFdPY2JLU2tUZUhocnNRZ3VKRkRZdkQvekxMaTVK?=
 =?utf-8?B?RWlid1FCYzZRUndPcVFWWks1REpod2trazg2K04xQm1OWGJRZElTRkVsMGVv?=
 =?utf-8?B?a0dSZFZNb2lEcWlFdTVHZHE2azhOTXpMa0pyY2hqWUg4M0hqcEhTaStJL0h3?=
 =?utf-8?B?ZTlRQkR6ZHhSRExnYWxJUUVLcW9OQXgrcUNFMDRRQ1h1Y2g5dXh3RXhHdS9C?=
 =?utf-8?B?SlhYVFZrcHR1eVBjc1llYVVLUHovOU5nRTQ3ZVZScklQMDZpb2hRbXBUWDhO?=
 =?utf-8?B?dVcxYlNIMlVJaEE3ZFFyZ3Jodlp6MzhTWkxWS1dkeDROQ1FGOGFnTWwwTEYv?=
 =?utf-8?B?RS96bkI2T0xSWi8zVlE3RUhEYTltdmlUWi9QSi9QQ0ZDZE1NdDd5T3BQckh3?=
 =?utf-8?B?Y24veXBkUi9KNksyR0o5NFZjMExWSWJveS9XN0pZM0hXd1ZDOUtRRm5lN292?=
 =?utf-8?B?MnJoQ3paTTE4ZGJtY3JKN3FwTGlMc0lnNysxZ1RHYlVXeE9sempCUEI2Y2hQ?=
 =?utf-8?B?eWc2R2FnYklWdGxsTUNZQUJVeFZad25xNFgwVnIyMUtWbUpMNDdQTWMzM0Zx?=
 =?utf-8?B?VUI5RExUTXhOREt3M2E0VEVGQUdIOGY5NjA4aGpGSDVjTklOa3pUUnRpVDhH?=
 =?utf-8?B?bHVNcDFuK083SDBRSlcwQXRXRHErak80cCtHczcwajgvTmwvSFRLUGZHV1Ru?=
 =?utf-8?B?RUZScVlqWUhGWGEwQ09pbm14c0E1eEd0Z3I5Um04TzNER0hOS2Ixbkd0U1VU?=
 =?utf-8?B?MnFPNW40bXA4cjRQYm9mUWhEQllVREZCSkhnMUY4eGxPdzA2bEFCdzhLbllQ?=
 =?utf-8?B?RC9IcktRdmZveXlJQ0s5UTFpV0lWUGhKZG0rZElidXVzTHhHYnM3Tkk2Uldj?=
 =?utf-8?B?ZHdMU0RuYjk5bHcveUFTUHh6MWExMVl1ZkpxVnRHZEJsWkk4T2F5cDlXbkpV?=
 =?utf-8?B?RFlmejcyWmdEdDVNeWhxR0thNnoxOWI1MlFtMWxyOEdCOGtOK25lVEV6SFpG?=
 =?utf-8?B?U0RXMlR3V09MQndoLzVlZGZQcVRJNlRtT1Fna0hYZEhLRHBnZ05veVlFVk1J?=
 =?utf-8?B?QXRvU3N6THZXUnBmdXdHS2dDZDhjcUp3T2tGOGNSUVBZaFNVK2VEWXVuME04?=
 =?utf-8?B?eGlSRFdNdEdkelQwTnJUZ0IzVk92dnhWeTY3SHYxVjJFSkVwdGsycldMWlhk?=
 =?utf-8?B?cHViZE0wRHl2SC9yUDhCUnFyT3VBL0cwSEN1Q1ZWeDQ1NXNhZGRLZGY4dm9P?=
 =?utf-8?B?VlB3L01wRDVzQzliZ09UVHdpbXpqYnFaVE14M2t3Qm5HbEZoWnJYc0RDVlpq?=
 =?utf-8?Q?VODU=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO6PR12MB5489.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d2dba14a-b85d-446d-2d3e-08dcafa6bc8d
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Jul 2024 08:16:24.1937 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Bsa2mgT+decQlO2/jah94kJIQyJBB4t9RqsMbchzMK31eKrR1W37Y7ROxgctshtOzcZh7T81qTkPTl22ARGrMQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB7650
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

W1B1YmxpY10NCg0KSGksDQpUaGFua3MgZm9yIHRoZSByZXBvcnQuDQoNClBhdGNoIGZhNTc5MjRj
NzZkOTk1ICgiZHJtL2FtZC9kaXNwbGF5OiBSZWZhY3RvciBmdW5jdGlvbiBkbV9kcF9tc3RfaXNf
cG9ydF9zdXBwb3J0X21vZGUoKSIpDQppcyBraW5kIG9mIGNvcnJlY3RpbmcgcHJvYmxlbXMgY2F1
c2luZyBieSBjb21taXQ6DQo0ZGY5NmJhNjY3NjAzNCAoImRybS9hbWQvZGlzcGxheTogQWRkIHRp
bWluZyBwaXhlbCBlbmNvZGluZyBmb3IgbXN0IG1vZGUgdmFsaWRhdGlvbiIpDQoNClNvcnJ5IGlm
IGl0IG1pc3NlcyBmaXhlcyB0YWcgYW5kIHdvdWxkIHN1Z2dlc3QgdG8gYmFja3BvcnQgdG8gZml4
IGl0LiBUaGFua3MhDQoNClJlZ2FyZHMsDQpXYXluZSBMaW4NCj4gLS0tLS1PcmlnaW5hbCBNZXNz
YWdlLS0tLS0NCj4gRnJvbToga2V2aW5AaG9sbS5kZXYgPGtldmluQGhvbG0uZGV2Pg0KPiBTZW50
OiBTdW5kYXksIEp1bHkgMjgsIDIwMjQgMTI6NDMgQU0NCj4gVG86IExpbnV4IHJlZ3Jlc3Npb25z
IG1haWxpbmcgbGlzdCA8cmVncmVzc2lvbnNAbGlzdHMubGludXguZGV2PjsgRGV1Y2hlciwNCj4g
QWxleGFuZGVyIDxBbGV4YW5kZXIuRGV1Y2hlckBhbWQuY29tPjsgV3UsIEhlcnNlbg0KPiA8aGVy
c2VueHMud3VAYW1kLmNvbT47IExpbiwgV2F5bmUgPFdheW5lLkxpbkBhbWQuY29tPg0KPiBDYzog
cmVncmVzc2lvbnNAbGlzdHMubGludXguZGV2OyBzdGFibGVAdmdlci5rZXJuZWwub3JnOyBMS01M
IDxsaW51eC0NCj4ga2VybmVsQHZnZXIua2VybmVsLm9yZz47IE1MIGRyaS1kZXZlbCA8ZHJpLWRl
dmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZz47DQo+IGFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Au
b3JnDQo+IFN1YmplY3Q6IFJlOiBbUkVHUkVTU0lPTl0gTm8gaW1hZ2Ugb24gNGsgZGlzcGxheSBw
b3J0IGRpc3BsYXlzIGNvbm5lY3RlZA0KPiB0aHJvdWdoIHVzYi1jIGRvY2sgaW4ga2VybmVsIDYu
MTANCj4NCj4gPiBbYWRkaW5nIGEgZmV3IHBlb3BsZSBhbmQgbGlzdHMgdG8gdGhlIHJlY2lwaWVu
dHNdDQo+ID4NCj4gPiBIaSEgVGh4IGZvciB5b3VyIHJwZW9ydC4NCj4gPg0KPiA+IE9uIDI3LjA3
LjI0IDE4OjA3LCBrZXZpbkBob2xtLmRldiB3cm90ZToNCj4gPg0KPiA+ID4NCj4gPiA+IENvbm5l
Y3RpbmcgdHdvIDRrIGRpc3BsYXlzIHdpdGggZGlzcGxheSBwb3J0IHRocm91Z2ggYSBsZW5vdm8g
dXNiLWMNCj4gPiA+DQo+ID4gPiAgZG9jayAodHlwZSA0MEFTKSB0byBhIExlbm92byBQMTRzIEdl
biAyICh0eXBlIDIxQTApIHJlc3VsdHMgaW4gbm8NCj4gPiA+DQo+ID4gPiAgaW1hZ2Ugb24gdGhl
IGNvbm5lY3RlZCBkaXNwbGF5cy4NCj4gPiA+DQo+ID4gPg0KPiA+ID4NCj4gPiA+ICBUaGUgQ1BV
IGluIHRoZSBMZW5vdm8gUDE0cyBpcyBhICdBTUQgUnl6ZW4gNyBQUk8gNTg1MFUgd2l0aCBSYWRl
b24NCj4gPiA+DQo+ID4gPiAgR3JhcGhpY3MnIGFuZCBpdCBoYXMgbm8gZGlzY3JldGUgR1BVLg0K
PiA+ID4NCj4gPiA+DQo+ID4gPg0KPiA+ID4gIEkgZmlyc3Qgbm90aWNlZCB0aGUgaXNzdWUgd2l0
aCBrZXJuZWwgdmVyc2lvbiAnNi4xMC4wLWFyY2gxLTInDQo+ID4gPg0KPiA+ID4gIHByb3ZpZGVk
IGJ5IGFyY2ggbGludXguIFdpdGggdGhlIHByZXZpb3VzIGtlcm5lbCB2ZXJzaW9uDQo+ID4gPg0K
PiA+ID4gICc2LjkuMTAuYXJjaDEtMScgYm90aCBjb25uZWN0ZWQgZGlzcGxheXMgd29ya2VkIG5v
cm1hbGx5LiBJIHJlcG9ydGVkDQo+ID4gPg0KPiA+ID4gIHRoZSBpc3N1ZSBpbiB0aGUgYXJjaCBm
b3J1bXMgYXQNCj4gPiA+DQo+ID4gPiAgaHR0cHM6Ly9iYnMuYXJjaGxpbnV4Lm9yZy92aWV3dG9w
aWMucGhwP2lkPTI5Nzk5OSBhbmQgd2FzIGd1aWRlZCB0bw0KPiA+ID4NCj4gPiA+ICBkbyBhIGJp
c2VjdGlvbiB0byBmaW5kIHRoZSBjb21taXQgdGhhdCBjYXVzZWQgdGhlIHByb2JsZW0uIFRocm91
Z2gNCj4gPiA+DQo+ID4gPiAgdGVzdGluZyBJIGlkZW50aWZpZWQgdGhhdCB0aGUgaXNzdWUgaXMg
bm90IHByZXNlbnQgaW4gdGhlIGxhdGVzdA0KPiA+ID4NCj4gPiA+ICBrZXJuZWwgZGlyZWN0bHkg
Y29tcGlsZWQgZnJvbSB0aGUgdHJvdmFsZHMvbGludXggZ2l0IHJlcG9zaXRvcnkuDQo+ID4gPg0K
PiA+ID4NCj4gPiA+DQo+ID4gPiAgV2l0aCBnaXQgYmlzZWN0IEkgaWRlbnRpZmllZA0KPiA0ZGY5
NmJhNjY3NjAzNDU0NzFhODVlZjdiYjI5ZTFjZDRlOTU2MDU3DQo+ID4gPg0KPiA+DQo+ID4gVGhh
dCdzIDRkZjk2YmE2Njc2MDM0ICgiZHJtL2FtZC9kaXNwbGF5OiBBZGQgdGltaW5nIHBpeGVsIGVu
Y29kaW5nIGZvcg0KPiA+DQo+ID4gbXN0IG1vZGUgdmFsaWRhdGlvbiIpIFt2Ni4xMC1yYzFdIGZy
b20gSGVyc2VuIFd1Lg0KPiA+DQo+ID4gRGlkIHlvdSB0cnkgaWYgcmV2ZXJ0aW5nIHRoYXQgY29t
bWl0IGlzIHBvc3NpYmxlIGFuZCBtaWdodCBmaXggdGhlIHByb2JsZW0/DQo+DQo+IFJldmVydGlu
ZyBpcyBub3QgZWFzaWx5IHBvc3NpYmxlOg0KPg0KPiAkIGdpdCBjaGVja291dCB2Ni4xMA0KPiBb
Li4uXQ0KPiBIRUFEIGlzIG5vdyBhdCAwYzM4MzY0ODI0ODEgTGludXggNi4xMA0KPg0KPiAkIGdp
dCByZXZlcnQgNGRmOTZiYTY2NzYwMzQ1NDcxYTg1ZWY3YmIyOWUxY2Q0ZTk1NjA1Nw0KPiBBdXRv
LW1lcmdpbmcNCj4gZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2FtZGdwdV9kbS9hbWRncHVf
ZG1fbXN0X3R5cGVzLmMNCj4gQ09ORkxJQ1QgKGNvbnRlbnQpOiBNZXJnZSBjb25mbGljdCBpbg0K
PiBkcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvYW1kZ3B1X2RtL2FtZGdwdV9kbV9tc3RfdHlw
ZXMuYw0KPiBlcnJvcjogY291bGQgbm90IHJldmVydCA0ZGY5NmJhNjY3NjAuLi4gZHJtL2FtZC9k
aXNwbGF5OiBBZGQgdGltaW5nIHBpeGVsDQo+IGVuY29kaW5nIGZvciBtc3QgbW9kZSB2YWxpZGF0
aW9uDQo+DQo+IEkgZG8gbm90IGtub3cgZW5vdWdoIHRvIHRyeSBhbmQgc29sdmUgdGhlIGNvbmZs
aWN0IG15c2VsZiB3aXRob3V0IGJyZWFraW5nDQo+IG1vcmUgdGhpbmdzLg0KPg0KPiA+DQo+ID4g
Pg0KPiA+ID4gYXMgdGhlIGZpcnN0IGJhZCBjb21taXQgYW5kDQo+IGZhNTc5MjRjNzZkOTk1ZTg3
Y2EzNTMzZWM2MGQxZDVlNTU3NjlhMjcNCj4gPiA+DQo+ID4NCj4gPiBUaGF0J3MgZmE1NzkyNGM3
NmQ5OTUgKCJkcm0vYW1kL2Rpc3BsYXk6IFJlZmFjdG9yIGZ1bmN0aW9uDQo+ID4NCj4gPiBkbV9k
cF9tc3RfaXNfcG9ydF9zdXBwb3J0X21vZGUoKSIpIFt2Ni4xMC1wb3N0XSBmcm9tIFdheW5lIExp
bi4NCj4gPg0KPiA+ID4NCj4gPiA+IGFzIHRoZSBmaXJzdCBjb21taXQgdGhhdCBmaXhlZCB0aGUg
cHJvYmxlbSBhZ2Fpbi4NCj4gPiA+DQo+ID4NCj4gPiBIbW0sIHRoZSBsYXR0ZXIgY29tbWl0IGRv
ZXMgbm90IGhhdmUgYSBmaXhlcyB0YWcgYW5kIG1pZ2h0IG9yIG1pZ2h0IG5vdA0KPiA+DQo+ID4g
YmUgdG8gaW52YXNpdmUgdG8gYmFja3BvcnQgdG8gNi4xMC4gTGV0J3Mgc2VlIHdoYXQgdGhlIEFN
RCBkZXZlbG9wZXJzIHNheS4NCj4gPg0KPiA+ID4NCj4gPiA+IFRoZSBpbml0aWFsIGNvbW1pdCBv
bmx5IHN0aWxsIHNob3dzIGFuIGltYWdlIG9uIG9uZSBvZiB0aGUgY29ubmVjdGVkDQo+ID4gPg0K
PiA+ID4gIDRrIHNjcmVlbnMuIEkgaGF2ZSBub3QgaW52ZXN0aWdhdGVkIGZ1cnRoZXIgdG8gZmlu
ZCBvdXQgYXQgd2hhdCBwb2ludA0KPiA+ID4NCj4gPiA+ICBib3RoIGRpc3BsYXlzIHN0b3BwZWQg
c2hvd2luZyBhbiBpbWFnZS4NCj4gPiA+DQo+ID4NCj4gPiBDaWFvLCBUaG9yc3RlbiAod2Vhcmlu
ZyBoaXMgJ3RoZSBMaW51eCBrZXJuZWwncyByZWdyZXNzaW9uIHRyYWNrZXInIGhhdCkNCj4gPg0K
PiA+IC0tDQo+ID4NCj4gPiBFdmVyeXRoaW5nIHlvdSB3YW5uYSBrbm93IGFib3V0IExpbnV4IGtl
cm5lbCByZWdyZXNzaW9uIHRyYWNraW5nOg0KPiA+DQo+ID4gaHR0cHM6Ly9saW51eC1yZWd0cmFj
a2luZy5sZWVtaHVpcy5pbmZvL2Fib3V0LyN0bGRyDQo+ID4NCj4gPiBJZiBJIGRpZCBzb21ldGhp
bmcgc3R1cGlkLCBwbGVhc2UgdGVsbCBtZSwgYXMgZXhwbGFpbmVkIG9uIHRoYXQgcGFnZS4NCj4g
Pg0K
