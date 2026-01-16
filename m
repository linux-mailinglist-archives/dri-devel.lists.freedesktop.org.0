Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BDAC7D332FA
	for <lists+dri-devel@lfdr.de>; Fri, 16 Jan 2026 16:29:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D817010E8C7;
	Fri, 16 Jan 2026 15:29:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=imgtec.com header.i=@imgtec.com header.b="vMCcM5KW";
	dkim=pass (1024-bit key; unprotected) header.d=IMGTecCRM.onmicrosoft.com header.i=@IMGTecCRM.onmicrosoft.com header.b="kx3iBrcg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 1262 seconds by postgrey-1.36 at gabe;
 Fri, 16 Jan 2026 15:29:55 UTC
Received: from mx08-00376f01.pphosted.com (mx08-00376f01.pphosted.com
 [91.207.212.86])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD4C010E8C7
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Jan 2026 15:29:55 +0000 (UTC)
Received: from pps.filterd (m0168888.ppops.net [127.0.0.1])
 by mx08-00376f01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 60G3QaUq2652121; Fri, 16 Jan 2026 15:08:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=imgtec.com; h=cc
 :content-id:content-transfer-encoding:content-type:date:from
 :in-reply-to:message-id:mime-version:references:subject:to; s=
 dk201812; bh=QrTMFcy4Yq9HJboZu5aadtaDs1DIgbYmQq+HQk6UjvQ=; b=vMC
 cM5KWJbpcYTsX9RLKhEH35QdrWRozIgURgOpvBnyyJ3Ruyv/DyK2uQWfv/JiYkEH
 PiRSJ1awbyrQ+YEeP6a7XfwWVfvmLUkAe3BY1WmDGS2Hb657c6AgZLVHx6D9xjof
 QMOmmpB/D0RJFdxQGyaib4kqR3zpFDhhfPHevvC2SMDDYIOUpC6ZTJHfPsZzTBGQ
 fO9y/3deSF5LnMiDBbwk6n7AbPl6bP0bkYqtaU4jRToOGY5EdQPv1fqHYxpSp/BQ
 2v/XIOIp6d+PSPJC9Ly/YPzXS6UJg8zGUMVVo/Qxr/ka4n0POPNgPbT533fXp4hh
 ROpB8qOCIkkMPkdTj+g==
Received: from cwxp265cu009.outbound.protection.outlook.com
 (mail-ukwestazon11021096.outbound.protection.outlook.com [52.101.100.96])
 by mx08-00376f01.pphosted.com (PPS) with ESMTPS id 4bqdbhrc08-1
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
 Fri, 16 Jan 2026 15:08:45 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ID9IWy0rsgD/1AZjUJ5L/DUTxasw78YF3GyCfHMIH6autNlfoFEto2WRYGBdqUABTPDgiSHgLYxXEWseahbIgAUOfDq3WOnWv4IE8/ROsbidokJVFVmFOHalrSSyfw3w+v6jyKpFge4edyw5v/EpyPE2RShMd7gYhUxXrnUD5fV7URXDJFD7VQOV8ZPi2a6jJ6kxdP1nZmH+YywbiQkfUhiD85M+RS9ST+W0n9D6fVdGHQnHQhk7SbIa47MAx3O7aLgu4Hmx5cCcx9jX37t91Yikq/Fg1whvLfh+4L+tLnnRLWwH/71XLWJPKkprKuCRnoqTRYI9UWrlVyIOWZVxTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QrTMFcy4Yq9HJboZu5aadtaDs1DIgbYmQq+HQk6UjvQ=;
 b=HLWtqGsYedmH4v2zfEY+sVigW24Yz4bG/5yzqWbJub4zUVqGPTx5sv9mZvdYesZLZfUFQAUalqHvuxRjBfdHo3L566YGG10eRIkNejDNcY7HaDwpvSzRgYIevrTzHEw6nNDmSvv/qAUHAWdXRO6ti948Se4SvuR2RVMPgZsyzP/W82GT60dnwuV6vXTKySzOQC1KFZb6L/n8N6ptZcHRipQ68jTxinlzNAfdp4bG4T9KJP+85/K4Rq+StOHNjzO/Wr4pmj453pjhIQ5DpLiZJP+uyj8oMGfvTdW+kFftT1WSDfrLSftOG3souXN8z8NnWK3/1qxIidSqVVgCzxdERA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=imgtec.com; dmarc=pass action=none header.from=imgtec.com;
 dkim=pass header.d=imgtec.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=IMGTecCRM.onmicrosoft.com; s=selector2-IMGTecCRM-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QrTMFcy4Yq9HJboZu5aadtaDs1DIgbYmQq+HQk6UjvQ=;
 b=kx3iBrcgMMVE4AvJUZi1fcfwYVK/oLtbVDpmC8b1bJyqGNtpNpey+lcB/Xdaw+xxvRZFHoZ9mYCUdvCfSqw2I04ejYVbs0YLU2+Pt6LEuXIE1O2Vk2c9bqjiJc2kBl2Rqc5KaK1Ozo2YHQ1UCXRd1BUOcJoKSM9TxrE71YQStZc=
