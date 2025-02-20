Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D5C5EA3E656
	for <lists+dri-devel@lfdr.de>; Thu, 20 Feb 2025 22:06:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F3C810E1C9;
	Thu, 20 Feb 2025 21:06:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="USuL0SA1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2056.outbound.protection.outlook.com [40.107.223.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F3DA710E1C9
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Feb 2025 21:06:24 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EeqhxufS2wGMSTDkwOX+dO0KuD62Is4IvlUfdjpGln0wAxWJdt/Q5otScyPpsKYnDwvy3X/fpM1jyC250nSv+AYZdKu9F042fRohE8D0FVC1BL4bsGw0HlQTSmjt6IGo2a3c7WiHnhpQJk1SUsKFy0N9Otk6Uxt6oIwDGJXlLkIer244u2s/44XD199vB0Iu6HS/T48Bsti0P772NihkshhDdWrYjTBE2NdYv2lV3k2/NZfMTR0oVvum110rjHH5w/Y94nUwcDEXjW0g9SLtmHcnFIPcldGjyCQRlKEAh8L5r+G39CDyE9TJPSmnZ7z2fengysAe1ota75NBLPk3BA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ikxoI+JbZojFwMSFxEj6pSckEApkxZC7y4nt4po/UuY=;
 b=PUmLsicMfb2jycujL1Rty3TyWToHcwFJMLB2CAOZN4eQxl+QbWo4GIW2bHYjrHuyHN8mD5UnlpPUKAU3F/8l+X5imoPg5UeZvYUfHnSsYXcD0pCDIZykphJnMh4ZNN6SUszuf3v5guLJJf67Ooa/s+F8SwSYblemg9Xz4HQQXgWJSDCSFTqw/riskb1E1iaezV6fibMAOlJInOYGejWpSy8MxVbHdPnWiEB8TwY8faLAly2a8uFZDbcGdCrl+NMqadTzuHr9vvx6PMqPr3GpKZB/nEod16GvLtgsSv3rZ6q9IB1FnGg/M6T8cXNkVxxn3IMMb/+xHkSPaKUqkhSaeg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ikxoI+JbZojFwMSFxEj6pSckEApkxZC7y4nt4po/UuY=;
 b=USuL0SA1z4yAMhAM6mQKz7xQ7kFp1oxiK4SfXAZBSPfnc4hoHpeLCAJTFhVrlKh4CTlulhOzl00ADveeH43m36rxekES4Pd4BGx6VKVF26+P37eDDRBZHdikxNtVe+C27Tyd+fA7LbiZ7+8DVTI12AMD6oMWWA2He3yOVAJ1wwo=
