Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wH4rLHcJi2kdPQAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 10 Feb 2026 11:33:27 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 100F8119ABE
	for <lists+dri-devel@lfdr.de>; Tue, 10 Feb 2026 11:33:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8DE8F10E068;
	Tue, 10 Feb 2026 10:33:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=imgtec.com header.i=@imgtec.com header.b="SE3KZyRd";
	dkim=pass (1024-bit key; unprotected) header.d=IMGTecCRM.onmicrosoft.com header.i=@IMGTecCRM.onmicrosoft.com header.b="roOuDwew";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx08-00376f01.pphosted.com (mx08-00376f01.pphosted.com
 [91.207.212.86])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A090A10E068
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Feb 2026 10:33:23 +0000 (UTC)
Received: from pps.filterd (m0168888.ppops.net [127.0.0.1])
 by mx08-00376f01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 61A6LaBV805667; Tue, 10 Feb 2026 10:33:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=imgtec.com; h=cc
 :content-id:content-transfer-encoding:content-type:date:from
 :in-reply-to:message-id:mime-version:references:subject:to; s=
 dk201812; bh=z51Tcj9xSH20kAHed8f7i1awYRaf9uNhjF1n8EFI/+U=; b=SE3
 KZyRdbVVHjVh/Q5Get4AmcF/9S7FlOi2ywXyqJI/bv/BFWH+Z3tz5WFCSd9BC+bZ
 SaTaKVK1yqlzsXe0AA/4HIcU5q7/nYQV/NlsGV/Gpuy3PpNN9MBDpJXecwv02O/7
 FIma5PlXnmg0hCdNf91m6ug72FYGSgqDAwKKddCMppRTpTRBPOafKUoX5Fk6dI0C
 WxZxElXaGXDesgc7pIBBVCzKXx9k4WreP34j9CG0r9q/7qz54F7EhmTgBZSR8Gr1
 UuIQY/jGrumt4/70a7CrY9rFfPTQgnhwDxouYAuK0fjHv9Q6Vio2QBQmJ31QrZhk
 42mmwZWKL9e27i9z1mw==
Received: from cwxp265cu008.outbound.protection.outlook.com
 (mail-ukwestazon11020109.outbound.protection.outlook.com [52.101.195.109])
 by mx08-00376f01.pphosted.com (PPS) with ESMTPS id 4c5vht1xnc-1
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
 Tue, 10 Feb 2026 10:33:16 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Z7hD5GJfN2qHTOS4o+1OCCF1lWlFBD4h/ViTPvnALFTnMrAeQk9gLT/r6smbL7MNCjmkAFy1uCA3ECW/Ycg8nTIxuflMDmoOEBJDmDQN5WLoIyWrA/NEhavr3ot0b1zQrYoh2+Nq2ZTbw4MBLy5YslQzb4RR6btrFDq7etnM0mo/3/VqCK8WZKDYOIjUUTXmhOVfx0KwVVR2ZDymfUU+qYZDsKAJPCkPFMTTIQAMcZJa0WbI9Q3D/l02TcwCO9VwJNcEaCFe/fi27x6lbpfU5hMXzQ60vkUmtKBX/FY/1y+/XC77svLRFT65RZsnPFFuj5roa7aDoiXLB+5/Y5kK3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=z51Tcj9xSH20kAHed8f7i1awYRaf9uNhjF1n8EFI/+U=;
 b=oW+ZYl9D4laKJSzTI8+CmnxIohvlktk+l7TbeTKaOLcYFBX95W1tyGUzbjf5AIx9LfnXArn0xirFSACViH4y0zT1iSa9776tRiWzeBHknXRxzeqBAsXMGTGs/zEzgTtDWJRiigMmxd8skrafej0SUFZnFAg79mLFwiOQ5Zgwdtre7HICTT8tGIhEh3NHOeHn8SQwFEMRgqvr2oIoExlukwwZ+lYfUGIAYmdQO+rOzN+R66zV2baFdVBzwYicq0f1N5gV/ojsHljyd7gZH25oLd/X1rDC0+gC05jK9zccTJVB+cPES46Nk/GKLEtw8d4L+/KA2vuLjLkUSQ93eI+y7Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=imgtec.com; dmarc=pass action=none header.from=imgtec.com;
 dkim=pass header.d=imgtec.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=IMGTecCRM.onmicrosoft.com; s=selector2-IMGTecCRM-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=z51Tcj9xSH20kAHed8f7i1awYRaf9uNhjF1n8EFI/+U=;
 b=roOuDwewHkRTJ25ExP8dLtR02Xdf+AjTo15kmJo0ZMoLy6v6JV11mdNbLbtWtFmGOhtR68EcPxZ/8PUldSUNlBlXWxrdI1mdALSRhqYi3/MMFWOAPpVGkvqFr35x65eRqARSODWG//7qDqcQoF8hvUimoYfsCvqt6f6hwQwp94I=