Received: from CW1P265MB8420.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:26f::6)
 by LOAP265MB8435.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:473::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.6; Fri, 16 Jan
 2026 15:08:43 +0000
Received: from CW1P265MB8420.GBRP265.PROD.OUTLOOK.COM
 ([fe80::da2d:5f9f:8410:37bf]) by CW1P265MB8420.GBRP265.PROD.OUTLOOK.COM
 ([fe80::da2d:5f9f:8410:37bf%3]) with mapi id 15.20.9520.005; Fri, 16 Jan 2026
 15:08:43 +0000
From: Alessio Belle <Alessio.Belle@imgtec.com>
To: Matt Coster <Matt.Coster@imgtec.com>
CC: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "tzimmermann@suse.de" <tzimmermann@suse.de>, "simona@ffwll.ch"
 <simona@ffwll.ch>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "airlied@gmail.com" <airlied@gmail.com>,
 Frank Binns <Frank.Binns@imgtec.com>, Brajesh Gupta
 <Brajesh.Gupta@imgtec.com>, "maarten.lankhorst@linux.intel.com"
 <maarten.lankhorst@linux.intel.com>, Alexandru Dadu
 <Alexandru.Dadu@imgtec.com>, "mripard@kernel.org" <mripard@kernel.org>
Subject: Re: [PATCH 0/6] drm/imagination: Introduce hardware support check
Thread-Topic: [PATCH 0/6] drm/imagination: Introduce hardware support check
Thread-Index: AQHchHXA4lWsy/Pj20y/Rms0rxrSzLVU6xUA
Date: Fri, 16 Jan 2026 15:08:42 +0000
Message-ID: <9c26d3ca38e46e76e1b2fa1b5eaa378b5b436fc3.camel@imgtec.com>
References: <20260113-device-support-info-v1-0-91e5db7f7294@imgtec.com>
In-Reply-To: <20260113-device-support-info-v1-0-91e5db7f7294@imgtec.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CW1P265MB8420:EE_|LOAP265MB8435:EE_
x-ms-office365-filtering-correlation-id: 796ba466-54c4-4709-ba35-08de55112359
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|1800799024|376014|366016|38070700021;
x-microsoft-antispam-message-info: =?utf-8?B?K29STTNKV1MrU2s1d0pENndOY1A4TjI0aEszcWRGamtoMWJITU13MUJ3TW11?=
 =?utf-8?B?bGhRYk5xVk5MaWdZV2dlNG56Nzd2bXB2WVVJOFM1NjhNUVE3aFo1TER0NUdJ?=
 =?utf-8?B?YWVINTJHb3NPd0VoKzYySno2TS9mOHJOYWs4clZpcExIaG5DUkxqanBNMnhk?=
 =?utf-8?B?djYwRE9VTjlqNDMrL0ZqVktlNHdneVZGYmJQcncrNUQwSUZldG53dUozV1Q0?=
 =?utf-8?B?Wk5SYjNNVXF5Y0RBdW9jVTU3RkhYSjU4Ui9SUlVMSXRGQXdTK0t4N3grVlpj?=
 =?utf-8?B?bFRhUWVVTEpLOEVmMVIwN1Znc1IzMHA4MCt0aWhodDFEMU5zOXh3ems5aUdC?=
 =?utf-8?B?NEM4cklHU1FzOXBzWmVLVFg1RFhaQ3pqczhORFJESkZJYTlhTmdYNDFZblNh?=
 =?utf-8?B?YzZFUmZ2SXlmK0ZDb2NKSHlzRlFhQUh1cnIzaHpRWkVtYlRkZmg2NUtBVkR2?=
 =?utf-8?B?U0JiRmE2NWx0MFJPZDdkQWhaS2YwQ2xlR0ZBaTZpUVBiZk1VQ25PNmZxMjFM?=
 =?utf-8?B?a0FjNWEyR2lodU9FalB3aFBjSnljb1dtY2dIQW0xT0tDZXpXNmNYZVJVdmVn?=
 =?utf-8?B?cjEyMnNOdE03bUsvcEtDaDdZYkc3dUd0blVpZkJWWkxkRFFVVlJTYjNlb1Y1?=
 =?utf-8?B?d1EwUXF5bnNmSE5YODhMZE5LQjJJNm4vYnU5RjgzbTlveU5DNlN4dGN2ZnhQ?=
 =?utf-8?B?Q3VaZTZkcnNwSUZNMWdXazA1dUZwMHNZQ3UvOGFXR3BLWDRzN0UxQWNCL1cy?=
 =?utf-8?B?ekJoLzJQV1dKZGhZSTRaL0ZzY3JaWUVaUGI4R0dwVUVObFk3V2pxNnF4ODBt?=
 =?utf-8?B?ajdSbktlSmtwUENXUURkbEpwb2ROK0V0SUxTendhU25PaGdYZERyMlRjVUJw?=
 =?utf-8?B?TWl1SWw4VFFFby9vb0thRXNveTdnbmhKcS9QV1d4b2grVGsraUxGTkVqZ2Ex?=
 =?utf-8?B?VHo2V1czVUxMcXhKMGpaOGlPUG9BbG9mMzVZT0pwSTY4UFhKM1U1dVZROEhQ?=
 =?utf-8?B?ZnpBZE5hM3NRa0tnTVhBZzNYNGlXZEc2MzF3N09RRlEza2U0dWZWK0lPbmRy?=
 =?utf-8?B?Q0hFQXpmNE5sK004aWVHVnhJZm1pZVQvcEVBK2lXbnRSY3VDeVhNSG9oeFJW?=
 =?utf-8?B?Uk9HdldHY1lmU1JFbDNMUkM0dW8ySVU5TUxrTXlYNS91U0NQUUt1TE45cXFB?=
 =?utf-8?B?VHBoalN4akdMbStzbEtDcEVINmdVYU44eE5uNDN0b0dwR1V5NFN4NjdhYzJo?=
 =?utf-8?B?NTV1Q3REV0ErQTh5MVJJN1JOR2RUSWlxZkVUeG04MEwrRmNReXZSNWI0aUY4?=
 =?utf-8?B?dG1VNHNBRnZxWDh2RjZYeTZFdkNLd0VFcEdBYW5CSlRtQUN3b2N0R1QzQWtW?=
 =?utf-8?B?cGZQTmo0SkNjYWpYY1UwZjJHNzJOa2VjelcwblovT29vWlZvdW5CSnhpUDVV?=
 =?utf-8?B?dUlqUXhPY2RnUHhMVjlxT2tjTXV1eU1HaDV5eXFyYnZ5b3dNOTZtNGwzMExM?=
 =?utf-8?B?eGhpcDNJRHhCTytRRlZDbW1KcWFpOWVMQVlSWE12VVMvcVVCbnVzYVhZMFJH?=
 =?utf-8?B?V3FyN3lnekorWWFscmlUWWdaTlNkbGJaZGh3a3pqZkNvV0YyNjZZWmkrRy9a?=
 =?utf-8?B?YU5PTWo5S2M1Y2tHT0VOYWdxb2NMRE0zY0tQSTg1SjhIRExOMjgvY3hyaVhx?=
 =?utf-8?B?ejRiOFZ5bStCd3pXVncxK2JBTlJrelZkRGwyV25oZXBnaVNDRWtHYmFYOGtz?=
 =?utf-8?B?ZXZieU5PZGIxaGhnK3Mwa2hCT3d5OU9jbEFKUTQzMDE4RXo4TU1YbHhlTU1V?=
 =?utf-8?B?ZDlUS0h4cDROUXVoSmgvdHloR3FVa0RXb3dXSzlFSWxrY1ozVUVPQWdwVVJH?=
 =?utf-8?B?QnJmNDAxbm9hRVFVS2hOYk9NRUQvc2llZnhGYjZvSHFXQ1FyWTNyaDJicHc1?=
 =?utf-8?B?a3lDSHFXM0t3Wkl6YktIb0pod1laNnZpZ0VVMzFXVTVJeHpDc3JQQ09tN2l0?=
 =?utf-8?B?Tkh6SEduZGorQ240SXBKaVVMSWh1Wkp3ME9DVXllcXFDTzNGcTI2c3k5Tlp6?=
 =?utf-8?B?TDU3M3U2SU9sS1R2TEF5dVdVTStNcXhJRnU5WmV3SWQ1TzhzQjR2TGd6akVE?=
 =?utf-8?B?SzBsZEQ1WUg0eDQxbVZhakluOTFUejRwRzlZTDdoeHBkakUzUGFlWExmOU9I?=
 =?utf-8?Q?UIRemAU9Nb7Bq8diAh16Isc=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CW1P265MB8420.GBRP265.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(38070700021); DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?cEFPU0RYVGlpR3Vhb0d1MTJrYTZQUE9RUGRrWE55bkJOTXdnMVk3TkJMdm5k?=
 =?utf-8?B?T1NvcDJUTUJENWVnTlFnYmZ2RlNJUUpBblBqam56c24zT2dmdUkzVVBuUmI0?=
 =?utf-8?B?VG1ENjVWTk5zZTAxbkova09IM0ZWRFM1UnhaVFdSKzFYTXVhR0tGK2NCemdk?=
 =?utf-8?B?UUVVK0toSUNURnE4TDJyR2FFVnlhOUcvdEVQR1ZZRVFlMGMrZUZIR2t0WjI3?=
 =?utf-8?B?eE1QWUJtMlJZc1k1ek1mS2JzNExKb04rOHc1a2l0Yit3T1RTY2hhTjJZZFU0?=
 =?utf-8?B?V0tZRGwrbHd1TGdnWk1SVUNGU2dnN2doZWhoZXhQRGtuSTZqa3hzVDhIWENS?=
 =?utf-8?B?Zm9yNlNWcXQrTmh1Q0pvUXJ5OGZlUmVSUk43bnZoNVlrWitZam1FeHNIM1Jp?=
 =?utf-8?B?citsb2kxckFKeGc5N3pGcExma0hjRGtTVW5qK3owOTlmT3hHLzExeU1VeitU?=
 =?utf-8?B?YmJnZndLZEdKWmtBdHRiMU5CekN0SThBYVV6UzNmT3BRME4wMUZOOU85amxN?=
 =?utf-8?B?MnppOHdQeWY0d25rTnNRL05Jcnd3MG1kY1diZmRleXU0NkpKM3E5a3hvb3V3?=
 =?utf-8?B?NGI1VWJSVVlCWGdsQjFaKzhUVm0yNTVPQTduTDE4Y1JZMlBJalAxWTM5cmJF?=
 =?utf-8?B?OVFXRG1MK3hoK3htYlpJQTRFeS9RT3l0TCtZOSthandxU2xaWThIRFlTY2Rp?=
 =?utf-8?B?ekJUVlRFalVtSmRnODkwcERLTUJ3YjhrUDY1RkZZOFltK1gvMklqR3FuZHBP?=
 =?utf-8?B?R1duSWRNaFpMNkh3Z1Q5ZWpTb3ZybkhId20ybHl0RVVFWHFrUFRjVS9nRElS?=
 =?utf-8?B?dHZIbjJ4QTByQmc4Zm1LSmtwLzBtcEZzdFFtd0F1WENSbGFhQ3Nwb0lUYXph?=
 =?utf-8?B?NlJIOUcxZ21UUU5mL29QVWE4akpRQjlJbFBXbHhxRGE0c3JOaDl6aXVlRnpj?=
 =?utf-8?B?dHp1NDNkWTMwUWw1djVrZXM1bVBBTjlrWnRtelZTZ2tYNExNUFJnMjNacSs1?=
 =?utf-8?B?NGVCV05aV3BySFZtTEJZRjdEYWVSdi9Qcm9vWG5wSkNFMjIwUFVJNkJOZito?=
 =?utf-8?B?T3YxeEVNVW55c2UraGRmdWhqeUN1bTF6ZWlSZU5zNUZGeE1ZQ2kyL1dWT1lP?=
 =?utf-8?B?S0U1dE9rOVJkK1B3NzVIRE9Pby9Wd2kwbExnUVpIekx2ZHJjNU85amI1cUpw?=
 =?utf-8?B?QWNUR2FBdVpOR0xHbDVZWCtYNWFSRkdLbitwWTVVRXA1ZmJCdzhDS29sdWUz?=
 =?utf-8?B?SWhEYW1JMmR5U01wODBQSzI3em4yVkhWZElrblNPNHZHd1lrYXVHMHVFS2Qy?=
 =?utf-8?B?WjhpcDhBQ1I3ZFJiWklRVVlOOXhTOTRqcms3RjU1YmFuQ1lSQ3hwN3VYWElK?=
 =?utf-8?B?S0U2cnRYdG9GdDB4bEkvTDRCWUEzd25ZY0RveEcrRFpQUjE0Nk5JdlJ1aFZt?=
 =?utf-8?B?bjBuaXNxK0JTNXNvWHQrRHZXQk90TFdGcU5rdWNLTjdjSk9xaVFjSWVxcEVK?=
 =?utf-8?B?TE9JeldQSnp2SGFzTTRIMytvUjBXRk1WR0ZQcTY3bVEraUh6eTdMS1YzbDRz?=
 =?utf-8?B?RlMwTEo0UEFsSVhsalVxaGx3OXB1bVNxbHI5TEVNNG1YcDR0T3pqcVQrQnFV?=
 =?utf-8?B?aTY5bndIVm12Rit0VzBBNytqaHRFNUhtaUR6Wlc3ZnBQNGNwYkpUeHlpakRn?=
 =?utf-8?B?R3VIazVVOERZUmtJOGlMT01OZ1ZsRURMSjZva3kzWHhwNGhrTXJZVHR3RjFj?=
 =?utf-8?B?MTJWZ3FEUGJyT1lNTWwydDBsOHJISCtReVFJRlNTUkU0T042Z2Z2c3ZlNlhP?=
 =?utf-8?B?UWYvMU5GTnBlNkNkMUhnSi9WK3c3WXdiZVlqcFpKWDF0R1lGc3RQbmZZTWZp?=
 =?utf-8?B?dHlGbTNmekJaeXFUK2xmczM3OCt0dUlKTW1FZGF6UE1sVjdBREtQU0hiblFX?=
 =?utf-8?B?R2liM2xxM1phRGJZZ3c3c2p5ZVlHYzVHWFRVRjZ4NlFTYVNEdk1VRFR0YkpF?=
 =?utf-8?B?bSt1bWIrR1YyNTV0WjNqZzJQUlo2eE0zWDNkdktPM3VBS3ZpVUc5VGVyTSto?=
 =?utf-8?B?dUtUS2kvWEx5bGtWVUhzL1Q1NnhzOGVrOEdQSE1ONmk2VkhqV0pGTXIvekFz?=
 =?utf-8?B?eDI3eG05WERTTGdqZU93VFA5Yzhna0hxaHVKUHJMV2RXVEhkMktGNmtKcm5r?=
 =?utf-8?B?UjBVWnhHOXArMFNLUnYyYTJoejlCY3RqZ3k0c1dBMklMU0wySTlqTlRvZGRm?=
 =?utf-8?B?emVSUzNSMUcva2dVWXNKRlhMVWtkZVNKc1hOaUVHZ2V1QnR0R2NqS1M1cUFP?=
 =?utf-8?B?bVZENHBGUXpjSnVvNEYycEx3OUZOSGlRS2RYaHpJcitTNTVoaFN4NXRRbko1?=
 =?utf-8?Q?FtdRbMcTSS37RRZI=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <422FECA58ACE8640B1CB941B853A2982@GBRP265.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: imgtec.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CW1P265MB8420.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 796ba466-54c4-4709-ba35-08de55112359
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Jan 2026 15:08:42.8677 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 0d5fd8bb-e8c2-4e0a-8dd5-2c264f7140fe
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: CXAv8/nJ2qBGs+tMf8UOqgO0lRCUDC5MTFb1e0XvyEsAp2l9/QTussuI7APjN6s3UsIlrdlrnR2Pwl/8Qgh9zc831CmRVOPpj+0B4viYmNc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LOAP265MB8435
X-Proofpoint-GUID: jaI_2eOQYgHqx8S8vHs2QSXFDMtQwtWe
X-Proofpoint-ORIG-GUID: jaI_2eOQYgHqx8S8vHs2QSXFDMtQwtWe
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE2MDEwOCBTYWx0ZWRfX5YlNGeK9hxWo
 aUFVzjLEBQzrLPGrDQ0KJLcDCQFCTHqBCzudWSCoHn9rK2v1VC0+9n5voJhLSQ56nKO91uAcPe7
 pulJslSH5S4yCObZtFee4dU7jBXJopooLbupTmZi3B2yV8crttHtJetl9727oj5G9zLXjs1iyYb
 Yqn8B/DsazCAxekrrUGQrGAKSdv+ZeQtidf/6qAii6Bu+Leo1CiDLYsllJaBfLVa+elratBXTbM
 ha8x0ISZi6AyDP9OPjFCsWbokyOo/ULZKc6V1cTeXE3prni2XgVz79OvfOCGCdYWc38fn5+ijaA
 JL5s41ZC+yyVYF/9YRdlw3mKpSN2/UIlvQBnBsEkNTY1cVZsmYKmYyCw0WWZ3JUppCp/FG223me
 OpwQKUtgFkBQxmDCSgZnNdfbJyEx1Ljv24eYar9R2w7UWmy+0M7VfmdBSaVSsD6/B11NKZb0Pxi
 I4kly7nJmuKyTDfxoqw==
