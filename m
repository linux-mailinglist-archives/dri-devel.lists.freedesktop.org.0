Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EDAAC925525
	for <lists+dri-devel@lfdr.de>; Wed,  3 Jul 2024 10:13:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4101A10E757;
	Wed,  3 Jul 2024 08:13:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="wtDPOnlU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2077.outbound.protection.outlook.com [40.107.93.77])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B65FE10E755;
 Wed,  3 Jul 2024 08:13:48 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PeGKSNU7Kk2WMv78zZF0m4eqw0DdTmnK8txjoYh+O++K4gYDOyUEvU8oLGurltaKmPuDAsL2u5iJaA5mqiK5Pnq7BZRJH85tVzicBHZA2dpmTwwbOzjtbLcg6EMBebCUtXEBdrttjkpqqH3K2itxUI364S7uVU3pvaBFaWg4x8MbCpacAbtqTuYlPf+3NyB+C5mH3O8tPYfWr3+mZlFfUMbl5Y9yIsYuPVOlZkqoSZFZQ/Iw6ceh8I9YV7meLztckZH6MMrNF0EVBg0UVbZpRYzfuYuq5yhG4flN7jjwzRlpuIqOFpV8FxmEhHzErc0wklWiQ4WitoTfPV3yqkdWjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=n+M5BO39vI0d5pqdoI80KwfLx8KAC4wFKZHkvP23Fho=;
 b=Lf9Fqx4RjAEEp+fGOf/uoyRklyV/auru6RiU7C7WxQ6tA92tY43L42pOlViGgqPFz9bF2kPDFOCPBI0rlwcVo8EkgniykwWrfbGYRdvkmMFy5GrlWm84xoILCpg7PL9YKi5x0w8HX79Q9VwX9KRm5TJrC0PHNjb2w6N71DMt4dNTsa9IvaIza+f0rMRGUmxb9j1OXkp6H1GvT64T4RfDzoc/5zhQlaTMorWpbqpx23I3vtS7X/eE4XR+yFpJRyCJ94hpJsCAaK5+hLU8iuATY1HIM6W+G2vtUG8LH74UvgfJuKEh2WQQ0GK+FzqkaYpBru+6p6mbyHty3TEs2IZ4Ig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=n+M5BO39vI0d5pqdoI80KwfLx8KAC4wFKZHkvP23Fho=;
 b=wtDPOnlUplz7ihc7+Jrm99Dc8UqDSHMrj4xxkB66fpMF/986no5g6dIzqsALEeaTB3Yp+XjBhgJnx3bFHjLr9s0ceGgnx543zRUaKg8ju18G2FM8JMPb8djUdKKN4WOG5PHGCtaHa9TZTLDl4gtt8S6T23wzCTdFNYSITJqiEx4=
