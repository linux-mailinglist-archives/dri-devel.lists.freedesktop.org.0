Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 51F65A3BC79
	for <lists+dri-devel@lfdr.de>; Wed, 19 Feb 2025 12:12:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 148F810E27A;
	Wed, 19 Feb 2025 11:12:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=imgtec.com header.i=@imgtec.com header.b="anZAHNUL";
	dkim=pass (1024-bit key; unprotected) header.d=IMGTecCRM.onmicrosoft.com header.i=@IMGTecCRM.onmicrosoft.com header.b="N2E/AwTF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx08-00376f01.pphosted.com (mx08-00376f01.pphosted.com
 [91.207.212.86])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA64B10E27A
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Feb 2025 11:12:39 +0000 (UTC)
Received: from pps.filterd (m0168888.ppops.net [127.0.0.1])
 by mx08-00376f01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51JAnNEv000301;
 Wed, 19 Feb 2025 11:12:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=imgtec.com; h=cc
 :content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=dk201812; bh=ixVwsR4uv5NdL/BBp9gDuN+2/
 Jf6oyNV6Sm6VzNW1zI=; b=anZAHNUL8ZcPDqV+LSRbd3TFowfWVpk44ty9jMHUM
 C6o/N7TPjGY94ytSF7b5ZPl0hf8rH/OB2ncirVmNR2Tn/hu3cBUI05py1UlJUqeu
 YDWPpz2JXvjAXU6ym8orjnJyy8ueanXFvayS3LeUexix0yKjjjX+jgAP7kJ1zWmI
 Co1mGHFU/cdoFFrh9Z/B7CKNtaTwbmDN/Rj6P11APeWPya9ao+5l/LBKoXjEzIZA
 EvuCmPFY+EScDj9AkpHWij19WVMX2PpNJGHPBdguW6sQBvlsfhfITr1pnuXDIglo
 Z89AF0w3K4+P7Nlcd0CKM74CJaOve6l1Tgv5qBxkULo3Q==
Received: from lo2p265cu024.outbound.protection.outlook.com
 (mail-uksouthazlp17011031.outbound.protection.outlook.com [40.93.67.31])
 by mx08-00376f01.pphosted.com (PPS) with ESMTPS id 44w4c9rah4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 19 Feb 2025 11:12:21 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wL83/wHakx1eRMEwIR3sQTziUt5QzwGRaBywNKGynDqdUkUsHB3hmd14BCZuZ34zVndZfe5XzU1ziqpZFiqCq+j4i2NFIwe+jqCvZ2eNcIRFt5mIyHJlb6VVxi2JREuwkn/c2jwtv7DUXM22w3jkp+00kglwAfSQyvbWfZVqegw1oNpVQKikEZo9/LeuCaTfbWjHd2+8/4ATziKYsyNpREtNF/SXwBqxIhr5QEBa7EczpwLkINzOmOikol+/9P1UPi7++vu7cC/nuNGTqzuh+xjevbbMGxZ9RSBT0+y0lb6ePo8Vj8cOtC251itSi3v/BdlU6JmUHWCTuBtIGWPqRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ixVwsR4uv5NdL/BBp9gDuN+2/Jf6oyNV6Sm6VzNW1zI=;
 b=kXCG6vjPi4FU8N5BRU3EzTLXdO1aUJNl9mqPCIkDDRwB2xXzBTXD14oSoavOeFL2l+gQ0v+y4RKNIx83/8Atl9Szn8kpc9T7pK3gevpAuYkMcfz69lIg3OctHtpEaX/ynZ1BqPq2x6jGHXHthTtYBlhZ9N+BkfXYtOIiL5NQF4G5nQcHPHQLAHP6A/+/wsrT5s1OqyKO4qESuc1AmH9BxGt7ijyLAP7rMTHpeICdi4WxkFYgQ6KrQPNOyGe7Sg8c4ye8q0ufnJkJJVr97r6mfrsC8I2bhQnaIEYE1COcmM3wEwFeXcWP+YHh2JeD6DiTd8qoaEU/x4Rp6ZPruaTLMQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=imgtec.com; dmarc=pass action=none header.from=imgtec.com;
 dkim=pass header.d=imgtec.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=IMGTecCRM.onmicrosoft.com; s=selector2-IMGTecCRM-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ixVwsR4uv5NdL/BBp9gDuN+2/Jf6oyNV6Sm6VzNW1zI=;
 b=N2E/AwTFU2XCfCYigndn4aZlU2i35kzpr0jKtdWaTREvxyisZmre447tOSnH7WqQaUIL0k14voVUhc0zt5jxUxxl7zTPMcmscTgxidTR+BVunaRUgk288rFCw7tCZkfOZ7LE7RLdUfbQwvbEv9eP6h8PeQoMqG3Cjc6JMMrQxqY=
