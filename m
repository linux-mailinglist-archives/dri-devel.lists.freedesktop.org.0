Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7146DAE4DB9
	for <lists+dri-devel@lfdr.de>; Mon, 23 Jun 2025 21:42:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DDC5910E445;
	Mon, 23 Jun 2025 19:42:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="CZG4BOnm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2055.outbound.protection.outlook.com [40.107.94.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B03A310E445;
 Mon, 23 Jun 2025 19:42:41 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=asLSg2Fj/lpETmb1sDwbNgy7DF6wG79gdkA7Ph7PGEWlKBt98FgdY8mTgC6PdlAGu2ogqU25Gaw7VSYXwtKkDY3dsG63oesKK9U2Dvqp2o51cODCQgpNbfmRr84gb0QCnoyei6dAJ4J65UmAxkolAZ89sywqR8mprPjKu/wlCOlrquv2e1gg4q/pj3Vm9ZJBjWQ5/fuqdQ/+OvtIVXwcGQ51bkcPIbBYuborXKX1WwY+oU2PSQYSqwNW0pUPtyBmAcLK4okHf4lzrH2WHYVKmuK3bnIfUT/9bINvgZQpE/K31nziBzowv6KdktGqQk482qrKpXQoxnYoF3rgZvxyDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xOkmCIGm7CzS6NjACeuJJrLeicF9fxtLFMdtxOdII10=;
 b=Rn40ysRVNtQKPMb/+wx7w6u2mpon9+n/LWPje1WqmutSXbfHcgJsIJy4rg2i5l75R/EE6U2XgmJaRD18vFowpVFW+6qOsXLe/CGXJY4jCVn7XtkS4zPBOvQl+CA03kMY2eKWqQy73N4L9dG+6CScbR+404k3mPwY4EfsB4PJij9ujolQlGD8nAg3/zx96QcJ6F6PQBgiA4JeChYms9YcHIzIkDE7sO1r6R2fiAkll1rV3vgi49v6lw/iTcoE/jGlDemaYFCgHC9UAnnJniqLpNqfDqzKLGbLNqftNC/CTPkbR53R5lBhFerEQ0fZNUOOR0Am10l6ed3kgZhLNc4MYA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xOkmCIGm7CzS6NjACeuJJrLeicF9fxtLFMdtxOdII10=;
 b=CZG4BOnmg6CHHPsvBDFWQ2kVXX1CzmFJcONUlQvt2+CMe/O0+3Ebz1tUyn/kDlaw+iv+Mt8AHfXSGoojfjC92DiJnkWIga3ovWGP7grApHeZgIPFmhv9B/qe6tXzdQ8b+EVO2hOVo2Ncuc4KOI7wcVJIFFEcrYFsjbuePyhfj7E=
Received: from MN0PR12MB6101.namprd12.prod.outlook.com (2603:10b6:208:3cb::10)
 by PH7PR12MB6538.namprd12.prod.outlook.com (2603:10b6:510:1f1::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.22; Mon, 23 Jun
 2025 19:42:32 +0000
Received: from MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::37ee:a763:6d04:81ca]) by MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::37ee:a763:6d04:81ca%7]) with mapi id 15.20.8857.026; Mon, 23 Jun 2025
 19:42:32 +0000
From: "Limonciello, Mario" <Mario.Limonciello@amd.com>
To: Rodrigo Siqueira <siqueira@igalia.com>, Werner Sembach
 <wse@tuxedocomputers.com>
CC: "Wentland, Harry" <Harry.Wentland@amd.com>, "Li, Sun peng (Leo)"
 <Sunpeng.Li@amd.com>, "Deucher, Alexander" <Alexander.Deucher@amd.com>,
 "Koenig, Christian" <Christian.Koenig@amd.com>, "airlied@gmail.com"
 <airlied@gmail.com>, "simona@ffwll.ch" <simona@ffwll.ch>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "Hung, Alex"
 <Alex.Hung@amd.com>, "Wheeler, Daniel" <Daniel.Wheeler@amd.com>