Received: from CO6PR12MB5489.namprd12.prod.outlook.com (2603:10b6:303:139::18)
 by IA0PR12MB8205.namprd12.prod.outlook.com (2603:10b6:208:400::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7719.26; Wed, 3 Jul
 2024 08:13:45 +0000
Received: from CO6PR12MB5489.namprd12.prod.outlook.com
 ([fe80::5f4:a2a9:3d28:3282]) by CO6PR12MB5489.namprd12.prod.outlook.com
 ([fe80::5f4:a2a9:3d28:3282%5]) with mapi id 15.20.7741.017; Wed, 3 Jul 2024
 08:13:45 +0000
From: "Lin, Wayne" <Wayne.Lin@amd.com>
To: Lyude Paul <lyude@redhat.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>
CC: "jani.nikula@intel.com" <jani.nikula@intel.com>, "imre.deak@intel.com"
 <imre.deak@intel.com>, "daniel@ffwll.ch" <daniel@ffwll.ch>, "Wentland, Harry"
 <Harry.Wentland@amd.com>, "Zuo, Jerry" <Jerry.Zuo@amd.com>,
 "stable@vger.kernel.org" <stable@vger.kernel.org>
Subject: RE: [PATCH 2/3] drm/dp_mst: Skip CSN if topology probing is not done
 yet
Thread-Topic: [PATCH 2/3] drm/dp_mst: Skip CSN if topology probing is not done
 yet
Thread-Index: AQHax6XEXOzpmMdGQUyjQvrOMBiDabHaOjoAgAEUSnCAAianAIAHOxQw
Date: Wed, 3 Jul 2024 08:13:45 +0000
Message-ID: <CO6PR12MB54896C867944E5D249C76DACFCDD2@CO6PR12MB5489.namprd12.prod.outlook.com>
References: <20240626084825.878565-1-Wayne.Lin@amd.com>
 <20240626084825.878565-3-Wayne.Lin@amd.com>
 <7da3ccf156a858c1a7d2691fbedfa7aa2ceccdf7.camel@redhat.com>
 <CO6PR12MB5489CB4E5CFB71CF8E812BEEFCD72@CO6PR12MB5489.namprd12.prod.outlook.com>
 <9004911c3b8c44afecb354db736f4d7d84c0cf19.camel@redhat.com>
In-Reply-To: <9004911c3b8c44afecb354db736f4d7d84c0cf19.camel@redhat.com>
Accept-Language: en-US, zh-TW
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_ActionId=3beaf90f-4ddf-4c66-8ff0-8e8c4a35bf77;
 MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_ContentBits=0;
 MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Enabled=true;
 MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Method=Privileged;
 MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Name=Open Source;
 MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_SetDate=2024-07-03T08:05:39Z;
 MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CO6PR12MB5489:EE_|IA0PR12MB8205:EE_
x-ms-office365-filtering-correlation-id: 5e3b7ac0-73a9-43e8-83df-08dc9b380eff
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|1800799024|376014|366016|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?OFk1SEdRRlAwM0tRZ1c5V2dMbVNwOW8yQmtsVTNLWjh1eFNEVnppMThReWFy?=
 =?utf-8?B?cnlzRWJkc0xSNEp5b1c5NmRlL2MwZGJmSGZmVjFTRXNtc3g0NnlxcGhnV3NV?=
 =?utf-8?B?NDR4cHcrVTNqZ0VwR2hRMGZoemNZakZEMWtjczFZcDlhbFA2REZmem1hNENN?=
 =?utf-8?B?b2oxMytBNDFOZ0JrWXZGMFhTbHFvdFdHNVh1TDlJNVNtTDZKcitwWTUwNkUv?=
 =?utf-8?B?cWRyWm53T1Bkb1ByemluMk5ycExhV1VuWmk5V2VCUm94bnVsUmhNVGpLRC9J?=
 =?utf-8?B?SDNuS2VUQWd1VitNMHlsZnNwbVp5SHBpcFlHb0RkWXBFMW0yd0RtSFl5Z0pS?=
 =?utf-8?B?OFJaRTllYVY0L3BzMFNMSkIyaDJQS1l0dUVSMGd2NlZRbHRaMVd5SWtrT0hX?=
 =?utf-8?B?cU5mWTBZclgvc2JtcWlEQ0tka0NKRmdPWktMdzArMXl2bUJSTVk2UjZCcnVL?=
 =?utf-8?B?alNJeElTRGNQeFYxb3lVY0xQamJOYnF3VWJhWU8zR1cxVENYNjhvMG9nTFpE?=
 =?utf-8?B?RlJFdjcxYmVaTUd1V0J6ajBkRVpSU1I5T25KbGtlL2JtRUYxYitiUDJtOG5s?=
 =?utf-8?B?MXZWQzZpWTVOWEhwNHV4ZVVOL25DdjlTMi9sUy9hYUlaVTVyelBBSjZ5Zmkv?=
 =?utf-8?B?NnFmYUtNbm9IOFRmUkxiZm9KdHBZeFJQV3JTMGVRMW1xQUlKV1hLcUhFZ0Va?=
 =?utf-8?B?ZXpsWFBsdkpPTk81Q2J1Nmh3Uk95K2ZxaFhWaCtXd1pjUTB2WFVvVXYzVllo?=
 =?utf-8?B?cE56dzZIN2xTRWVEeXprSWhiSnNkOFg3OEhjR21ZTzRxazZhbjE0NTlsYjc2?=
 =?utf-8?B?TTBJWWRnUjZhcVEwNENOeVRrL3FEOUFvZk5hQzBFeUhXTGUwRE1halpBMm5G?=
 =?utf-8?B?bVVrRTZyWHdEb2Z1bjFDOFhDaXhYS3poeE8wZktyS3U1RTJ6RzZGSVBLUWEr?=
 =?utf-8?B?T1pncU40d3JwWExzY3NJNGxTVDJRbWhDQkRteXdGR1BRSEc3MWRSNjVrVlNE?=
 =?utf-8?B?NExHZnpncmlpMjYvL2szS3BPLzRoaHhzZkNKR2sxWFg0U2JMT1BSY0xaQy9i?=
 =?utf-8?B?SjNHSXAwdUJiR0puRkJienFHeVpzNC9XdzZnVFUrSlAxVkxFdHNWZlBPVDdI?=
 =?utf-8?B?TElhTG9yZHpDVDQ3amNXMytabW1ua0hIM3JOcXJpUVZhKy9hNkpRcXorNEdT?=
 =?utf-8?B?bmtJWDJSMXE2ZXhtR1lLZStORTR6Nkx2dmV1MlNOM3ZKSXMzU3g5UHp2eFVl?=
 =?utf-8?B?WVVzOFh3VHJUMmVwRnNnT2pzZXZFUXIyemVGY08xNHJyVC9pdFlVNnJKMzZq?=
 =?utf-8?B?WTE5MUd2Um1DakxDL2JkZkU5NlNUR3Q5bE9wK0VYbUllejUrNHp6WXBOSWs5?=
 =?utf-8?B?Rk5EcVAvVjNNZ1JDb3FkU2FaQnoxaWIzTHF3RjFQOXpnSDhwcFJHejJLV1l5?=
 =?utf-8?B?cFhqMnpxTW8wOEZkS2c3MzMyb2hTb2piVWZmOTdoWU5UMXA1NzRyNFJQZHA4?=
 =?utf-8?B?dit0Q2FPTnNaS2dSaTNPRU9kRVVtWWxSaC8wcWFoeWh3eTR6Wms4M29XWFIx?=
 =?utf-8?B?dVJYZ0FGVk1YQlhFcXhjV1I4L3ZvaFh2cUZDcXNjejhuSmUzbzhoa3R5OFl2?=
 =?utf-8?B?M3hiUTdybEtjQ3N0ZkwvSU5sSmUxVWZiRWJoK3RuK3BpSW8vOWpxWSt2RUZp?=
 =?utf-8?B?YUFKKyswZGhuSTJFeHlaNHJpNElwT094SGtDZXlzUUdvYUx0cWVPM3d6ZUc0?=
 =?utf-8?B?MC9nY21JNG92ZEovblZWdm13SDJQcVRDWGpRUU1DNkM1bGFiMDQ4YUNqOHhq?=
 =?utf-8?B?OU1EQS84WTlVOVRrWW1vbDA2ZE0yNktnWm54RmdVajNRL2krNFhzbW8rWmQ0?=
 =?utf-8?B?SjF1SGFoU1loSGlaRFU4ekFLcUo5UEJDVThISVczYkFiNmc9PQ==?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR12MB5489.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?bEdLN0hIcmpzakR6VkpVNU9va0RJQ2RDTHlwUDF6M0crVzI1Q3BLcmdMeGJ4?=
 =?utf-8?B?SDNYMmtnYm90czJzcmErcnB1SVZQK0FMcTNraUxqeXN2Y3pwY1hjUkh6dVlX?=
 =?utf-8?B?R1hMSEsrU1Y0SFdWRENvNnVhTkowM0FwSlBzQnBTa0NLQmdBc1FEd3ZtdGEw?=
 =?utf-8?B?VElZQ1pET3lnNUNDYjRTNnlvRzNCMUUwSkQ3ZnIwTFVHaWZNWEwyQTlDVW1r?=
 =?utf-8?B?UjdJOFd1cU5vUDlOMkVKTk51MFpKa3FrV1BiM0hKOEJRVmFhcys0ZUl6YVBk?=
 =?utf-8?B?YXpnN2RDOVMrNVpRSjBiVVJ2QjZOZ3E0NjdGVFlkM3pZMGRLUkkzRWtIejFw?=
 =?utf-8?B?S0x1NmlwTFJndUJ3ckdWSE5UUk05WjFSV0RuOFdlZm1HS1dOaTBDMTlYcGky?=
 =?utf-8?B?TTlVT3lVK3BzTjlPNXJYSFhSUmRqRGRaTWtGQmt4TXF3KzdySXYxeTdVck9X?=
 =?utf-8?B?a205cUhjNFk3WlFVb3B6VWlsMm14U2IwSmZwSHV2MklKSXlhTTZpcjNwUnAz?=
 =?utf-8?B?a01FT1haRzNZZTFTS3QwKzg4SHpxKzdUTCtOSkE3K1BCQTBINVhxbjlZUXg3?=
 =?utf-8?B?SXBLRzNHNnhQejdPbWdmNDVuZForRVZXRFpPaHpVTUhkMXFsM2lGVmxSVXEz?=
 =?utf-8?B?WTZXc0luMGQzZ3NrNERrUlVlVmhBTjJJYjB6RTNJbWIwNlV0clVkbnZYZ0ww?=
 =?utf-8?B?SUlWUGNUajBkYmU5R3NzVzhqTUMxTjk4WUF2Z1d0Zkcwc1l0Tk9XRlcyNFVa?=
 =?utf-8?B?NVZsZFNySVk5UmtpTjEycTBhTUhnalhQWVJRMWtiOGluZG9VY1dPYUxOS1dM?=
 =?utf-8?B?c2U5U2tSS0dPRExVM2Y3VVhuRjJSbnV6aEZWTlJRY3dSNDBOSUY4RUxDUWQ3?=
 =?utf-8?B?MlpnMTJoM042UnROcHhWOEJuTWtkNFN2MERwYVlYTVNtVFFHbEZ3ZEhCSEtC?=
 =?utf-8?B?K0Nlb3o4aXZNNWo2ZFVtM1oxNG50MHc1cElURVd6dFZMbkJjR2QzbmxzclF6?=
 =?utf-8?B?SDJXNEZaZTkvOHRHMHdUNk1tL0hRTWoydTFGOElvRjVQSnk5RGxValFKRy81?=
 =?utf-8?B?ZTA4aTNRNVBYaWwxZEJZZlBNMGphbCtlb09WbjNQakRxUU1sdlYzSjFuL3F1?=
 =?utf-8?B?SndWWnlPaTJQMi9PcUFUZmNLN2tjbStCZG5RdFdMTkNPcGNlUm9NYzM3UURD?=
 =?utf-8?B?R3VSN1FFR0NSQnh6aDBUTTlOWEhNMVZISUtXMXczR2NJTlBwWk1DRTJFOFJL?=
 =?utf-8?B?QU5uQy9tZExmZExuSGpKSGRvY2VZNjkwSWJnbmMrUkExSnJ4VzdWWmhNN2JZ?=
 =?utf-8?B?MzJGQzhOUUtGZ1ZnaTFFVEFOMm1aUUkxS3BxVWd5SkVpNHpNNk1lNTluVDd2?=
 =?utf-8?B?NTlvVmlaTmtlMW1DVndyLzRya1FvU0F2UVBQSW5pMnZybk8yN3g1ajVheFY3?=
 =?utf-8?B?bW96OVFsM25OK0ZVdzJ3cElRWnFiWUtNYXdKYVBjeHliUVMrcTFVSmxkanRU?=
 =?utf-8?B?Sk4wS0xPdGVyVFFZYXNXSE02ckcvZWpUT0NZM0lFN3RBWWh3RWNxcjdudFB0?=
 =?utf-8?B?RGNVSzFkNlUzQThRbHUzNFVERi9pQlhwRi9xUytUMzVSRTZTcVhmSUVMTmlH?=
 =?utf-8?B?RVFYMmxLTHdIaG01b3V1dHlybnFWcUtZVVFIcE9kU000eVJBL2dmaUVxSlJL?=
 =?utf-8?B?RmhKM1dralFsTmE3MC9FSDlhWHJIdXNYcXc0N3MxcEkvQUQ5S29wUlozWkF1?=
 =?utf-8?B?UnNwb3JpQmRiOHU4UmNhaGJteVZYOXp4R0FhN3RHTzNVa2VkeElXTktDUlFO?=
 =?utf-8?B?cDJ3QnBBTDhtV3JZUmJ0Skpablp6V2tGSU1EYWFOZjVTVkRtdTcyUWNrbHha?=
 =?utf-8?B?NHJ4Tng4Ym5qenhveGREalpNdjRhRnZhdHM0V0JxYURxdXd1ZDI0aGpnR2Fi?=
 =?utf-8?B?UXB6clVlYUVjSDFraEptLzBmZCticG9MR1lwVjhsTlEya3NtRlpSSzNBaFNY?=
 =?utf-8?B?Ulh1LzJhaVdBdURzMGt1QTlQWHRDZDhKV1V2TS96bm9LaXZIZXVNYlRvelMz?=
 =?utf-8?B?dnVwU2lOWGpvT1Uxdlp0SnFLaWg1a0tMcld4bG16K2IvZHN3MGJYbGkwaGh0?=
 =?utf-8?Q?0oik=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO6PR12MB5489.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5e3b7ac0-73a9-43e8-83df-08dc9b380eff
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Jul 2024 08:13:45.1563 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: eDQNi4VPmS0JWb4+o/oYVVMmTd/1y+7NDHc8sU3Md8u1iPbExmTQ/HBtnasanymV0aVtFDJx7khfIuH4wj3Ilw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB8205
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

W1B1YmxpY10NCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBMeXVkZSBQ
YXVsIDxseXVkZUByZWRoYXQuY29tPg0KPiBTZW50OiBTYXR1cmRheSwgSnVuZSAyOSwgMjAyNCAx
OjQwIEFNDQo+IFRvOiBMaW4sIFdheW5lIDxXYXluZS5MaW5AYW1kLmNvbT47IGFtZC1nZnhAbGlz
dHMuZnJlZWRlc2t0b3Aub3JnOyBkcmktDQo+IGRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZw0K
PiBDYzogamFuaS5uaWt1bGFAaW50ZWwuY29tOyBpbXJlLmRlYWtAaW50ZWwuY29tOyBkYW5pZWxA
ZmZ3bGwuY2g7IFdlbnRsYW5kLA0KPiBIYXJyeSA8SGFycnkuV2VudGxhbmRAYW1kLmNvbT47IFp1
bywgSmVycnkgPEplcnJ5Llp1b0BhbWQuY29tPjsNCj4gc3RhYmxlQHZnZXIua2VybmVsLm9yZw0K
PiBTdWJqZWN0OiBSZTogW1BBVENIIDIvM10gZHJtL2RwX21zdDogU2tpcCBDU04gaWYgdG9wb2xv
Z3kgcHJvYmluZyBpcyBub3QNCj4gZG9uZSB5ZXQNCj4NCj4gT24gVGh1LCAyMDI0LTA2LTI3IGF0
IDA5OjA0ICswMDAwLCBMaW4sIFdheW5lIHdyb3RlOg0KPiA+DQo+ID4gSSB1bmRlcnN0YW5kIHlv
dXIgY29uY2Vybi4gTXkgcGF0Y2ggd2lsbCBqdXN0IGNoZWNrIHdoZXRoZXIgbXN0DQo+ID4gbWFu
YWdlciBzdGFydHMgdGhlIHByb2JpbmcgcHJvY2VzcyBvciBub3QgYnkgY29uZmlybWluZyB3aGV0
aGVyIHdlDQo+ID4gc2VudCBMSU5LX0FERFJFU1MgdG8gdGhlIDFzdCBtc3QgYnJhbmNoIGFscmVh
ZHkuIEl0IHdpbGwgZHJvcCB0aGUgQ1NODQo+ID4gZXZlbnQgb25seSB3aGVuIHRoZSBldmVudCBj
b21lcyBlYXJsaWVyIHRoYW4gdGhlIHByb2JpbmcuIFRoZSBDU04NCj4gPiBldmVudHMgb2NjdXIg
ZHVyaW5nIHRvcG9sb2d5IHByb2Jpbmcgc2hvdWxkIHN0aWxsIGhhdmUgY2hhbmNlIHRvIGJlDQo+
ID4gaGFuZGxlZCBhZnRlciBwcm9iaW5nIHByb2Nlc3MgcmVsZWFzZSB0aGUNCj4gPiBtZ3ItPnBy
b2JlX2xvY2sNCj4gPiBJIHRoaW5rLiBEb2VzIHRoaXMgbWFrZSBzZW5zZSB0byB5b3UgcGxlYXNl
PyBUaGFua3MhDQo+DQo+IFllYWggLSB0aGF0IHNlZW1zIGxpa2UgdGhlIHBlcmZlY3Qgc29sdXRp
b24gOiksIHNvdW5kcyBnb29kIHRvIG1lDQoNClRoYW5rcywgTHl1ZGUhDQpDb3VsZCB5b3UgaGVs
cCB0byBtZXJnZSBkcm0gY2hhbmdlcyAtIHRoZSBbUEFUQ0ggMS8zXSBhbmQgdGhpcyBvbmUNCltQ
QVRDSCAyLzNdIHRoZW4gcGxlYXNlPyBUaGUgbGFzdCBvbmUgW1BBVENIIDMvM10sIGNoYW5nZXMg
aW4gYW1kIG9ubHksDQpJJ2xsIHBpbmcgYSBnYWluIGZvciByZXZpZXcuIEFwcHJlY2lhdGUgOiAp
DQoNCj4NCj4gPg0KPiA+ID4gPiAgICAgfSBlbHNlIGlmICh1cF9yZXEtPm1zZy5yZXFfdHlwZSA9
PQ0KPiA+ID4gPiBEUF9SRVNPVVJDRV9TVEFUVVNfTk9USUZZKSB7DQo+ID4gPiA+ICAgICAgICAg
ICAgIGNvbnN0IHN0cnVjdCBkcm1fZHBfcmVzb3VyY2Vfc3RhdHVzX25vdGlmeSAqcmVzX3N0YXQg
PQ0KPiA+ID4gPiAgICAgICAgICAgICAgICAgICAgICZ1cF9yZXEtPm1zZy51LnJlc291cmNlX3N0
YXQ7DQo+ID4gPg0KPiA+ID4gLS0NCj4gPiA+IENoZWVycywNCj4gPiA+ICBMeXVkZSBQYXVsIChz
aGUvaGVyKQ0KPiA+ID4gIFNvZnR3YXJlIEVuZ2luZWVyIGF0IFJlZCBIYXQNCj4gPg0KPiA+IC0t
DQo+ID4gUmVnYXJkcywNCj4gPiBXYXluZSBMaW4NCj4gPg0KPg0KPiAtLQ0KPiBDaGVlcnMsDQo+
ICBMeXVkZSBQYXVsIChzaGUvaGVyKQ0KPiAgU29mdHdhcmUgRW5naW5lZXIgYXQgUmVkIEhhdA0K
DQotLQ0KUmVnYXJkcywNCldheW5lIExpbg0K