Received: from CWXP265MB3397.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:e7::8) by
 LO4P265MB6635.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:2f6::13) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8445.19; Wed, 19 Feb 2025 11:12:19 +0000
Received: from CWXP265MB3397.GBRP265.PROD.OUTLOOK.COM
 ([fe80::8e9d:6b2f:9881:1e15]) by CWXP265MB3397.GBRP265.PROD.OUTLOOK.COM
 ([fe80::8e9d:6b2f:9881:1e15%7]) with mapi id 15.20.8466.013; Wed, 19 Feb 2025
 11:12:19 +0000
From: Matt Coster <Matt.Coster@imgtec.com>
To: Masahiro Yamada <masahiroy@kernel.org>
CC: Frank Binns <Frank.Binns@imgtec.com>, David Airlie <airlied@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Simona Vetter <simona@ffwll.ch>, Thomas Zimmermann
 <tzimmermann@suse.de>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] drm/imagination: remove unnecessary header include path
Thread-Topic: [PATCH] drm/imagination: remove unnecessary header include path
Thread-Index: AQHbe6XqBmDfaU+Kdk6mPq/BnbQ1W7NOhvuA
Date: Wed, 19 Feb 2025 11:12:19 +0000
Message-ID: <ba1cf682-87f0-4a95-a829-08764dad7c68@imgtec.com>
References: <20250210102352.1517115-1-masahiroy@kernel.org>
In-Reply-To: <20250210102352.1517115-1-masahiroy@kernel.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CWXP265MB3397:EE_|LO4P265MB6635:EE_
x-ms-office365-filtering-correlation-id: 427cd9e0-80ca-4582-f13a-08dd50d646a8
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|366016|1800799024|4053099003|38070700018; 
x-microsoft-antispam-message-info: =?utf-8?B?Zm12aDNlekVaL1VVaWNHNjBNS3lLbzBmd1ZHdXRxL2xlNHdwM0ZZeVQ0TU1s?=
 =?utf-8?B?bEU5UGpPR0VISmdnRjZvRTl0dTdvQ2c4NUNOWTRsejh0VjN6VTcxVHBBbmZu?=
 =?utf-8?B?Y29zK2JMYVI4OXhacGlBSlk3dHYrMWlydmsrOGdBeFVXN0RnQ3l1QVZqeTY0?=
 =?utf-8?B?cDh3aGVKek9mb0ZlSExpUEozWkM2aFFvcEVPdWphaUhoQ01QQjA2THRpUmxw?=
 =?utf-8?B?eVZUdTVneUU3cFZjTm96TnVnUHJUK01NREoxTmY3NmxPYzBSOE41UFNVVWxu?=
 =?utf-8?B?Y0FrMy81aW1POTluL1ljMTJwSkRHU0piSTN1cFRTcEg3SHRvMUk0Z1BNWmF0?=
 =?utf-8?B?WEJDQW52V1VCRWpGanV5dW02MXlJeEZDa0xXS2VJSFkxeDAvY3NiT0xDS1pB?=
 =?utf-8?B?bTQ2U0pQamtzL2p0Z0swbWpCU2dXempyTjNNVW5hZGR1bmo2czNMbWUzaTIr?=
 =?utf-8?B?OVd2SSs2enJLTVlSRHpJc2ZXSm1RV3B5SHlZL2VpeHdhUG9GR0VWcEkrQTlo?=
 =?utf-8?B?ZGhVUjdUV010ekgrWXZoSWM2ckUrTVNrTzd0M0RJY3Zsc3ovdm9wNnNPTmR6?=
 =?utf-8?B?OGlHRjJyRU9DSGxaWGdqeEh2a1hyRGU1RVVGY2QzcytjZmZlcDk5S3Vvcngw?=
 =?utf-8?B?bHhPc040TWl0U3JacXpSUnJTU2xrSjM5VXNFY2g4RlNwNzN4dk10ak9EYmF6?=
 =?utf-8?B?OHVQNHhONDF2aGx1TnVERGxVTDcxRTZPVlE5MDBjODRWWkhxTzk4S0hETEYz?=
 =?utf-8?B?Q0UvM3o2bFVHcXpvS0gyZ2JDcStad0lqMzhZVGVMMjNWNkszdm02OEN3RGJP?=
 =?utf-8?B?NC9uenNZQ0EyUm0rU0VZeStWYXplbjZjVTFvQUhoMXJUUG0rUXdQZHBQUkUv?=
 =?utf-8?B?Qm1lM01tNUNHbXJsNmUyTlBwQ04wbVlsVmVNRkV4clpuakpWRjZXRThCU1dZ?=
 =?utf-8?B?a2w5WlF4dytWdUd0blBSRzc4TWx5R2M5MVZHUjNiQTJQTFo4YXNyQUZ0eEZ4?=
 =?utf-8?B?QTRnQXNlWEd6cDIxdjdwQ3NnTmxrdm96bE4wR3ExQzUvNWlJclRMaFgyaitO?=
 =?utf-8?B?WENVUlhmamtsVDZleFJQZDkwWFhrQ1F6WEgxeXdBU1kzQnhkRXY1RzJFbkRH?=
 =?utf-8?B?TWNhR3g5WXZ6WEpzeVR5YzluYkhZKzhLSm1YVkV3VUdYaVdXKzJGcGpWb2tj?=
 =?utf-8?B?elUzZjhpYUhQS1kvZmpXV3B0T3BYMnJZRWptbFBqSzJTbWJuQXBINUNaMGhK?=
 =?utf-8?B?dU5uOXZyUjd1VmJyQjRvYjZrSnRuVlM5c3RJTHFDM25pREdWcjliU3BJNTA5?=
 =?utf-8?B?d0lqb0k4MTlIM2VKMFlKK05lbVZMR0pZTXIzWkNXVDNRVHNqKzdCMDIzMWs3?=
 =?utf-8?B?RWFEN0lkbUdCUFFGL1A1cU1zckExd3lIYjhWR3pTT2kxaXhEanU5dTR0QUFL?=
 =?utf-8?B?ektUSDI5WXF1NExxUGFRTEtDWTRoeUFMZ2lIeTN0QzN1bUhLUVQ5Y3YrTjRp?=
 =?utf-8?B?eHl0TGNHaU0rMDdXMEp2V1RhMFdyZ3Z0Q1pGWTczdVJQN05wcytkWnl0cjlF?=
 =?utf-8?B?M1BlczN1NlpiYmxrQmErNkM0TU5TZy9WdWl2TnRyd0s0Mkszbk5tNFlnL0lP?=
 =?utf-8?B?Vm81ZWxXb1NjQmJ0WVRuamk2WStuWm5oSUVIdlN5SnplWDJRblp0NmQvSTNy?=
 =?utf-8?B?eUQvdjhOTGUyMGgyNTdzYjVtREx5Um9RbXM2aVF1OWl4UmNydXpmQXNyY0hH?=
 =?utf-8?B?N1lTdHNMcGVkczZnYXVKQ3JzQStxOE5HN1dYenBMK1ZuRUFLaTNXRlFqeDVo?=
 =?utf-8?B?eVN2WmppZ2xKT3hVMmd1NzhlWmN5MnhtNUVKbGsxblk1eVh3OVhheUhGdXg5?=
 =?utf-8?B?NU5GcWYwR3pEQkJlRGY0em42NWl0VitXNlJIangxOEJ2ME03dUx4RlI3RFVT?=
 =?utf-8?Q?1NbdETc6dqM8/KZI//0d7ZrL5zfOqqwU?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CWXP265MB3397.GBRP265.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(4053099003)(38070700018); DIR:OUT;
 SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?MlFIblE0ZWduWVhjNXZJbWdsSlN6Rkg1aC9vd0J0c1o1MXlDLzVKL3ZpRUR3?=
 =?utf-8?B?MWZVcXpCeDFwR1ZvUTNqblVwcEZkQ1NIT255cHdPbWlVelg5R25jT1VZMG14?=
 =?utf-8?B?WjlNRTNFVkpUaWZLbFNRcFZPMUxiZEpDSnN4V2tqVURkY09STGpOaXZpdDY3?=
 =?utf-8?B?WkRIaGZxbkhwdE8vZUJiTWEzQUNCZ29HSldBQlhidHZiSyswS1l4dm9DZDRm?=
 =?utf-8?B?Ukk5WklISlRWL1pDSDEyTWdaRWJGSjk2cVpHajJkOUVDc0pvSkVocythUjJF?=
 =?utf-8?B?QXlYNmZSRk9pOVFWbHpjT2s5bDhHMSt2NXR1cVc4aVpBTUpROFBYeWZGdzR3?=
 =?utf-8?B?a21odWFsR1VxY2pxSi9LdHQvVCtiZ0IyMGRIeVFjUkZLT3d6MFA0SHhvVm0r?=
 =?utf-8?B?M0pYRVBFdnZobnRpek5kUnpYd2xzWnFkbjFXVGxYVC9ZZGpBdzBPS0ljSkxl?=
 =?utf-8?B?V0E0RjI0RVJkTkZyUWVVTkE1a1JYcTNaS2Nkc2V2SHdnalp3UVhuSmpRV2cz?=
 =?utf-8?B?ZVhabmwrNEhDMWxZalVGd0tTYWpSam13WWxWV2tuSC9zcG1iZ0kweXZYTFRF?=
 =?utf-8?B?a1JrTE5CdVlGbkc0MlhPMS8yZHYrdjNJSWFFanhxWVlNUXNwdi8wZDlBblZz?=
 =?utf-8?B?WFZNWUd5Yks1VFFWUUVOeXI1SGlCQTNtR1hZME5UY25WVHB3VDY3VWZlVmxE?=
 =?utf-8?B?OG5ybkN3d0JLTStaT2l6NWNLdXNjeXJMVUhpYmVpcVZweG05TlNROEkwT1o0?=
 =?utf-8?B?ek80WGt3aUF2MlZoWmhZMm9pcVQxSDZXWWtKN1RCaWd6ZTdxTmdQMG9UUUJn?=
 =?utf-8?B?emQ0ZGNJRERUenN1V2tFaW9zQmJHMi9IK0hzTW1oUThJdCtjYXkxS0Z1N2NE?=
 =?utf-8?B?dEJoRlNka0FneHJ1WGtiUFRSdDdMQUdac0lnYnlIeVpmZDRxVEVxbjN0OTlW?=
 =?utf-8?B?Z1BYdjMwOHRVSjhtSTVGeVd6YW9zNXMrSXBWY1g0UlltU2M1dFNpeEEyR011?=
 =?utf-8?B?d2hRd3lxYkVrWS9Nc0tOY0FPRHZsa2hNelFIOERpWXI5VjJaQ0FtelhSWHFi?=
 =?utf-8?B?dzJTU2pTL1ZIN0pJczJZa0dDN01JSWRmU2lxMW5uWkxRRnpabXkwOWpaUTVt?=
 =?utf-8?B?MWtGeUZiUjFnbzJ0a0g2Vnd3c29XRUhHUGFOK1hubTFzZEtmOVhsRUJwNkRZ?=
 =?utf-8?B?ZEdUWHdtYTlnVmVUblZhMExrV1lUVkQwVlhRQ1dQdWJYaE1DdlNCVEJUY3RB?=
 =?utf-8?B?ZThUL2FlU21vY1dwZU43alhXSWViYVhiWnp4RUZ5a1lMWlBsUkRlNitIaGY3?=
 =?utf-8?B?WklTWDdlZ3FrMmJ2bkZRN0p1TEg1NHVaRjBGYTcyVWwwMEVRTUJFelY1cWdj?=
 =?utf-8?B?VmtBVHcwQ0tiMzlRZW8ybWJvbGQ1RXpranBLZnRZVVNPQmFNcVY3UFRMaGVF?=
 =?utf-8?B?LzNSTzNON1lSK05ucC9GeEZaM3BKS1VWSTN6NEw0SWtMNjZ5VFRuQmFJMzBr?=
 =?utf-8?B?WWU1dnljQXpacnNidzEvaEZmemw5T25kVm5XaGxhSFI4OTBKYVBVQ0NFa2JJ?=
 =?utf-8?B?eEdidlc0MmRJWkQ1Zm90L0I0OUtTSDAxY05zTUEvUjExbCt3RUU2TW9ieGxn?=
 =?utf-8?B?WFpGeVdqNW9YZmhPWlh1dmF2YWUrdnlrSUNNcmZYNjBHZC9HcVVRTnJLZFZG?=
 =?utf-8?B?NlVqN1hxVjU5Nm11TkJCZ2ZWNHNWVkcvM1VpNGo2UHFxLzlFM0p2OHVOZXpw?=
 =?utf-8?B?TmExWEJoOWtEbXV1RlRFMURKUDd5ZTRaT1p4SFNTeVVPTnVLSnlhaE1xUklE?=
 =?utf-8?B?bUdkNE9uYjdLZG4wZTQ4VlpIUDBKM3FwdjIwRWRqY1pxVlhGcndPZWhnc0hI?=
 =?utf-8?B?TGQ3NEthOHJNWk9MTExRbTdLY09hOU1YbGVCNW1pT2ZpSk84Y1dDU0JhSlBz?=
 =?utf-8?B?K1ladXp2OExlRzRxSm9wV1ZqbElJQUlGcUE5RkNkeEcremIvY3JvSmlDYnBt?=
 =?utf-8?B?V3JyenRTQTloYXpwY1FTQ3F3a2lWQis5UW15WlNVRFFyaFNaNFpFbFBIeGhi?=
 =?utf-8?B?OE5sNkkxSllUMmZTNFhqcnA2eWZpSjNjbFZQWTc0K3poNU1Ka3dkTGNMZ2N2?=
 =?utf-8?B?N1IzR0pId09RUHRCbzhYSFoxS3EzUWhXWTN0THdPTUh3Y3VTVzJrYzlLanUz?=
 =?utf-8?B?QlE9PQ==?=
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------bl34Z8oAgU3Z4N79HjP2ktAv"
MIME-Version: 1.0
X-OriginatorOrg: imgtec.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CWXP265MB3397.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 427cd9e0-80ca-4582-f13a-08dd50d646a8
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Feb 2025 11:12:19.5112 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 0d5fd8bb-e8c2-4e0a-8dd5-2c264f7140fe
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JVvOFsUPCqLj6Mp9pI7BMDeQ5ZtkwUUascdd3+cgxmjJAGfXrJzKwHQQGzZ0WWqE0R6wLrOZgbcCvpXrBA9BUQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO4P265MB6635
X-Proofpoint-GUID: Jhq_Axu_N4qRJt7HVDQWDc3VjO3LaCdE
X-Proofpoint-ORIG-GUID: Jhq_Axu_N4qRJt7HVDQWDc3VjO3LaCdE
X-Authority-Analysis: v=2.4 cv=U59oDfru c=1 sm=1 tr=0 ts=67b5bc96 cx=c_pps
 a=8AFXndYnQsE2+LUeOUhaNQ==:117 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=T2h4t0Lz3GQA:10
 a=WnR_qW7rlZcA:10 a=NgoYpvdbvlAA:10
 a=VwQbUJbxAAAA:8 a=r_1tXGB3AAAA:8 a=I8P48JU3W84_1xkU_o4A:9 a=QEXdDO2ut3YA:10
 a=8MhQR4WxyVGciBG807IA:9 a=FfaGCDsud1wA:10 a=t8nPyN_e6usw4ciXM-Pk:22
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