X-Authority-Analysis: v=2.4 cv=QMNlhwLL c=1 sm=1 tr=0 ts=696a547d cx=c_pps
 a=z93KPgTTzgdiAXMNrQJZ4w==:117 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=NgoYpvdbvlAA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=r_1tXGB3AAAA:8 a=E2YO3_7fdiK0WpENi_UA:9 a=QEXdDO2ut3YA:10
 a=t8nPyN_e6usw4ciXM-Pk:22
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

T24gVHVlLCAyMDI2LTAxLTEzIGF0IDEwOjE2ICswMDAwLCBNYXR0IENvc3RlciB3cm90ZToNCj4g
V2UncmUgc2VlaW5nIGFuIGluZmx1eCBvZiBjb250cmlidXRpb25zIHRvIGFkZCBzdXBwb3J0IGZv
ciBsb3RzIG9mDQo+IGRpZmZlcmVudCBoYXJkd2FyZSBjb250YWluaW5nIEltYWdpbmF0aW9uIEdQ
VXMsIGFuZCBmb3IgdGhhdCB3ZSdyZQ0KPiBpbmNyZWRpYmx5IGdyYXRlZnVsLg0KPiANCj4gT3V0
IG9mIGFuIGFidW5kYW5jZSBvZiBjYXV0aW9uLCBsZXQncyBtYXJrIGFueXRoaW5nIHdpdGggaW50
aWFsIHN1cHBvcnQNCj4gdGhhdCBpc24ndCB5ZXQgcmVhc29uYWJseSB3aWRlbHkgdGVzdGVkIGFz
ICJleHBlcmltZW50YWwiLg0KPiANCj4gVGhpcyBzZXJ2ZXMgdHdvIGdvYWxzOg0KPiAgLSBEb24n
dCBhY2NpZGVudGFsbHkgZGVjbGFyZSB0aGF0IGhhcmR3YXJlIHdpdGggZWFybHkgc3VwcG9ydCBp
cyB1c2FibGUNCj4gICAgd2l0aG91dCBzdWZmaWNpZW50IHRlc3RpbmcuDQo+ICAtIEFsbG93IGZv
ciBmdXR1cmUgYnJlYWtpbmcgY2hhbmdlcyB0aGF0IHdvdWxkIG5vcm1hbGx5IG5vdCBiZSBhbGxv
d2VkDQo+ICAgIChsaW1pdGVkIHRvIHRoaXMgZXhwZXJpbWVudGFsIGhhcmR3YXJlKS4NCj4gDQo+
IEhlcmUncyBhIHF1aWNrIGJyZWFrZG93biBvZiB0aGUgc2VyaWVzOg0KPiAgLSBQMS0zOiBHZW5l
cmFsIGNsZWFudXAgJiBvdGhlciBwYXJhbWV0ZXIvZGVidWdmcy1yZWxhdGVkIGVuaGFuY2VtZW50
cy4NCj4gIC0gUDQ6IEludHJvZHVjZSBhIG1vZHVsZSBwYXJhbWV0ZXIgdG8gb3ZlcnJpZGUgdGhl
IGRldGVjdGVkIGdwdWlkLA0KPiAgICAgICAgd2hpY2ggaXMgdXNlZnVsIGZvciB0ZXN0aW5nLg0K
PiAgLSBQNTogQWRkIEtVbml0IGluZnJhc3RydWN0dXJlIHRvIHRoZSBkcml2ZXIgZm9yIHRoZSBm
aXJzdCB0aW1lLCB0bw0KPiAgICAgICAgdmFsaWRhdGUgdGhlIGVycm9yLXByb25lIHRhc2sgb2Yg
cGFyc2luZyBhIGdwdWlkIGZyb20gYSBzdHJpbmcuDQo+ICAtIFA2OiBJbnRyb2R1Y2UgdGhlIHRp
dHVsYXIgY2hlY2suDQo+IA0KPiBNYW55IG9mIHRoZSBlYXJsaWVyIGNoYW5nZXMgY291bGQgZ28g
aW4gb24gdGhlaXIgb3duLCBidXQgYXJlIG5vdA0KPiBjcml0aWNhbCBmaXhlcyBhbmQgd291bGQg
YWxsIGxhbmQgaW4gdGhlIC1uZXh0IHRyZWUgYW55d2F5IHNvIGl0IHNlZW1zDQo+IHBvaW50bGVz
cyB0byBzZXBhcmF0ZSB0aGVtIGZyb20gdGhlIGNvbnRleHQgb2YgdGhlIGxhdGVyIGNoYW5nZXMu
DQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBNYXR0IENvc3RlciA8bWF0dC5jb3N0ZXJAaW1ndGVjLmNv
bT4NCj4gLS0tDQo+IEFsZXhhbmRydSBEYWR1ICgxKToNCj4gICAgICAgZHJtL2ltYWdpbmF0aW9u
OiBBZGQgZ3B1aWQgbW9kdWxlIHBhcmFtZXRlcg0KPiANCj4gTWF0dCBDb3N0ZXIgKDUpOg0KPiAg
ICAgICBkcm0vaW1hZ2luYXRpb246IFNpbXBsaWZ5IG1vZHVsZSBwYXJhbWV0ZXJzDQo+ICAgICAg
IGRybS9pbWFnaW5hdGlvbjogVmFsaWRhdGUgZncgdHJhY2UgZ3JvdXBfbWFzaw0KPiAgICAgICBk
cm0vaW1hZ2luYXRpb246IExvYWQgRlcgdHJhY2UgY29uZmlnIGF0IGluaXQNCj4gICAgICAgZHJt
L2ltYWdpbmF0aW9uOiBLVW5pdCB0ZXN0IGZvciBwdnJfZ3B1aWRfZGVjb2RlX3N0cmluZygpDQo+
ICAgICAgIGRybS9pbWFnaW5hdGlvbjogV2FybiBvciBlcnJvciBvbiB1bnN1cHBvcnRlZCBoYXJk
d2FyZQ0KPiANCj4gIGRyaXZlcnMvZ3B1L2RybS9pbWFnaW5hdGlvbi9LY29uZmlnICAgICAgICB8
ICAxMiArKw0KPiAgZHJpdmVycy9ncHUvZHJtL2ltYWdpbmF0aW9uL01ha2VmaWxlICAgICAgIHwg
ICAzICstDQo+ICBkcml2ZXJzL2dwdS9kcm0vaW1hZ2luYXRpb24vcHZyX2RlYnVnZnMuYyAgfCAg
IDIgLQ0KPiAgZHJpdmVycy9ncHUvZHJtL2ltYWdpbmF0aW9uL3B2cl9kZXZpY2UuYyAgIHwgMjAw
ICsrKysrKysrKysrKysrKysrKysrKysrKysrLS0tDQo+ICBkcml2ZXJzL2dwdS9kcm0vaW1hZ2lu
YXRpb24vcHZyX2RldmljZS5oICAgfCAgMjQgKystLQ0KPiAgZHJpdmVycy9ncHUvZHJtL2ltYWdp
bmF0aW9uL3B2cl9md190cmFjZS5jIHwgMTI1ICsrKysrKysrKysrKysrKy0tLQ0KPiAgZHJpdmVy
cy9ncHUvZHJtL2ltYWdpbmF0aW9uL3B2cl9md190cmFjZS5oIHwgICAzIC0NCj4gIGRyaXZlcnMv
Z3B1L2RybS9pbWFnaW5hdGlvbi9wdnJfcGFyYW1zLmMgICB8IDE0NyAtLS0tLS0tLS0tLS0tLS0t
LS0tLS0NCj4gIGRyaXZlcnMvZ3B1L2RybS9pbWFnaW5hdGlvbi9wdnJfcGFyYW1zLmggICB8ICA3
MiAtLS0tLS0tLS0tLQ0KPiAgZHJpdmVycy9ncHUvZHJtL2ltYWdpbmF0aW9uL3B2cl90ZXN0LmMg
ICAgIHwgIDczICsrKysrKysrKysrDQo+ICAxMCBmaWxlcyBjaGFuZ2VkLCAzODkgaW5zZXJ0aW9u
cygrKSwgMjcyIGRlbGV0aW9ucygtKQ0KPiAtLS0NCj4gYmFzZS1jb21taXQ6IDRhNzY4YzU0NGY2
NGVhYTJmYzdjZmE5MWU0NmY0M2FhNGFhZDBjNDANCj4gY2hhbmdlLWlkOiAyMDI2MDEwNy1kZXZp
Y2Utc3VwcG9ydC1pbmZvLWYxNmQ4MWI2NzJkNQ0KPiANCg0KRm9yIHRoZSB3aG9sZSBzZXJpZSwN
Cg0KUmV2aWV3ZWQtYnk6IEFsZXNzaW8gQmVsbGUgPGFsZXNzaW8uYmVsbGVAaW1ndGVjLmNvbT4N
Cg0KVGhhbmtzLA0KQWxlc3Npbw0K