Received: from LOCP265MB8579.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:4b6::11)
 by LO0P265MB6193.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:24a::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.20; Tue, 10 Feb
 2026 10:33:13 +0000
Received: from LOCP265MB8579.GBRP265.PROD.OUTLOOK.COM
 ([fe80::6a13:bb8b:b1da:77e3]) by LOCP265MB8579.GBRP265.PROD.OUTLOOK.COM
 ([fe80::6a13:bb8b:b1da:77e3%6]) with mapi id 15.20.9587.017; Tue, 10 Feb 2026
 10:33:13 +0000
From: Frank Binns <Frank.Binns@imgtec.com>
To: Matt Coster <Matt.Coster@imgtec.com>, "maarten.lankhorst@linux.intel.com"
 <maarten.lankhorst@linux.intel.com>, "mripard@kernel.org"
 <mripard@kernel.org>, "airlied@gmail.com" <airlied@gmail.com>,
 "tzimmermann@suse.de" <tzimmermann@suse.de>, "simona@ffwll.ch"
 <simona@ffwll.ch>
CC: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "stable@vger.kernel.org" <stable@vger.kernel.org>, Brajesh Gupta
 <Brajesh.Gupta@imgtec.com>, Alexandru Dadu <Alexandru.Dadu@imgtec.com>,
 Simon Perretta <Simon.Perretta@imgtec.com>, Alessio Belle
 <Alessio.Belle@imgtec.com>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] drm/imagination: Fix ROGUE_MAX_COMPUTE_SHARED_REGISTERS