Subject: Re: [PATCH 1/1] drm/amd/display: Add quirk to force backlight type on
 some TUXEDO devices
Thread-Topic: [PATCH 1/1] drm/amd/display: Add quirk to force backlight type
 on some TUXEDO devices
Thread-Index: AQHb5HL5Z9IsMEQZxkCnf62661NCV7QRJQSA
Date: Mon, 23 Jun 2025 19:42:31 +0000
Message-ID: <8c048899-e307-4229-8165-fa70d001176e@amd.com>
References: <20250409163029.130651-1-wse@tuxedocomputers.com>
 <20250409163029.130651-2-wse@tuxedocomputers.com>
 <08ceaa42-a12c-4bd4-bb75-b71126a60688@tuxedocomputers.com>
 <dnu7mbrw7fs4qvwi2alvgrqvonsrucrq7hgxgkqyyqn5djzkkj@c7grkpftjbw4>
In-Reply-To: <dnu7mbrw7fs4qvwi2alvgrqvonsrucrq7hgxgkqyyqn5djzkkj@c7grkpftjbw4>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla Thunderbird
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MN0PR12MB6101:EE_|PH7PR12MB6538:EE_
x-ms-office365-filtering-correlation-id: 1b76b0fb-f122-4794-0d14-08ddb28e184f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|1800799024|366016|376014|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?dlBsRWVwT0QrWnNmbmxnaFlVK2NKNkt4SzZMOFpCQUpmczVDbUxoOUhQdU4v?=
 =?utf-8?B?b2tFd1VQUzJZb25lNnpyTlRoOG83R3VpWnI3a25yUm1oa0JLR1g2YW9VTHQ0?=
 =?utf-8?B?UFlDRU8xRlJ0eGVmYUY5eTNidVVEbTlCWWVZcDZEUG14N0dOVTk3cVZaZTJD?=
 =?utf-8?B?aEc3Tno4TWZSVTRpbTc5UUJvcU93RjdhdXpaMVFEd0JobnJoTTlVS1dRRm82?=
 =?utf-8?B?dS9KdGx1TGt2bkRmd240SnV2MlJLOWk0cDJCNFBzVHAyRW9KUzg2UzdMOE8w?=
 =?utf-8?B?SGU0dytNYk0za2FBdm9ONHdib2RrZlpzd1VPbEVVS0VkTzdDOHZIZXBpazA3?=
 =?utf-8?B?ckdyR21MbVFscWxrQ2VXOGRBZUU5Y0ttVzc5Zng4MnVycWdzRlNwYUxQcWIy?=
 =?utf-8?B?ZVRFTnJVNWFKMzRBM0VXRHBOYUVwcTB4Nm5KV3N0dFZWam0zeXBtZnR3MHdk?=
 =?utf-8?B?OU9rOVE4WDlPdEwxMlM1bGhEYitCd3owNk1oUFNabXBzMDhJRFAxYjFwaHUx?=
 =?utf-8?B?cU1hWVg0cmtkS0djK0hyZU9zR1F0cGtXNXI5eko0dG9rUFhvV3U0TzQvc2Jj?=
 =?utf-8?B?dk1aeEFFemxjVUkwSkdsNmNLbC91WUx6eVBwN3FVYmFKcGJHQ3FuVVBaQlgy?=
 =?utf-8?B?a3p6M0xPSEVHMWZNWmI0a0IyQWVob0tUNjlseHdXTUNyQ0R1OUhXNkc2S0J5?=
 =?utf-8?B?anBNampkUFV0c0JFbWNLcFFaZS8vSnNEZ1B3TTNhS1lPK0hFNVYvZE13REN4?=
 =?utf-8?B?ckkvUEthY2tBRlhzTlBVQlhzaDZnTFZEd01EWTFlcU1abDhOeEU4REJPanZx?=
 =?utf-8?B?Y1dnaDA5UCt4cmF1cm1xSWxVcW1UM29kbW5Gc3F6RCtidDhkRm9OS2VkS2ZP?=
 =?utf-8?B?ejM3Tm5MYisyRHk1YU9neC9VZy91MWdwZ0tWeVlWRGUwZ0t4LzFxOFR1S0Jv?=
 =?utf-8?B?UEtEdHpXUjdvRnBDYkRTTXJ5RnhZbitVOWMrQmM0NStJL3JlRithV3d0Nk55?=
 =?utf-8?B?TlpMMjBrMmlyTWlFMlFJUEhENGIzQm1WbTQ2cDVYVlYweFl6QWZRM0VVeVVI?=
 =?utf-8?B?QXVZNWRnR0lwaTFmUk85Wm1XZXZaSUFOSktCaEhUUGRoZmUrbk9KQlNpL05D?=
 =?utf-8?B?WVNCcEhNbnc1UUgvbTVneW9Qb25zN2ZMeUwrZ05nSFFtOVUxUnpWTlVzdzU5?=
 =?utf-8?B?d2V3SkVHRkl2RHNoNFR0SDVINEhhRjhDK2R5VjNUY1dqTGRMTTdleFpBYWs3?=
 =?utf-8?B?dHZacDNCRlBaN0VrcEMwK0JDcUZIcTZCSklLVGl6bDBWWHpUTkxhRkRjcGJr?=
 =?utf-8?B?QWY0VGFuVGhPcktRcit6elJ2em0zSFJRQXVaMnQ3K1pQbEFEakVQVmorZkY3?=
 =?utf-8?B?aXUrUTZnUHkxdXhnMUN4MmxyWW5GeGVwcVdMa1ZqQTNObTZmTlpWR0hyS2NY?=
 =?utf-8?B?NnRpNWRsa2M2RnJoMTZBYWFTQ1c4NVFUM3ByU0VoK0loWkc5dE5WSjJ2Snh4?=
 =?utf-8?B?SitTbXg2M2d1Qm1VeCtwdXR3cDVBZlF1eUkzWWsyY1lqQUgvTWVPcVdGeXR0?=
 =?utf-8?B?WlVodmlQYjlvK0JFemFndlFUUk5mWkdSL1BTTmc5dkZqZWZ5bm5MR1JURXR3?=
 =?utf-8?B?WGgxdEJ6L2JpYWlBcTZyTldYbUtPSVpQWlV0cVppUm9EQkF1bysxdHhPK2k5?=
 =?utf-8?B?RSswcWlSRGI2M01zZml6dnFDNHBqeE5xVkhDR0Q1SDB2NXp5d1RNTDVqL2V6?=
 =?utf-8?B?WmJGOGQ3cGtNeUtqOXRQTXlvY2pBbjFrVlVxaHhLSk5GbFRoUHJYMUhtVWFw?=
 =?utf-8?B?YVA0VFYwVDFFckJ0eFRwWkxzQzVHWmVjNzRpYXdTeVJpajJPdmZ4a3ZpMDFz?=
 =?utf-8?B?dFliSnd6bGdkZHlySmpNZGsxNU5LU0NXS0RZa3ZIbmtqRllyTzZmdy9qRWVx?=
 =?utf-8?B?RExrTW9yQzNmQkNubFNWNlNTaDhkZjZ6aHphekNqMlkwV3hITWdiMHlzVDJK?=
 =?utf-8?Q?waokCKKWvvcCQSlw+xXa9N80UXRn5w=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR12MB6101.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?S2xKVlVhMmJ6ZGpQWm0vTWdTdG1LRnhLcXpmV1hVVy81RnFCOWVDM29KTDNJ?=
 =?utf-8?B?SEM2TU9YTnNsTzJPNjhiTTh3MnJ5dkU4Y1l4Q2I1RmdHSS9YY09yTkRBYjRB?=
 =?utf-8?B?TjB3NHRLQ0xVYWFOUXdaUzBYU2U3emhSa2NQaE1adXBXbHNmUlN5M0pld2pG?=
 =?utf-8?B?L2VkdjVjYXBDbFBjdDMxdW8vOW5zdEFCd0dXK2doclFBWm5OTjdDRkZuT25M?=
 =?utf-8?B?SFNmTWY4UUZWUlVVTlVTQnZTVFg5YUdWa3VvS2xyd3hGejdTMkVJanA4dm9I?=
 =?utf-8?B?R3gzWWxnZzFnUkE1RS9rMFZBc0NMV3JrUnVWRXlmc2Zha3ovTmd0ZDNVaHAv?=
 =?utf-8?B?YjZEZGgrcVo5ekZ1aVdJM3ZZemltZ3p6YXVDdXNjdzhnaHh5ZVRBcnpMaTZO?=
 =?utf-8?B?bmh2cFhFUFc4ek82SE1zWVovUExnTzhjQURGWndOMGVaU01yTTAzT0oyWlhj?=
 =?utf-8?B?V2pMSmFoRlM1bkZ2aytFSE5zeXZyM3lRSUR3REZNcmtPenhKWEhKU2h5V3hY?=
 =?utf-8?B?WDdFOHFkYVZSdEhaSUZzVGhyTEtLM0tVY1dLbWltT0k0Ym9UNEVIOEVXczdN?=
 =?utf-8?B?VlJEODJVRGlybEo2VlM3TGhEWFA4eUJKWDVoSmtzR25MTE1YTWpLQWdrRzZ0?=
 =?utf-8?B?WkpPZXdFc0c2N1ZQNWdzN3U1b3VNMlhDd1JNMDdwSE5KODhRdDBhOGt6Tjc3?=
 =?utf-8?B?UWpCMDlUckpBSWFhVlgwazBsTCt2b0dUSEtROWxDVHozUGV4aElxQm5PcGN6?=
 =?utf-8?B?aVlkMlpGYmVoRndTR3JzVmc3ZDZza1F2RVg5RzVuK3NuZ09iNUlaT0xlSE5k?=
 =?utf-8?B?S0ZjSVA0MU9Fczd2SHZIQmtUa0l1OGoxVk55RDk0b1F3NElNQXNsZmRGZXBK?=
 =?utf-8?B?L2V1UFV0TmhwV1RaZGhoZjJxbElxMnM3Qks2Vy9BRXUwQnZTZ3pSa2xJNG1h?=
 =?utf-8?B?MnJQU29Ka1JTNlVEMTVSR0RQYkt0Ukk1QjdhbXlSdGpkUDhCeGxaMUtGYUcv?=
 =?utf-8?B?VlJRMkNxc09TK0NRYmNXSHB1MFh6ekQ5bjg4UCtmSzBzNUpiOGRSTlgzcmN4?=
 =?utf-8?B?Uk5OMXlNYlI4UXJVS2EvSWQrUnlCWFQrVmg3N2VPbnJJc0ppLytDNllhenJz?=
 =?utf-8?B?eS9WQ09PT1c5cE5NdmdyUG54Wm9WZUg3NDNZbzFwcXFiSzJDRUxaTEYybVlz?=
 =?utf-8?B?T3JHb2Myb2lrdlJacjJyNlhoeUkvWWUraUJLbko3c3NHMk1CYTluS2g4MlNt?=
 =?utf-8?B?bGt2VEpUUkxXR0VSdTVNMnFRSk96SWdQUmpxN3dxMEpleGs4WkUxeTBTa0Nk?=
 =?utf-8?B?NGZWWGpBODU5MDc0V2ZBK3RSR3lYS0lNeTBnaEhIUjc1NlNLM3MxQkc2WnB6?=
 =?utf-8?B?ellpTmJCWkJvemhETDNwT1pvYjZ6aFU2WXE2cm5EOG5CVFgzdlkya3pTN0xJ?=
 =?utf-8?B?RG9aSmtWd1htZVNFSGJNRkhKYkJ3RjViWFFtcGErTEtwM1pCOXozbHVNSGkr?=
 =?utf-8?B?alEzdVBadmJvOTFOaEJVTDRCSzlDcWc4aWM2c2Fjc3ZSTDZNa1JpTEdpQ1F4?=
 =?utf-8?B?dVZZdkhtNU45aFRqaC9Za1VRMEZScUd6V3ZWWmJ3RHJRV0s2aUQyNGtXd0Uy?=
 =?utf-8?B?SkxSLzdWTGM5M0VEZDRPcmV3TjFBNFhLZkgxaG8xbUo3cTlWT1FDa0xtNDU0?=
 =?utf-8?B?djJucE02YUo5a1N0WC95SGcyeTdVZk9lL1pLMUJrOHRENFZzdXpQeldodEJC?=
 =?utf-8?B?NGNiNnB4T3NPbldrTmErb2FJMzlvcStzenEySkdRaVFmS3JybE1Sc2NHL2F5?=
 =?utf-8?B?cC9mcHBmUW9odk40MGtockdmbHpTa1l3UEZLL3NQNUVBR3B2OFMwUWo1OFRD?=
 =?utf-8?B?TzJENVgyT0VSZWc1ckNFblBQRkhIZktDcmRDbStmcEhmR0Z0ekVaNU0xenB4?=
 =?utf-8?B?MmV3VUZ6dmRHNWtSS2JKQU1peUZwQjNsUjBxdlBlSU5SVitpOHFuNk8rcHhi?=
 =?utf-8?B?b2FwWDNCWElJd05SZk1qTUcvSTEybGZ3T294c3lzaldsRTA2ZWZqSTVLZndk?=
 =?utf-8?B?ajA4SkQwVDhlRVlyQUVxQ0dxUGFrWm0yUE5lNHhLU1ZmbHR1dTJPQXlhZERI?=
 =?utf-8?Q?mdXo=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <6550EAA819B21246A97E9333B643BDA4@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB6101.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1b76b0fb-f122-4794-0d14-08ddb28e184f
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Jun 2025 19:42:31.9086 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: brNRwUThuOeJ2+6/8QbMB1C++PCiEUw6pMFfLZn8H0YMcKZeCTX1n0Xvvu+GFsa2Qv9pMs1T/ZXdHBWA4Agxkg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6538
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