--------------bl34Z8oAgU3Z4N79HjP2ktAv
Content-Type: multipart/mixed; boundary="------------mIC7kVkEj0sLOLoDT51bWhTC";
 protected-headers="v1"
From: Matt Coster <matt.coster@imgtec.com>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: Frank Binns <frank.binns@imgtec.com>, David Airlie <airlied@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Simona Vetter <simona@ffwll.ch>,
 Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Message-ID: <ba1cf682-87f0-4a95-a829-08764dad7c68@imgtec.com>
Subject: Re: [PATCH] drm/imagination: remove unnecessary header include path
References: <20250210102352.1517115-1-masahiroy@kernel.org>
In-Reply-To: <20250210102352.1517115-1-masahiroy@kernel.org>

--------------mIC7kVkEj0sLOLoDT51bWhTC
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 10/02/2025 10:23, Masahiro Yamada wrote:
> drivers/gpu/drm/imagination/ includes local headers with the double-quo=
te
> form (#include "...").
>=20
> Hence, the header search path addition is unneeded.
>=20
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>

Hi Masahiro,

Thanks for this, it's:

Reviewed-by: Matt Coster <matt.coster@imgtec.com>

If no one has any objections, I'll take this by the drm tree later
today.

Cheers,
Matt

> ---
>=20
>  drivers/gpu/drm/imagination/Makefile | 2 --
>  1 file changed, 2 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/imagination/Makefile b/drivers/gpu/drm/ima=
gination/Makefile
> index 9bc6a3884c22..3d9d4d40fb80 100644
> --- a/drivers/gpu/drm/imagination/Makefile
> +++ b/drivers/gpu/drm/imagination/Makefile
> @@ -1,8 +1,6 @@
>  # SPDX-License-Identifier: GPL-2.0-only OR MIT
>  # Copyright (c) 2023 Imagination Technologies Ltd.
> =20
> -subdir-ccflags-y :=3D -I$(src)
> -
>  powervr-y :=3D \
>  	pvr_ccb.o \
>  	pvr_cccb.o \

--=20
Matt Coster
E: matt.coster@imgtec.com

--------------mIC7kVkEj0sLOLoDT51bWhTC--

--------------bl34Z8oAgU3Z4N79HjP2ktAv
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wnsEABYIACMWIQS4qDmoJvwmKhjY+nN5vBnz2d5qsAUCZ7W8kwUDAAAAAAAKCRB5vBnz2d5qsN8c
AP90tjsQfp8XN7v25wI67LNaUsDqL4T1I5ih1jcNdViJxwD/R0H4Im73j556+Pyr2U48wLAkNnbH
xnApqjEy38IO8wI=
=iaUW
-----END PGP SIGNATURE-----

--------------bl34Z8oAgU3Z4N79HjP2ktAv--