Thread-Topic: [PATCH] drm/imagination: Fix ROGUE_MAX_COMPUTE_SHARED_REGISTERS
Thread-Index: AQHcl09ZQXLeYTTDRUacTTNjLHPrx7V7wLAA
Date: Tue, 10 Feb 2026 10:33:13 +0000
Message-ID: <8a5de9ce32def5c33418c76ae2548f21b7d9ba7a.camel@imgtec.com>
References: <20260206-rogue-max-compute-shared-registers-v1-1-888249fa50b1@imgtec.com>
In-Reply-To: <20260206-rogue-max-compute-shared-registers-v1-1-888249fa50b1@imgtec.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.36.5-0ubuntu1 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LOCP265MB8579:EE_|LO0P265MB6193:EE_
x-ms-office365-filtering-correlation-id: 7fb83cbe-3e8c-4367-b49a-08de688fcb6a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|366016|1800799024|376014|38070700021;
x-microsoft-antispam-message-info: =?utf-8?B?RUpWRVF0N1BvMVJVSXIrdlp4ZzlHWU1xZEJzajVzYXZpa1UySmpLQ1JvTklh?=
 =?utf-8?B?NHliT1EzNDFvb3hublFRbUg2bEo2Zi9aMFJlZk1vWndwVE5TRnhROVNIdmFw?=
 =?utf-8?B?N215UnJEODJZKzhLOUtra29zd1k0MFpwWDFDaGw1UWx1L05qTDRDbXB0UkN3?=
 =?utf-8?B?MTlYQ1FZK1B1Z1pKK0VCTG45ZUxqVG00YjJzdndLRDhHQXZFYk82V0ZraXl4?=
 =?utf-8?B?d3ZBVStkTDNBdGJLVk04NGVDYkRpMTIwZGpUMzBUNVM4cjhOV2VtTkRLSnFO?=
 =?utf-8?B?RzFGUWZvRWs1c3NWRUh1b05QOVhTU21sMHAwR2ZTTFRCUldwUGZUM2x0UlBy?=
 =?utf-8?B?OG01NDNIZ2htWTQwaEIxYmV3alhoRzR1N0xyMGYyeUp1d2I2cGNqb2doV3da?=
 =?utf-8?B?UkYwa1hKQXkvVVdlRmVDS0RlRmJxK3JZblViMTUxb1A1Rk5yQ3lsNVF1MUFC?=
 =?utf-8?B?aS9uL08yUTNvZ2ZnMUYzbzZuSmNwMjNwSFBsYXMvL2dLcjdVWU1qRFFYNVBE?=
 =?utf-8?B?NFBmSWRlRzhFczdOQjFuNlVIZW5zR1Nta2hMZ01TejhUNkZnK0RQdUI4czY5?=
 =?utf-8?B?QjdQWksyakpyNXRDS3AwSXdwOHVDaXJ3QjF0MDBoZ2M3bUMwNm9YU1RmbXJT?=
 =?utf-8?B?bGYyZVFMU1JnYWpUREN1ZDV5b2pEcVg5eHVFa3pva0ZTREpZV0d1eTNBdEU3?=
 =?utf-8?B?WUZ1eDJuOWRNNUpaYWE2SFh1VUovUEV3bDNhYzMyWkw1ZXdZVGdRVThZY29D?=
 =?utf-8?B?eW40d1FZVFJaUEZTMm5PSXNaQllid1dtT0dwLzl4RnBHVjU4elcvMGkzMVF1?=
 =?utf-8?B?UHlDU0g4djlNbGg4T21vMjlra0s5ZlhUcTZvSDNETDRIc0tsMU5BVS9acHN0?=
 =?utf-8?B?UDUwckFUMDB2ZTBHSjJ4cU5kT3dLekduV0FFcTJzNTJsTWFHVHlvQXhOVGJk?=
 =?utf-8?B?TnRTT1o3NGQ1U0ZjeFNMbDZFL2FnVlk4ZkhGMGxJYVFrY1o2Um9DcGVjbVZ6?=
 =?utf-8?B?b2VkUktRRlhUR0N0ZENpMG5KS2l0Y0ozUTZiWjNaMlBOVDUzVmpaYkcxc09Q?=
 =?utf-8?B?NU5yRzVmMDUyZU11VTZ6K2pJbHRWbGZaRFJBb0hoWGFJWGxrTG9VcjNpcFBJ?=
 =?utf-8?B?OWtoRjNaYy9lZ1JHZHowZ1ZDU1pSQ1prZFZCcXI3Mk5EaWE2RVAxSjdZZzBC?=
 =?utf-8?B?TU9MLzFTRnZmTEcxM0MvN1BCT2hVWENmdmdLUlRsVjRXUTdKOFgwNjZ6OG5F?=
 =?utf-8?B?YWMyUGMrWndSaWxTSm4vd0ExWnNVK2NKMnZqZnk2cERGSXZUWTdta1ZMY25o?=
 =?utf-8?B?emZKSE9IK0xWUVZXRHY0b1RSZUpjTjNmdHNPNnpQWlRadUFsODY3eDVDWmMy?=
 =?utf-8?B?ZEp5THMzU1RJYzZyZmJSeE5yUXgrZXhIdUYrYUtQR2FFT2JoNU5OV1JkUmFX?=
 =?utf-8?B?dEpyNUQ3VEhwMXd0Q2FEdWlnQUNpR2pOMGFCc1l1U3Y4d0dBZW1DZEJwVWcv?=
 =?utf-8?B?aWErTFBBZWgwdnpXYTJaNm5ZeVdFcFJqUys3alhYS0JIdGZuV1M2aDcwdmpt?=
 =?utf-8?B?U0JTcXBkYzQxUnpzMmduNmFqazEyMkVpWWhGSmpQS1F6MGlBWFUvTWZ0emtp?=
 =?utf-8?B?bCt2TkVYYXpueGVQZE9uejVnbGVrZXEwb0RCTDhlVzFGaWVrYisxTVVCKzEz?=
 =?utf-8?B?WUd2Q0NobmQ3Qm1xZ3NEN1ZObGpjNytXVDQ3ZkJWVnp6Tzd5ZkZDL0EzNHlB?=
 =?utf-8?B?TXBMRXF6U0Y4TjhqbTF3Y29SV05SVTJTc3UyK3Byem5Hb0NrQ3c1RmY1MTlP?=
 =?utf-8?B?ckJVQ1dmd29SQmZObDNTditmMTRxRGdkUGZ0WTJGUkpPNno3Zjhod1RDTzZR?=
 =?utf-8?B?dElpTW5NVUdkYllsdVJMeWNkRngrTjVpaDR1cHpscUlvNnF5aWVZOEVwK3lk?=
 =?utf-8?B?VnMyVW5OR2FnZ093ZGs1dWpRZUJleUtpcmZ0ZTRwYlVkTzYzcW9vd2V1VmZ4?=
 =?utf-8?B?S1hodHJJNUcxVjJKTGtSNG5hdWZ2VFlGUFVGd3ZnVCs2V1VDR2tjenVrMHJK?=
 =?utf-8?B?ZlBSUjRDTHZVTVlMaU5UQWNxWWs0cDZmaSs1NWdZSmRhRVhyMmlPMkhzbXJV?=
 =?utf-8?B?cStxanJqTVdXbkxSNW8xVldxT0pKakZEWmFLR05ORXpxYm5tWUZYM0piaUVq?=
 =?utf-8?Q?VupdJuFOElqAOZGCNdzAgqM=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LOCP265MB8579.GBRP265.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(38070700021); DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Y25LaTJxcWtDd014RWl6RlRweDROZ0FuK3dCVjVhemhjTGRuTFJKZXJGTFpC?=
 =?utf-8?B?eWV4V3pnWFdoZ25NM1JxL056RkNPYk1mRnRKdmRsa3FLZzZrSkIvWW5Nbk5W?=
 =?utf-8?B?SzhiY1l2THZmTVlsblNnNFgyZTBnMnUrSEk0NUsrc2MzNzJHbjV5OWxRaVlY?=
 =?utf-8?B?ek11SjNEZWZBRUFiWVlFZXVPLy8wMXVJakJJbitjQktkZzRQcjErU0RCUG9N?=
 =?utf-8?B?YmV0dTJ4Z0FIK3FIRkhETE9EL3VaV2NxS3I1ZXBRRkhRSG9GMXA1SjlVWUlH?=
 =?utf-8?B?ZkYzVFVNT09nUC9OSVp2N0ZVL09aWEdNOFprMVNaTkZMV1hBTU4vVWRlZ2U2?=
 =?utf-8?B?L2ptNURxU3V1ZkFYNjNyZXBmNEZ2VmVBVTF6SGdVRTRWQVg1RHRJUzUwbitj?=
 =?utf-8?B?b3lxT2VPbndTTUhYTjdqbzZTMWdDMGpZQUo2Rmh2aHZTMkxtbDJGVisvWm5F?=
 =?utf-8?B?aC9oMDF0Y0tERGV4WDdqVmdxMFdFTE9mc1haeEgrbGIvQXBCMG1Xcjl3THNq?=
 =?utf-8?B?SDVkY2hNVnpDVTRtek5YODlDMktNc3R2OE1SVkxOcktLVFFXMkVxT0dqVGJD?=
 =?utf-8?B?L3dkTW5oeVFnRnprV0E3VDF2ZjFkczVwRE5HanpZMktQWXViOW9VM0w5MmRw?=
 =?utf-8?B?ak1iOE9nTkxjYkRCc2RXdGZGT2hjcFBNMGVINjR6QWl6bFVuRHkrc2lyQW9C?=
 =?utf-8?B?cVM5YW84MEhZaUxWdlk4eERmZnVkWTNqSDdSUDl0QlBOZ1NhcS85S0E4alBI?=
 =?utf-8?B?Y1JBRVBvTmxzQ05CbjRnNVVOMnJFN1pvM2xJVitVRXJnQmVSM0pVc1gybkc2?=
 =?utf-8?B?Ymg4Z3B4RWZtQkRvMzQyWFZVY3kyQkJad3J4ZWpwSGVYT2JHODFsYk5RaEF6?=
 =?utf-8?B?YXp4NXdxQjg2QXZyQlBraS9USTlJcjZhUUM1NFJtSHVPQklDRmdlM25vMHZG?=
 =?utf-8?B?OGQzdnpjc2tPN3hPNXVKYkh3RGdQcDlCcUp3UXlqYUZZNkZGRmhJRnFQa0Ro?=
 =?utf-8?B?a1FZYmhGQ3VrQzBqdzJnZW5XM3hTR0lBVXZtVDBvOXp1cWJra05ueUxDWVov?=
 =?utf-8?B?dXJhQzNXdEFPQ1hPMTZ0aSs0Sk51UUovS0F1NUZqZGV5YWZhVVJvQ0tHU2JQ?=
 =?utf-8?B?NXhMaG93TVdscXlmTmN1NkZFN0RPUDQvZElCN25qWkRVN1RUUzZGN09SRHZ6?=
 =?utf-8?B?WUZuZndkN3RiMTZZZnBFMlNTMmw0emV2cEhNRWtUalpmOEd6QnVENENleFhj?=
 =?utf-8?B?Qzc1dkcvSWxNd1R4b3VCNjAwaFJGY2pBTHdtYWdrR0dXaWE0bHlTV1RHYVJO?=
 =?utf-8?B?cHdMNHdEV0J5ejVWSXdCbmNKbGhOMVRueUpoVGZ3SURIL1A4WTF4M0pYalcx?=
 =?utf-8?B?dTluTmU2YjM5N3R3d3ZrMU5ZN2E5Wi9NUnN0OTFCa1d3ZUhoT1pJM3hNT20x?=
 =?utf-8?B?S3NQUkRxSnoybE9acHB6cms0RnBhWTJlYWlWcU1hYWF3aFRtNXdSTDRIYXF5?=
 =?utf-8?B?aUdxUXkyeldET2tqUENFWi9wVnRUVUhkM2tnZU1VaWwvQlN0OFAwQi96c29n?=
 =?utf-8?B?TG1vb0YySGNMVnRJYlhiMGh4UEhnM0lOVUlOLzUxcVM2Slp5UW5pQjFNcFpJ?=
 =?utf-8?B?NVZ2TS95ZWFVdGdvajIycDNERVdPdFA4R2Z6WU93azcwRVczYnJENDNKN0F2?=
 =?utf-8?B?NXRKOEtSQTJZay9waUFKalAvNk1sdld4QnY3NGl2Y3BYUW9IS2dFVGpITWlY?=
 =?utf-8?B?eTdGWFZjZFc4NmRTZjlWbmFzcnF6MWNKS3pxOE5CdmwrWkMwM2kxSHFDRHg0?=
 =?utf-8?B?OWx6QkZwbGNQa0k4RlFTNVFmajUrRGsxTzBWVVVzNW9tVXVlR2RoOW81ZlA2?=
 =?utf-8?B?c2FqeklHelI1eGtBNjNaRERHMGVoSGQ4UE52azlkUmIvdzF0d0M2TFFaa0VB?=
 =?utf-8?B?NjBZamFrdjc3ZWMvNGJRT3VxVlovaGdyZUxIODlPN0Raam03MzJLcEF5aXBN?=
 =?utf-8?B?cFdHUGZnZ0Y4T0lDR080SDgrbWdHVWh3NDJEZUdMQTM4elV6NGcwSFVjVmdL?=
 =?utf-8?B?SWlWUWhkOTQ0a3B1OWtMTFJkTFZoWEdyUGEraFpHb1d4ckJ6OXpPOHRrd1Zj?=
 =?utf-8?B?QU51Z014UVkzR2c3UjJtR01hRk10akpwcU82NUVKNmhITWdLV3BHcGFJWUtZ?=
 =?utf-8?B?QWl3VUsvclNrMlpIaFIrb1lFbzQzMTRMQjFuK3BIUm9LTTYrbXBrQ0xmZy9m?=
 =?utf-8?B?L3Z5em5udkxNR2Y1VU1JL0hMMUdZM09OMUxDbFNIWktnM08wSVM4b2luUVNI?=
 =?utf-8?B?R1BXNmVVTEF5bkFGdHA0b0phVC9CK3M3a2pVbmJ1cWo2OG91WGpwK3VRbHBH?=
 =?utf-8?Q?arYfViUFIyxJvpwI=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <56EAE5E427A4084A97552CC85EB82BB4@GBRP265.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: imgtec.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: LOCP265MB8579.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 7fb83cbe-3e8c-4367-b49a-08de688fcb6a
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Feb 2026 10:33:13.5316 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 0d5fd8bb-e8c2-4e0a-8dd5-2c264f7140fe
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: UcoxAcceQUWBs/9uFEXP403X70baoOOWy7wXiozj8m6upv2mDeF4uCwZKYvnEWtmgLeyR/kW8G8+cJFByqloVg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO0P265MB6193
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjEwMDA4OCBTYWx0ZWRfX5lBaFQQB+u7m
 wfAeq4P+lcFSVJjdfRt7bG6087vh1PlRGBYnEjHi9pUejiMzc1TxSIyzVxDYWK/JFy3hFQAPnOj
 v3OzcEpqU+svfsOHoKfo9A+SyhAghrw7wLVqMZ7+1Dr1Xeg1fgAXHQcNA1tOe3yr73uoCX/q0x8
 nDw51tzlRYlKmomYKk1s+tdnxrMGvmse9hGpHFa4yAqetWlD/dt7fcyRwWhLFMhiz2C66xQ6q3Z
 oSv2IA/SyZEbvPMdDWphrvpKmBltni+cTf16wahf9ASbUXnm/9h/Vgt2T9eKQmu7+R/C6hRHGUC
 QtrfEzYpvSGx9+JrT7Jglbzqb9C1MzRVQvDnjgb2KfcjA1zEjIk7EP7shiTs4c3RwmypDIoVJwv
 crKuW6KJCd5ffX+ziPGWBUeaTnp561Eu6oae8yQxOgU4O1LglqyZnT2pIy3GvKr4Sd9gaikAmpV
 u+MTM0UwiYxu5IIKtMw==