Received: from MW5PR12MB5649.namprd12.prod.outlook.com (2603:10b6:303:19d::13)
 by SJ2PR12MB7824.namprd12.prod.outlook.com (2603:10b6:a03:4c4::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8445.19; Thu, 20 Feb
 2025 21:06:21 +0000
Received: from MW5PR12MB5649.namprd12.prod.outlook.com
 ([fe80::c064:a156:f7fd:f722]) by MW5PR12MB5649.namprd12.prod.outlook.com
 ([fe80::c064:a156:f7fd:f722%6]) with mapi id 15.20.8466.015; Thu, 20 Feb 2025
 21:06:21 +0000
From: "Hou, Lizhi" <lizhi.hou@amd.com>
To: Dave Airlie <airlied@gmail.com>, dri-devel
 <dri-devel@lists.freedesktop.org>, Jacek Lawrynowicz
 <jacek.lawrynowicz@linux.intel.com>, Stanislaw Gruszka
 <stanislaw.gruszka@linux.intel.com>, "Ma, Min" <min.ma@amd.com>
CC: "Santan, Sonal" <sonal.santan@amd.com>, "Zhen, Max" <Max.Zhen@amd.com>
Subject: Re: firmware requirements
Thread-Topic: firmware requirements
Thread-Index: AQHbgxGKBCG2PEtuDkGUIbw41NBBMrNQr66E
Date: Thu, 20 Feb 2025 21:06:21 +0000
Message-ID: <MW5PR12MB5649979341A7FDC5900988DEFFC42@MW5PR12MB5649.namprd12.prod.outlook.com>
References: <CAPM=9tw_a+3qLjUn0=SqjVL=N6ExRbw0u9TamwGwigWwDwc23Q@mail.gmail.com>
In-Reply-To: <CAPM=9tw_a+3qLjUn0=SqjVL=N6ExRbw0u9TamwGwigWwDwc23Q@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Enabled=True;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_SetDate=2025-02-20T21:03:37.0834269Z;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_ContentBits=0;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Method=Standard
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MW5PR12MB5649:EE_|SJ2PR12MB7824:EE_
x-ms-office365-filtering-correlation-id: 199b7417-deab-4821-487e-08dd51f26d2f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|13003099007|38070700018|7053199007|8096899003;
x-microsoft-antispam-message-info: =?utf-8?B?QU4rdExEcjVUOXBvMGZiTFVaNnJjaEJwSmFtcUpZeHZsYy82SkxLT3BkdGh3?=
 =?utf-8?B?c0RJS1VtbFI4NnpDVkhnUktOM2kvVm5rNmdqUDEyaStNK3hCTjBMMHlnTDRW?=
 =?utf-8?B?NmN5OG9YMUxQcVVWZ0ttMmZiSG52bU9TeTNxM3gxYmlPNEhjTzFwK0NtdFFa?=
 =?utf-8?B?WlV2Vy9QRkdEdFNDZXY5SkJ0S0ZIUDdjOXJTVHRHZWF6c05zdnQ1UUFjTXlK?=
 =?utf-8?B?bzlmWHhMZjB0Wno3MEJKVmhNTVF4eUI3OXl0cGhVWVQvd0lDNGxCY1hQSWkw?=
 =?utf-8?B?dHNLQ0tDbWVPb3JXQ2dMb01nOXkzZmZ3ZVp2TzArcnZoYnNTUXhndWZQV3lt?=
 =?utf-8?B?RDlRaEZKb2hYd1dscVFLdlNqSk53M2RGN094N2xLcTR3bGpYQ2hlK0l6TFpR?=
 =?utf-8?B?VkFDNTZoNmNBaSs1anp4a3lqNkpKSHFtaHVOUm9vVDVRS3lYaDdBSEpCQld6?=
 =?utf-8?B?N0lsZDB6RmVWTlNmZXovNVRUSDZwRjV4OFQvcEZoMVdPTG9VWjRQS29VakpN?=
 =?utf-8?B?K3lCcno4K1grQm02ZlV5QXdUVmx2R08yZEdJNDNsMGs5QTJ4VDludEhRY2di?=
 =?utf-8?B?VVFSMFVtbTVva0lZQ3dwRlY4Y2plT2hKZHhMaDdnTzEwdGtuMldDaTIwcHA3?=
 =?utf-8?B?WVV5WDdaQi9mY2p2ZEU2cmU3TklqRTJrZWRodTV5YUhiZ2l6ODZyMGlsVW40?=
 =?utf-8?B?SS9FK0dwUkM4MmZoVHhIZEc3NzczekRRVnk2ZEdRMjh1NWFjam1tbkZDZTVX?=
 =?utf-8?B?alQ2dXdaRG9RM2dFWFdDNEtVRlBnMHRKVGNWZE80TXNyNW1rK1FQYVM1VTRa?=
 =?utf-8?B?YkwrQTdsME05V3pHcnV4RjMrMFUrcm1YN28vNWxuZ3ZoeGlMWFh2bWUzQkRl?=
 =?utf-8?B?cWt6ZHpkYmtXc3NsSEc0d2VnRUdSSC9CL01lZnExb2JYN3A5MlJqNVhmSFVr?=
 =?utf-8?B?djEyTnA4Zk1OMEtxbjFzMDRPNnU5Vkt3Qm81V0VzSjZCalVQaTdTYnE1bVcr?=
 =?utf-8?B?MmZMRklMaHR5S2FNQVpmb2VaaUpkYWxPaC9EMWJlTmpuZzRZS0NKaXRzcWJo?=
 =?utf-8?B?RG8zTGJWdE9ESkNDS2VmcnBNMEFvSHZITVF4WEdQQ3dkYk9WbG1CeXBHb0E1?=
 =?utf-8?B?WFVEOE9SMklkZWRQQWJkRmFuOEdsSkhFQkljZktkMXVMWURDM3lOR3ZXd3hx?=
 =?utf-8?B?WE1tWjZPUTFpTmZXQTBlb1ZiRTBic3BlWkdkSzZxbUttdVJMUVhyeTk3Z09t?=
 =?utf-8?B?em5yL05vVDVCT3NkbmF5b2xXNHR0YjZjVnUrRXh2cTM1UkNZcUxibVQ3b3Zr?=
 =?utf-8?B?b29OekFFQ3FTRkdxc2YxREc0aWVveXV0TlJ0TDIxL0VrQlFQVmJwbjhWQ1Fl?=
 =?utf-8?B?V3R2a1VRaXhoejY4ZmhNZ3hHdzg5VHFEaGZRL0t6UWJIU3Y0dGYzTHZLa3My?=
 =?utf-8?B?aTB2WTYyQ010STVRQXoxeVREbjFaVW5xRTRXWHNJVzlTcFhoMUlVVTNMSnpQ?=
 =?utf-8?B?cGxIb0hHSTRSSUd4MzQ2WU9HQS9lMWxOaW8zdTQxOHJVVDMxV1NKNGFVU0Nj?=
 =?utf-8?B?aEhXd25OUWlsSnkwMGVXL3EzWjdITituQUo2ZVZQSTZaWnF3VXVCT2xpbWJo?=
 =?utf-8?B?RlhxWk10NHZsM1orNUhZZG1mUjhUeVhzcjY1YU9iMjN5TjVKRFVHRHV2cTBi?=
 =?utf-8?B?QjhoSkNzWklVUHlwVWZHTXAxZjlUc0VPWWVsVUdHbStqaE05cGp0bVNHMUxD?=
 =?utf-8?B?d2JBZUF6WkN1MHYxN0R4Wnl1NkI0eE85cEtsUTd6VnU2bDExVlE0bkRyRlpM?=
 =?utf-8?B?Zi9ibC9waVNqZGJ5QngwZWVBbVJBNkkvbkszY0VNb2tlejNFd0R0dXdsYmZn?=
 =?utf-8?B?eTUvS2NpRG9yUUxCMW1sNVd6TjNuaHhhQUF1WnlocGx1OFNiMElhdzhMeEx2?=
 =?utf-8?Q?6+Ew/2KJTxA/y1OeHDwtn0nEOXEa8fiG?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW5PR12MB5649.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(13003099007)(38070700018)(7053199007)(8096899003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?VXA0K05QdHhueHVmY051UmpTQnpoU2p2aTR4VVFnTnRLRHA5c3VnLzNvZklh?=
 =?utf-8?B?SEtLSE45TEVNTnhNcWRmSGlFMzIzWW9XQStkSDYwTHl2ODFuSDhzZWQ0VUlK?=
 =?utf-8?B?OWZIaW5aa29BcnV6UVh1bllidFo2eDVlN1RVTTViMDBiVlRBdTJ4dXhrY1k5?=
 =?utf-8?B?bEEwakd1RWoxeEtQeTRoOGFJWE5aTStQTjA4ekRmUlFRNjRiU3ZvTWM0RDJq?=
 =?utf-8?B?Skp2dWs5TDROcldJL2JTSlI1YlI5N1VEdjY5Z0dVTXcydGo0RnFld2MwL0F5?=
 =?utf-8?B?dG5HS01Mb0FmRk5sTHFpMXFZbHFGYlhIT05oSjY4elByWmxqdW5WeWplZG5R?=
 =?utf-8?B?U2RkemhEeGRuVGk4NmFwb2l5U3BIOFE3aklOeHdOUVJkREg2VFVzbTlBS1hl?=
 =?utf-8?B?dmJyc1J3ZDNFSWwzRGM3bFIrUXdWR1VJVTlpL3JWTjJqQVFXdWhXVkNyeFlC?=
 =?utf-8?B?a3p1TWd5VmUrQmNOWFBlczdHdW1uOVJwQmt2cTllSDJ6dUVyeUt3eXp5eGFq?=
 =?utf-8?B?cU81Unh6S2djbG12K1pIQTBmODlaa09pQU1qTHk2R3BlWXd5dGZweXBJRUtn?=
 =?utf-8?B?VHRiVE43djNuSG1LTklwaVNUNmp4SUVuT3FLNVJ4THh6ak9PSDNhT1RaSWdo?=
 =?utf-8?B?eU0wOWpZdlpUcC9JVDlaNkdJZlVMcjV1dTR6MEMwamoybmN4cncvOFB1bUEv?=
 =?utf-8?B?VmczVWN5YzFnanIrelFWcG14bFFwOXZoTE5sMlVrcEJjTXZuSW1Mc2IvWkRl?=
 =?utf-8?B?SnlVVVVVZ2E3cHQ0K3dibVBaOGtQOG53WXhpMGMzektXQzFWOFlkNTNaZWhs?=
 =?utf-8?B?UTdEcjFwa0t3dldwZXU0bXhEckxvVkFjZ2c4Nk5LYVVZNzVqWGFaRGVSMWpB?=
 =?utf-8?B?c1BNOUF1cm9zMHVYWXNnUGpFUWJtNC83SS85L2Q5eEwyWnBycHBPZVlNdzlK?=
 =?utf-8?B?bHdyV3dPa1VoMHZqNFV5TysvejZuM1Z3TmkwaERrbFhaeGMzSlZQeFhKZS9D?=
 =?utf-8?B?aGNzQXRFVTZtWmRQdVJWTFlKWncwQmdOM2dZWmF6eGU5RjI2aStFMnFhL1Ra?=
 =?utf-8?B?VzV1azFRU3F0ZHhxcnVUTjNhczZEdEhYanJSVGZlZmdEVENYKzlZOU95OGpj?=
 =?utf-8?B?WHVqcjRkLytXV0lrQmlHY1hJa3FXMXM4T1lPcnNYU2hUcGU4ZUtxZVBKc2pJ?=
 =?utf-8?B?SGhLMVpKM3Z0NmVpcEswTHRiYlVFR0tPcmFhODJrMVhSZE11Y0dPYUM5WnYx?=
 =?utf-8?B?UzlXRGVMbXBDTjRtUjNOVm92d2ZKWTBVWENkdjZHUGtuelU1ajQyVlBnaVYx?=
 =?utf-8?B?V2xYWG5ucUlkc3QvbzhZNmM2YXhJS09SemtDMGxGVzVCVnJXWDdMZUpFQk1W?=
 =?utf-8?B?Q0ovdStQYVBuczFlY0tYUnhncTVVZWlLNjRSZnFyNXNVM2tkMEJNYitpNnlD?=
 =?utf-8?B?ckZjWElPYTJXcVNXaTdEUmJ1azZKSkp5K0dhMTFFUzNROXphWkxWM3NROEdp?=
 =?utf-8?B?YVk3UXR1Ukp2SEZwQ0phRTRmbG1BZTl5TlJBT0xKdFdXNTh6SERTbzByY0pY?=
 =?utf-8?B?WlBFY3VaSUdZVDAzZXRUZFJuK3pidWpOSFJ5YVMrNDNKOXpwUjV1NE03SFBw?=
 =?utf-8?B?UExxTUlBLy9QRnZpOTVaNzdJMCtXdVNrZ2hyUG0vVFUrNTJNeXFtMEFjOC9K?=
 =?utf-8?B?aHdGTzVwdjlQTWJVZGQ4ZTc0R0FLYTA4cUg3WFpnNEJWT2YzWm9EQ2NPaXRJ?=
 =?utf-8?B?R29Xd1c3QzJVNTlDNnBUQ2srSENVcTVPbjdDWGhoTCs4QWtCQTE4dUZtb21G?=
 =?utf-8?B?M2RTVTVNWlV5RnNWTVVJV3krR0hyK1NkNnNyV0ErTFRhZy9xOXN4MkhFcC9o?=
 =?utf-8?B?bnphNEJma25EUWlpVmwycFJPYUYzKzIzUjdsR3gwWitSWU1IbzQyWFE3RVVG?=
 =?utf-8?B?bkxUTUI1eEtOVkNYODAvY3NLQXNLa2Z0aVBkajVVdUJBSWZrN0h3MnR0Tmx3?=
 =?utf-8?B?aEhVSEMxMFNoVVZmUkFSV2hDcHJ0bVVHcGttMXlRTmZpZHYyNzBSMHlzWGNT?=
 =?utf-8?B?UHhkVHZWK0RKTVRuK25vN0dKdGNnYXlpSXd3K0JzRDJuU21nMTZsMHF5TG01?=
 =?utf-8?Q?86VuuN++Tt/4jkmKbEQue0iZ9?=
Content-Type: multipart/alternative;
 boundary="_000_MW5PR12MB5649979341A7FDC5900988DEFFC42MW5PR12MB5649namp_"
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MW5PR12MB5649.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 199b7417-deab-4821-487e-08dd51f26d2f
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Feb 2025 21:06:21.1661 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: TQlfgHZRjBWVD6gnekV3vxjX9G3nZKOv6fRZ0bGScRl0zMVnoRmTRuMeI9cOXr8c
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB7824
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

--_000_MW5PR12MB5649979341A7FDC5900988DEFFC42MW5PR12MB5649namp_
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

W0FNRCBPZmZpY2lhbCBVc2UgT25seSAtIEFNRCBJbnRlcm5hbCBEaXN0cmlidXRpb24gT25seV0N
Cg0KSGkgRGF2ZSwNCg0KVGhlIEFNRCBYRE5BIGRyaXZlciB3aWxsIGZvbGxvdyB0aGUgZ3VpZGVs
aW5lIHJlcXVpcmVtZW50cy4NCg0KVGhhbmtzLA0KTGl6aGkNCg0KRnJvbTogRGF2ZSBBaXJsaWUg
PGFpcmxpZWRAZ21haWwuY29tPg0KRGF0ZTogV2VkbmVzZGF5LCBGZWJydWFyeSAxOSwgMjAyNSBh
dCAxOjAy4oCvUE0NClRvOiBkcmktZGV2ZWwgPGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5v
cmc+LCBKYWNlayBMYXdyeW5vd2ljeiA8amFjZWsubGF3cnlub3dpY3pAbGludXguaW50ZWwuY29t
PiwgU3RhbmlzbGF3IEdydXN6a2EgPHN0YW5pc2xhdy5ncnVzemthQGxpbnV4LmludGVsLmNvbT4s
IE1hLCBNaW4gPG1pbi5tYUBhbWQuY29tPiwgSG91LCBMaXpoaSA8bGl6aGkuaG91QGFtZC5jb20+
DQpTdWJqZWN0OiBmaXJtd2FyZSByZXF1aXJlbWVudHMNCkknZCBqdXN0IGxpa2UgdG8gcmVtaW5k
IGV2ZXJ5b25lIG9mIHRoZSBmaXJtd2FyZSByZXF1aXJlbWVudHMgZm9yDQp2ZW5kb3JzIHRoYXQg
Y29udHJvbCB0aGVpciBmaXJtd2FyZSBhbmQgdGhlIGRyaXZlciB1cHN0cmVhbXM6DQoNCmh0dHBz
Oi8vZG9jcy5rZXJuZWwub3JnL2RyaXZlci1hcGkvZmlybXdhcmUvZmlybXdhcmUtdXNhZ2UtZ3Vp
ZGVsaW5lcy5odG1sDQoNCkludGVsIFZQVSBpdCBzZWVtcyBsaWtlIHlvdSBhcmUgbm90IGN1cnJl
bnRseSBzaGlwcGluZyB1cHN0cmVhbQ0KZmlybXdhcmUsIGFuZCBtaWdodCBoYXZlIHRpZWQgeW91
ciBmdyBhbmQgdXNlcnNwYWNlIHRvZ2V0aGVyLg0KDQpJJ20gY2MnaW5nIHRoZSBBTUQgWEROQSBk
cml2ZXIgYXMgaXQgcmVjZW50bHkgbGFuZGVkIGFuZCBJJ2QgbGlrZSB0aGVtDQp0byBjb25maXJt
IHRoZXkgYXJlIGZvbGxvd2luZyB0aGUgYWJvdmUgcmVxdWlyZW1lbnRzLg0KDQpUaGUgbWFpbiBy
ZWFzb24gd2UgZG9uJ3QgYWxsb3cgdXNlcnNwYWNlL2Z3IGRpcmVjdCBsaW5rYWdlIGlzIGlmIGEN
CnVzZXIgZGVwbG95cyB0d28gY29udGFpbmVycyB3aXRoIHR3byBkaWZmZXJlbnQgdXNlcnNwYWNl
IGRyaXZlcnMgaW4NCnRoZW0gb24gdGhlIHNhbWUgaGFyZHdhcmUsIHdoYXQgaXMgdGhlIGtlcm5l
bCBkcml2ZXIgc3VwcG9zZWQgdG8gZG8/DQoNCkZpcm13YXJlIHNob3VsZCBiZSBhYnN0cmFjdGVk
IGluIHRoZSBrZXJuZWwgaWYgaXQgaXMgbm90IHBvc3NpYmxlIHRvDQpidWlsZCBwcm9wZXIgZncg
QVBJcyBmb3IgdXNlcnNwYWNlIHRvIHVzZSBkaXJlY3RseSwgYnkgcHJvcGVyIEkgbWVhbg0KZm9y
d2FyZCBhbmQgYmFja3dhcmRzIGNvbXBhdGlibGUuDQoNClRoYW5rcywNCkRhdmUuDQo=

--_000_MW5PR12MB5649979341A7FDC5900988DEFFC42MW5PR12MB5649namp_
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: base64

PGh0bWwgeG1sbnM6bz0idXJuOnNjaGVtYXMtbWljcm9zb2Z0LWNvbTpvZmZpY2U6b2ZmaWNlIiB4
bWxuczp3PSJ1cm46c2NoZW1hcy1taWNyb3NvZnQtY29tOm9mZmljZTp3b3JkIiB4bWxuczptPSJo
dHRwOi8vc2NoZW1hcy5taWNyb3NvZnQuY29tL29mZmljZS8yMDA0LzEyL29tbWwiIHhtbG5zPSJo
dHRwOi8vd3d3LnczLm9yZy9UUi9SRUMtaHRtbDQwIj4NCjxoZWFkPg0KPG1ldGEgaHR0cC1lcXVp
dj0iQ29udGVudC1UeXBlIiBjb250ZW50PSJ0ZXh0L2h0bWw7IGNoYXJzZXQ9dXRmLTgiPg0KPG1l
dGEgbmFtZT0iR2VuZXJhdG9yIiBjb250ZW50PSJNaWNyb3NvZnQgV29yZCAxNSAoZmlsdGVyZWQg
bWVkaXVtKSI+DQo8c3R5bGU+PCEtLQ0KLyogRm9udCBEZWZpbml0aW9ucyAqLw0KQGZvbnQtZmFj
ZQ0KCXtmb250LWZhbWlseToiQ2FtYnJpYSBNYXRoIjsNCglwYW5vc2UtMToyIDQgNSAzIDUgNCA2
IDMgMiA0O30NCkBmb250LWZhY2UNCgl7Zm9udC1mYW1pbHk6RGVuZ1hpYW47DQoJcGFub3NlLTE6
MiAxIDYgMCAzIDEgMSAxIDEgMTt9DQpAZm9udC1mYWNlDQoJe2ZvbnQtZmFtaWx5OkNhbGlicmk7
DQoJcGFub3NlLTE6MiAxNSA1IDIgMiAyIDQgMyAyIDQ7fQ0KQGZvbnQtZmFjZQ0KCXtmb250LWZh
bWlseToiXEBEZW5nWGlhbiI7DQoJcGFub3NlLTE6MiAxIDYgMCAzIDEgMSAxIDEgMTt9DQovKiBT
dHlsZSBEZWZpbml0aW9ucyAqLw0KcC5Nc29Ob3JtYWwsIGxpLk1zb05vcm1hbCwgZGl2Lk1zb05v
cm1hbA0KCXttYXJnaW46MGluOw0KCWZvbnQtc2l6ZToxMC4wcHQ7DQoJZm9udC1mYW1pbHk6IkNh
bGlicmkiLHNhbnMtc2VyaWY7fQ0KYTpsaW5rLCBzcGFuLk1zb0h5cGVybGluaw0KCXttc28tc3R5
bGUtcHJpb3JpdHk6OTk7DQoJY29sb3I6Ymx1ZTsNCgl0ZXh0LWRlY29yYXRpb246dW5kZXJsaW5l
O30NCnNwYW4uRW1haWxTdHlsZTE5DQoJe21zby1zdHlsZS10eXBlOnBlcnNvbmFsLXJlcGx5Ow0K
CWZvbnQtZmFtaWx5OiJDYWxpYnJpIixzYW5zLXNlcmlmOw0KCWNvbG9yOndpbmRvd3RleHQ7fQ0K
Lk1zb0NocERlZmF1bHQNCgl7bXNvLXN0eWxlLXR5cGU6ZXhwb3J0LW9ubHk7DQoJZm9udC1zaXpl
OjEwLjBwdDsNCgltc28tbGlnYXR1cmVzOm5vbmU7fQ0KQHBhZ2UgV29yZFNlY3Rpb24xDQoJe3Np
emU6OC41aW4gMTEuMGluOw0KCW1hcmdpbjoxLjBpbiAxLjBpbiAxLjBpbiAxLjBpbjt9DQpkaXYu
V29yZFNlY3Rpb24xDQoJe3BhZ2U6V29yZFNlY3Rpb24xO30NCi0tPjwvc3R5bGU+DQo8L2hlYWQ+
DQo8Ym9keSBsYW5nPSJFTi1VUyIgbGluaz0iYmx1ZSIgdmxpbms9InB1cnBsZSIgc3R5bGU9Indv
cmQtd3JhcDpicmVhay13b3JkIj4NCjxwIHN0eWxlPSJmb250LWZhbWlseTpDYWxpYnJpO2ZvbnQt
c2l6ZToxMHB0O2NvbG9yOiMwMDAwRkY7bWFyZ2luOjVwdDtmb250LXN0eWxlOm5vcm1hbDtmb250
LXdlaWdodDpub3JtYWw7dGV4dC1kZWNvcmF0aW9uOm5vbmU7IiBhbGlnbj0iTGVmdCI+DQpbQU1E
IE9mZmljaWFsIFVzZSBPbmx5IC0gQU1EIEludGVybmFsIERpc3RyaWJ1dGlvbiBPbmx5XTxicj4N
CjwvcD4NCjxicj4NCjxkaXY+DQo8ZGl2IGNsYXNzPSJXb3JkU2VjdGlvbjEiPg0KPHAgY2xhc3M9
Ik1zb05vcm1hbCI+PHNwYW4gc3R5bGU9ImZvbnQtc2l6ZToxMS4wcHQiPkhpIERhdmUsPG86cD48
L286cD48L3NwYW4+PC9wPg0KPHAgY2xhc3M9Ik1zb05vcm1hbCI+PHNwYW4gc3R5bGU9ImZvbnQt
c2l6ZToxMS4wcHQiPjxvOnA+Jm5ic3A7PC9vOnA+PC9zcGFuPjwvcD4NCjxwIGNsYXNzPSJNc29O
b3JtYWwiPjxzcGFuIHN0eWxlPSJmb250LXNpemU6MTEuMHB0Ij5UaGUgQU1EIFhETkEgZHJpdmVy
IHdpbGwgZm9sbG93IHRoZSBndWlkZWxpbmUgcmVxdWlyZW1lbnRzLjxvOnA+PC9vOnA+PC9zcGFu
PjwvcD4NCjxwIGNsYXNzPSJNc29Ob3JtYWwiPjxzcGFuIHN0eWxlPSJmb250LXNpemU6MTEuMHB0
Ij48bzpwPiZuYnNwOzwvbzpwPjwvc3Bhbj48L3A+DQo8cCBjbGFzcz0iTXNvTm9ybWFsIj48c3Bh
biBzdHlsZT0iZm9udC1zaXplOjExLjBwdCI+VGhhbmtzLDxvOnA+PC9vOnA+PC9zcGFuPjwvcD4N
CjxwIGNsYXNzPSJNc29Ob3JtYWwiPjxzcGFuIHN0eWxlPSJmb250LXNpemU6MTEuMHB0Ij5MaXpo
aTxvOnA+PC9vOnA+PC9zcGFuPjwvcD4NCjxwIGNsYXNzPSJNc29Ob3JtYWwiPjxzcGFuIHN0eWxl
PSJmb250LXNpemU6MTEuMHB0Ij48bzpwPiZuYnNwOzwvbzpwPjwvc3Bhbj48L3A+DQo8ZGl2IHN0
eWxlPSJib3JkZXI6bm9uZTtib3JkZXItdG9wOnNvbGlkICNCNUM0REYgMS4wcHQ7cGFkZGluZzoz
LjBwdCAwaW4gMGluIDBpbiI+DQo8cCBjbGFzcz0iTXNvTm9ybWFsIiBzdHlsZT0ibWFyZ2luLWJv
dHRvbToxMi4wcHQiPjxiPjxzcGFuIHN0eWxlPSJmb250LXNpemU6MTIuMHB0O2NvbG9yOmJsYWNr
Ij5Gcm9tOg0KPC9zcGFuPjwvYj48c3BhbiBzdHlsZT0iZm9udC1zaXplOjEyLjBwdDtjb2xvcjpi
bGFjayI+RGF2ZSBBaXJsaWUgJmx0O2FpcmxpZWRAZ21haWwuY29tJmd0Ozxicj4NCjxiPkRhdGU6
IDwvYj5XZWRuZXNkYXksIEZlYnJ1YXJ5IDE5LCAyMDI1IGF0IDE6MDLigK9QTTxicj4NCjxiPlRv
OiA8L2I+ZHJpLWRldmVsICZsdDtkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnJmd0Oywg
SmFjZWsgTGF3cnlub3dpY3ogJmx0O2phY2VrLmxhd3J5bm93aWN6QGxpbnV4LmludGVsLmNvbSZn
dDssIFN0YW5pc2xhdyBHcnVzemthICZsdDtzdGFuaXNsYXcuZ3J1c3prYUBsaW51eC5pbnRlbC5j
b20mZ3Q7LCBNYSwgTWluICZsdDttaW4ubWFAYW1kLmNvbSZndDssIEhvdSwgTGl6aGkgJmx0O2xp
emhpLmhvdUBhbWQuY29tJmd0Ozxicj4NCjxiPlN1YmplY3Q6IDwvYj5maXJtd2FyZSByZXF1aXJl
bWVudHM8bzpwPjwvbzpwPjwvc3Bhbj48L3A+DQo8L2Rpdj4NCjxkaXY+DQo8cCBjbGFzcz0iTXNv
Tm9ybWFsIj48c3BhbiBzdHlsZT0iZm9udC1zaXplOjExLjBwdCI+SSdkIGp1c3QgbGlrZSB0byBy
ZW1pbmQgZXZlcnlvbmUgb2YgdGhlIGZpcm13YXJlIHJlcXVpcmVtZW50cyBmb3I8YnI+DQp2ZW5k
b3JzIHRoYXQgY29udHJvbCB0aGVpciBmaXJtd2FyZSBhbmQgdGhlIGRyaXZlciB1cHN0cmVhbXM6
PGJyPg0KPGJyPg0KPGEgaHJlZj0iaHR0cHM6Ly9kb2NzLmtlcm5lbC5vcmcvZHJpdmVyLWFwaS9m
aXJtd2FyZS9maXJtd2FyZS11c2FnZS1ndWlkZWxpbmVzLmh0bWwiPmh0dHBzOi8vZG9jcy5rZXJu
ZWwub3JnL2RyaXZlci1hcGkvZmlybXdhcmUvZmlybXdhcmUtdXNhZ2UtZ3VpZGVsaW5lcy5odG1s
PC9hPjxicj4NCjxicj4NCkludGVsIFZQVSBpdCBzZWVtcyBsaWtlIHlvdSBhcmUgbm90IGN1cnJl
bnRseSBzaGlwcGluZyB1cHN0cmVhbTxicj4NCmZpcm13YXJlLCBhbmQgbWlnaHQgaGF2ZSB0aWVk
IHlvdXIgZncgYW5kIHVzZXJzcGFjZSB0b2dldGhlci48YnI+DQo8YnI+DQpJJ20gY2MnaW5nIHRo
ZSBBTUQgWEROQSBkcml2ZXIgYXMgaXQgcmVjZW50bHkgbGFuZGVkIGFuZCBJJ2QgbGlrZSB0aGVt
PGJyPg0KdG8gY29uZmlybSB0aGV5IGFyZSBmb2xsb3dpbmcgdGhlIGFib3ZlIHJlcXVpcmVtZW50
cy48YnI+DQo8YnI+DQpUaGUgbWFpbiByZWFzb24gd2UgZG9uJ3QgYWxsb3cgdXNlcnNwYWNlL2Z3
IGRpcmVjdCBsaW5rYWdlIGlzIGlmIGE8YnI+DQp1c2VyIGRlcGxveXMgdHdvIGNvbnRhaW5lcnMg
d2l0aCB0d28gZGlmZmVyZW50IHVzZXJzcGFjZSBkcml2ZXJzIGluPGJyPg0KdGhlbSBvbiB0aGUg
c2FtZSBoYXJkd2FyZSwgd2hhdCBpcyB0aGUga2VybmVsIGRyaXZlciBzdXBwb3NlZCB0byBkbz88
YnI+DQo8YnI+DQpGaXJtd2FyZSBzaG91bGQgYmUgYWJzdHJhY3RlZCBpbiB0aGUga2VybmVsIGlm
IGl0IGlzIG5vdCBwb3NzaWJsZSB0bzxicj4NCmJ1aWxkIHByb3BlciBmdyBBUElzIGZvciB1c2Vy
c3BhY2UgdG8gdXNlIGRpcmVjdGx5LCBieSBwcm9wZXIgSSBtZWFuPGJyPg0KZm9yd2FyZCBhbmQg
YmFja3dhcmRzIGNvbXBhdGlibGUuPGJyPg0KPGJyPg0KVGhhbmtzLDxicj4NCkRhdmUuPG86cD48
L286cD48L3NwYW4+PC9wPg0KPC9kaXY+DQo8L2Rpdj4NCjwvZGl2Pg0KPC9ib2R5Pg0KPC9odG1s
Pg0K

--_000_MW5PR12MB5649979341A7FDC5900988DEFFC42MW5PR12MB5649namp_--