T24gNi8yMy8yNSAyOjEzIFBNLCBSb2RyaWdvIFNpcXVlaXJhIHdyb3RlOg0KPiBPbiAwNi8yMywg
V2VybmVyIFNlbWJhY2ggd3JvdGU6DQo+PiBnZW50bGUgYnVtcA0KPj4NCj4+IEFtIDA5LjA0LjI1
IHVtIDE4OjI3IHNjaHJpZWIgV2VybmVyIFNlbWJhY2g6DQo+Pj4gVGhlIGRpc3BsYXkgYmFja2xp
Z2h0IG9uIFRVWEVETyBQb2xhcmlzIEFNRCBHZW4yIGFuZCBHZW4zIHdpdGggcGFuZWxzDQo+Pj4g
Qk9FIDI0MjAgYW5kIEJPRSAyNDIzIG11c3QgYmUgZm9yY2VkIHRvIHB3biBjb250cm9sbGVkIHRv
IGJlIGFibGUgdG8NCj4+PiBjb250cm9sIHRoZSBicmlnaHRuZXNzLg0KPj4+DQo+Pj4gVGhpcyBj
b3VsZCBhbHJlYWR5IGJlIGFyY2hpdmVkIHZpYSBhIG1vZHVsZSBwYXJhbWV0ZXIsIGJ1dCB0aGlz
IHBhdGNoIGFkZHMNCj4+PiBhIHF1aXJrIHRvIGFwcGx5IHRoaXMgYnkgZGVmYXVsdCBvbiB0aGUg
bWVudGlvbmVkIGRldmljZSArIHBhbmVsDQo+Pj4gY29tYmluYXRpb25zLg0KPj4+DQo+Pj4gU2ln
bmVkLW9mZi1ieTogV2VybmVyIFNlbWJhY2ggPHdzZUB0dXhlZG9jb21wdXRlcnMuY29tPg0KPj4+
IENjOiBzdGFibGVAdmdlci5rZXJuZWwub3JnDQo+Pj4gLS0tDQo+Pj4gICAgLi4uL2dwdS9kcm0v
YW1kL2Rpc3BsYXkvYW1kZ3B1X2RtL2FtZGdwdV9kbS5jIHwgMzIgKysrKysrKysrKysrKysrKysr
LQ0KPj4+ICAgIDEgZmlsZSBjaGFuZ2VkLCAzMSBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0p
DQo+Pj4NCj4+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2FtZGdw
dV9kbS9hbWRncHVfZG0uYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9hbWRncHVfZG0v
YW1kZ3B1X2RtLmMNCj4+PiBpbmRleCAzOWRmNDVmNjUyYjMyLi4yYmFkNjI3NGFkOGZmIDEwMDY0
NA0KPj4+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9hbWRncHVfZG0vYW1kZ3B1
X2RtLmMNCj4+PiArKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvYW1kZ3B1X2RtL2Ft
ZGdwdV9kbS5jDQo+Pj4gQEAgLTE2MjUsMTEgKzE2MjUsMTMgQEAgc3RhdGljIGJvb2wgZG1fc2hv
dWxkX2Rpc2FibGVfc3R1dHRlcihzdHJ1Y3QgcGNpX2RldiAqcGRldikNCj4+PiAgICBzdHJ1Y3Qg
YW1kZ3B1X2RtX3F1aXJrcyB7DQo+Pj4gICAgCWJvb2wgYXV4X2hwZF9kaXNjb247DQo+Pj4gICAg
CWJvb2wgc3VwcG9ydF9lZHAwX29uX2RwMTsNCj4+PiArCWJvb2wgYm9lXzI0MjBfMjQyM19ibF9m
b3JjZV9wd207DQo+Pj4gICAgfTsNCj4+PiAgICBzdGF0aWMgc3RydWN0IGFtZGdwdV9kbV9xdWly
a3MgcXVpcmtfZW50cmllcyA9IHsNCj4+PiAgICAJLmF1eF9ocGRfZGlzY29uID0gZmFsc2UsDQo+
Pj4gLQkuc3VwcG9ydF9lZHAwX29uX2RwMSA9IGZhbHNlDQo+Pj4gKwkuc3VwcG9ydF9lZHAwX29u
X2RwMSA9IGZhbHNlLA0KPj4+ICsJLmJvZV8yNDIwXzI0MjNfYmxfZm9yY2VfcHdtID0gZmFsc2UN
Cj4+PiAgICB9Ow0KPj4+ICAgIHN0YXRpYyBpbnQgZWRwMF9vbl9kcDFfY2FsbGJhY2soY29uc3Qg
c3RydWN0IGRtaV9zeXN0ZW1faWQgKmlkKQ0KPj4+IEBAIC0xNjQ0LDYgKzE2NDYsMTIgQEAgc3Rh
dGljIGludCBhdXhfaHBkX2Rpc2Nvbl9jYWxsYmFjayhjb25zdCBzdHJ1Y3QgZG1pX3N5c3RlbV9p
ZCAqaWQpDQo+Pj4gICAgCXJldHVybiAwOw0KPj4+ICAgIH0NCj4+PiArc3RhdGljIGludCBib2Vf
MjQyMF8yNDIzX2JsX2ZvcmNlX3B3bV9jYWxsYmFjayhjb25zdCBzdHJ1Y3QgZG1pX3N5c3RlbV9p
ZCAqaWQpDQo+Pj4gK3sNCj4+PiArCXF1aXJrX2VudHJpZXMuYm9lXzI0MjBfMjQyM19ibF9mb3Jj
ZV9wd20gPSB0cnVlOw0KPj4+ICsJcmV0dXJuIDA7DQo+Pj4gK30NCj4+PiArDQo+Pj4gICAgc3Rh
dGljIGNvbnN0IHN0cnVjdCBkbWlfc3lzdGVtX2lkIGRtaV9xdWlya190YWJsZVtdID0gew0KPj4+
ICAgIAl7DQo+Pj4gICAgCQkuY2FsbGJhY2sgPSBhdXhfaHBkX2Rpc2Nvbl9jYWxsYmFjaywNCj4+
PiBAQCAtMTcyMiw2ICsxNzMwLDIwIEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3QgZG1pX3N5c3RlbV9p
ZCBkbWlfcXVpcmtfdGFibGVbXSA9IHsNCj4+PiAgICAJCQlETUlfTUFUQ0goRE1JX1BST0RVQ1Rf
TkFNRSwgIkhQIEVsaXRlQm9vayA2NjUgMTYgaW5jaCBHMTEgTm90ZWJvb2sgUEMiKSwNCj4+PiAg
ICAJCX0sDQo+Pj4gICAgCX0sDQo+Pj4gKwl7DQo+Pj4gKwkJLy8gVFVYRURPIFBvbGFyaXMgQU1E
IEdlbjINCj4+PiArCQkuY2FsbGJhY2sgPSBib2VfMjQyMF8yNDIzX2JsX2ZvcmNlX3B3bV9jYWxs
YmFjaywNCj4+PiArCQkubWF0Y2hlcyA9IHsNCj4+PiArCQkJRE1JX01BVENIKERNSV9CT0FSRF9O
QU1FLCAiR014Tkd4eCIpLA0KPj4+ICsJCX0sDQo+Pj4gKwl9LA0KPj4+ICsJew0KPj4+ICsJCS8v
IFRVWEVETyBQb2xhcmlzIEFNRCBHZW4zDQo+Pj4gKwkJLmNhbGxiYWNrID0gYm9lXzI0MjBfMjQy
M19ibF9mb3JjZV9wd21fY2FsbGJhY2ssDQo+Pj4gKwkJLm1hdGNoZXMgPSB7DQo+Pj4gKwkJCURN
SV9NQVRDSChETUlfQk9BUkRfTkFNRSwgIkdNeFpHeHgiKSwNCj4+PiArCQl9LA0KPj4+ICsJfSwN
Cj4+PiAgICAJe30NCj4+PiAgICAJLyogVE9ETzogcmVmYWN0b3IgdGhpcyBmcm9tIGEgZml4ZWQg
dGFibGUgdG8gYSBkeW5hbWljIG9wdGlvbiAqLw0KPj4+ICAgIH07DQo+Pj4gQEAgLTM1ODYsNiAr
MzYwOCw3IEBAIHN0YXRpYyB2b2lkIHVwZGF0ZV9jb25uZWN0b3JfZXh0X2NhcHMoc3RydWN0IGFt
ZGdwdV9kbV9jb25uZWN0b3IgKmFjb25uZWN0b3IpDQo+Pj4gICAgCXN0cnVjdCBhbWRncHVfZGV2
aWNlICphZGV2Ow0KPj4+ICAgIAlzdHJ1Y3QgZHJtX2x1bWluYW5jZV9yYW5nZV9pbmZvICpsdW1p
bmFuY2VfcmFuZ2U7DQo+Pj4gICAgCWludCBtaW5faW5wdXRfc2lnbmFsX292ZXJyaWRlOw0KPj4+
ICsJdTMyIHBhbmVsOw0KPj4+ICAgIAlpZiAoYWNvbm5lY3Rvci0+YmxfaWR4ID09IC0xIHx8DQo+
Pj4gICAgCSAgICBhY29ubmVjdG9yLT5kY19saW5rLT5jb25uZWN0b3Jfc2lnbmFsICE9IFNJR05B
TF9UWVBFX0VEUCkNCj4+PiBAQCAtMzYxMCw2ICszNjMzLDEzIEBAIHN0YXRpYyB2b2lkIHVwZGF0
ZV9jb25uZWN0b3JfZXh0X2NhcHMoc3RydWN0IGFtZGdwdV9kbV9jb25uZWN0b3IgKmFjb25uZWN0
b3IpDQo+Pj4gICAgCQljYXBzLT5hdXhfc3VwcG9ydCA9IGZhbHNlOw0KPj4+ICAgIAllbHNlIGlm
IChhbWRncHVfYmFja2xpZ2h0ID09IDEpDQo+Pj4gICAgCQljYXBzLT5hdXhfc3VwcG9ydCA9IHRy
dWU7DQo+Pj4gKwllbHNlIGlmIChhbWRncHVfYmFja2xpZ2h0ID09IC0xICYmDQo+Pj4gKwkJIHF1
aXJrX2VudHJpZXMuYm9lXzI0MjBfMjQyM19ibF9mb3JjZV9wd20pIHsNCj4+PiArCQlwYW5lbCA9
IGRybV9lZGlkX2dldF9wYW5lbF9pZChhY29ubmVjdG9yLT5kcm1fZWRpZCk7DQo+Pj4gKwkJaWYg
KHBhbmVsID09IGRybV9lZGlkX2VuY29kZV9wYW5lbF9pZCgnQicsICdPJywgJ0UnLCAweDA5NzQp
IHx8DQo+Pj4gKwkJICAgIHBhbmVsID09IGRybV9lZGlkX2VuY29kZV9wYW5lbF9pZCgnQicsICdP
JywgJ0UnLCAweDA5NzcpKQ0KPj4+ICsJCQljYXBzLT5hdXhfc3VwcG9ydCA9IGZhbHNlOw0KPj4+
ICsJfQ0KPiANCj4gSXQgbGd0bSwNCj4gDQo+IEFkZGl0aW9uYWxseSwgSSBiZWxpZXZlIHRoaXMg
aXMgc2FmZSB0byBtZXJnZSBzaW5jZSBpdCBvbmx5IGFmZmVjdHMgYQ0KPiBzcGVjaWZpYyBkZXZp
Y2UuIFBlcmhhcHMgZGlzcGxheSBmb2xrcyB3b3VsZCBsaWtlIHRvIGluY2x1ZGUgdGhpcyBhcw0K
PiBwYXJ0IG9mIHRoaXMgd2VlaydzIHByb21vdGlvbj8gQW55d2F5LCBDYyBvdGhlciBkZXZzIGZy
b20gdGhlIGRpc3BsYXkuDQo+IA0KPiBSZXZpZXdlZC1ieTogUm9kcmlnbyBTaXF1ZWlyYSA8c2lx
dWVpcmFAaWdhbGlhLmNvbT4NCg0KVGhhdCdzIGEgYml0IG9kZCB0aGF0IGF1eCBiYXNlZCBCL0wg
Y29udHJvbCB3b3VsZG4ndCB3b3JrLiAgQXJlIHRoZXNlIA0KYm90aCBPTEVEIHBhbmVscz8gIFdo
YXQgZGVidWdnaW5nIGhhdmUgeW91IGRvbmUgdGh1cyBmYXIgd2l0aCB0aGVtPw0KV2hhdCBrZXJu
ZWwgYmFzZT8NCg0KQ291bGQgeW91IHJlcHJvIG9uIDYuMTYtcmMzPw0KDQo+IA0KPj4+ICAgIAlp
ZiAoY2Fwcy0+YXV4X3N1cHBvcnQpDQo+Pj4gICAgCQlhY29ubmVjdG9yLT5kY19saW5rLT5iYWNr
bGlnaHRfY29udHJvbF90eXBlID0gQkFDS0xJR0hUX0NPTlRST0xfQU1EX0FVWDsNCj4gDQoNCg==