X-Authority-Analysis: v=2.4 cv=IuYTsb/g c=1 sm=1 tr=0 ts=698b096c cx=c_pps
 a=hpQ/3Ung3HVHgdEV7Ti16Q==:117 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=HzLeVaNsDn8A:10 a=NgoYpvdbvlAA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22 a=VwQbUJbxAAAA:8
 a=r_1tXGB3AAAA:8 a=oMvHSNFekeyb0WZBGm8A:9 a=QEXdDO2ut3YA:10
 a=t8nPyN_e6usw4ciXM-Pk:22
X-Proofpoint-ORIG-GUID: D7JcixMmrdwXb2C6HHE28Kw7m_PuP6q9
X-Proofpoint-GUID: D7JcixMmrdwXb2C6HHE28Kw7m_PuP6q9
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
X-Spamd-Result: default: False [-1.21 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	MIME_BASE64_TEXT_BOGUS(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[imgtec.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177];
	R_DKIM_ALLOW(-0.20)[imgtec.com:s=dk201812,IMGTecCRM.onmicrosoft.com:s=selector2-IMGTecCRM-onmicrosoft-com];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:Matt.Coster@imgtec.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:airlied@gmail.com,m:tzimmermann@suse.de,m:simona@ffwll.ch,m:stable@vger.kernel.org,m:Brajesh.Gupta@imgtec.com,m:Alexandru.Dadu@imgtec.com,m:Simon.Perretta@imgtec.com,m:Alessio.Belle@imgtec.com,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[imgtec.com,linux.intel.com,kernel.org,gmail.com,suse.de,ffwll.ch];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	FORGED_SENDER(0.00)[Frank.Binns@imgtec.com,dri-devel-bounces@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	FROM_NEQ_ENVFROM(0.00)[Frank.Binns@imgtec.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[imgtec.com:+,IMGTecCRM.onmicrosoft.com:+];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,imgtec.com:mid,imgtec.com:dkim,imgtec.com:email]
X-Rspamd-Queue-Id: 100F8119ABE
X-Rspamd-Action: no action

T24gRnJpLCAyMDI2LTAyLTA2IGF0IDA5OjU5ICswMDAwLCBNYXR0IENvc3RlciB3cm90ZToNCj4g
UmVtb3ZlIGEgc3B1cmlvdXMgMnggbXVsdGlwbGllciBmcm9tIHRoaXMgZGVmIHdoaWNoIGNhbiBj
YXVzZSBpbnN0YWJpbGl0eQ0KPiBpbiBsYXJnZXIgY29tcHV0ZSB3b3JrbG9hZHMgb24gaGFyZHdh
cmUgd2l0aCBlbmhhbmNlbWVudCAzODAyMCBwcmVzZW50Lg0KPiANCj4gRml4ZXM6IGI0MWFlNDk1
MjA3ZSAoImRybS9pbWFnaW5hdGlvbjogQWRkIEdQVSByZWdpc3RlciBoZWFkZXJzIikNCj4gQ2M6
IHN0YWJsZUB2Z2VyLmtlcm5lbC5vcmcNCj4gU3VnZ2VzdGVkLWJ5OiBTaW1vbiBQZXJyZXR0YSA8
c2ltb24ucGVycmV0dGFAaW1ndGVjLmNvbT4NCj4gU2lnbmVkLW9mZi1ieTogTWF0dCBDb3N0ZXIg
PG1hdHQuY29zdGVyQGltZ3RlYy5jb20+DQoNClJldmlld2VkLWJ5OiBGcmFuayBCaW5ucyA8ZnJh
bmsuYmlubnNAaW1ndGVjLmNvbT4NCg0KPiAtLS0NCj4gIGRyaXZlcnMvZ3B1L2RybS9pbWFnaW5h
dGlvbi9wdnJfcm9ndWVfZGVmcy5oIHwgMiArLQ0KPiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0
aW9uKCspLCAxIGRlbGV0aW9uKC0pDQo+IA0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJt
L2ltYWdpbmF0aW9uL3B2cl9yb2d1ZV9kZWZzLmggYi9kcml2ZXJzL2dwdS9kcm0vaW1hZ2luYXRp
b24vcHZyX3JvZ3VlX2RlZnMuaA0KPiBpbmRleCA5MzJiMDE2ODYwMDguLjFmZGUzYmU0M2FmZSAx
MDA2NDQNCj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2ltYWdpbmF0aW9uL3B2cl9yb2d1ZV9kZWZz
LmgNCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2ltYWdpbmF0aW9uL3B2cl9yb2d1ZV9kZWZzLmgN
Cj4gQEAgLTExNCw3ICsxMTQsNyBAQA0KPiAgCVJPR1VFX0NSX0ZXQ09SRV9BRERSX1JFTUFQX0NP
TkZJRzBfQ0JBU0VfQ0xSTVNLDQo+ICAjZGVmaW5lIEZXQ09SRV9BRERSX1JFTUFQX0NPTkZJRzBf
U0laRV9BTElHTlNISUZUICgxMlUpDQo+ICANCj4gLSNkZWZpbmUgUk9HVUVfTUFYX0NPTVBVVEVf
U0hBUkVEX1JFR0lTVEVSUyAoMiAqIDEwMjQpDQo+ICsjZGVmaW5lIFJPR1VFX01BWF9DT01QVVRF
X1NIQVJFRF9SRUdJU1RFUlMgMTAyNA0KPiAgI2RlZmluZSBST0dVRV9NQVhfVkVSVEVYX1NIQVJF
RF9SRUdJU1RFUlMgMTAyNA0KPiAgI2RlZmluZSBST0dVRV9NQVhfUElYRUxfU0hBUkVEX1JFR0lT
VEVSUyAxMDI0DQo+ICAjZGVmaW5lIFJPR1VFX0NTUk1fTElORV9TSVpFX0lOX0RXT1JEUyAoNjQg
KiA0ICogNCkNCj4gDQo+IC0tLQ0KPiBiYXNlLWNvbW1pdDogNTAyM2NhODBmOTU4OTI5NWNiNjA3
MzUwMTZlMzlmYzVjYzcxNDI0Mw0KPiBjaGFuZ2UtaWQ6IDIwMjYwMTMwLXJvZ3VlLW1heC1jb21w
dXRlLXNoYXJlZC1yZWdpc3RlcnMtZmZmZTFlNzE0NzczDQo+IA0K
