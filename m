Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4B9iOXS4iWnoBAUAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 09 Feb 2026 11:35:32 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 574B810E305
	for <lists+dri-devel@lfdr.de>; Mon, 09 Feb 2026 11:35:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 80E8D10E3C2;
	Mon,  9 Feb 2026 10:35:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=imgtec.com header.i=@imgtec.com header.b="ANPHs1zA";
	dkim=pass (1024-bit key; unprotected) header.d=IMGTecCRM.onmicrosoft.com header.i=@IMGTecCRM.onmicrosoft.com header.b="iUGaZZpr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 1028 seconds by postgrey-1.36 at gabe;
 Mon, 09 Feb 2026 10:35:27 UTC
Received: from mx08-00376f01.pphosted.com (mx08-00376f01.pphosted.com
 [91.207.212.86])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 022E910E3DB
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Feb 2026 10:35:26 +0000 (UTC)
Received: from pps.filterd (m0168888.ppops.net [127.0.0.1])
 by mx08-00376f01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6195V4EH2360144; Mon, 9 Feb 2026 10:18:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=imgtec.com; h=cc
 :content-id:content-transfer-encoding:content-type:date:from
 :in-reply-to:message-id:mime-version:references:subject:to; s=
 dk201812; bh=xUY3BVOZfR/zF5cGsM4VvWSiSDTNKTxZZMBdtnTWG24=; b=ANP
 Hs1zAMu65j8EFNTl2SRrl6h1KzRNvesKkMZ+lZ/t2egJZAx5pC93ASBlHEGZirRi
 I9Mhnmrk53xYiQfquZlBYenhZmrwSgwZeg4mTiX2YlYtJuO482fkNbZKAJauiCNM
 vAKE9HiywKXjm0/SdRJ1esEbn7RjVVD/m7LF3RNQjgCjOA5xFKgc9H1jvjSwd3Lk
 Wes0A9XqOnDXoiFMH7BJfu16RvVh3ZkxxZuR4mr9vu3drHJ1XaewqYIT/F6Hf+qA
 Rqb7qvC3ESq5REfsi7cbmxS+djiYF6DlB5wp/gN7j6JX4Ax12TJmatAY6nidLg4b
 DRzxhJL9gyvLaFXoWEw==
Received: from lo2p265cu024.outbound.protection.outlook.com
 (mail-uksouthazon11021140.outbound.protection.outlook.com [52.101.95.140])
 by mx08-00376f01.pphosted.com (PPS) with ESMTPS id 4c5vht16ck-1
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
 Mon, 09 Feb 2026 10:18:04 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Zbe6RXSe5UcDoKJ2e1GqAtvxwFHXrNBTvwsnUo7n/BdvN+9gorDUr4C6ePmKJhWtcG8CPtD4LkIe7qHpQWzePyxD5oYgSMRv82uQsQUJ3S2DJt/hRTo6OXqxHGL9LgZhnt82Gz7EB/BsOVdIqBg6CEKx9X8ATE1S3SPTDUDTnk2cKT347owcryha/yKoUBQhA9UZ0Oem5VzbVwH8t66TvI45fC4G6D7r5ZEUR9ZV6drQb9hrVy6PEvcHd/g4mmw+6+wbaqCXwG7DGwUshOacsOQ+UR0TWkptXVJ7rLmXhP11OyN82Hfd1JZ7kK3QQLrWFmJIDaQB6lq8vkyjYaznSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xUY3BVOZfR/zF5cGsM4VvWSiSDTNKTxZZMBdtnTWG24=;
 b=wMoNiTAIElAPyiDe9gGj+/aX+y1sjzT/Z42PiAP9ICAs0IQOhXH0TX8FEmE7TqMxDb9jY9nRKA/9UtNXrhBYW8tBifNYPODdh6uLhjN7C6R4TfMMDiMnGobCfk2oJJEE5sWu/Y+CNxUummMcAdCT4YrchQj3w7yImuA7RqpC2cNCJj51hbPc2IZ2yUfbcG1WS5M2Ibs45mKd6CjOiasJChAjHew2eLzYDkY9Pj7e6Vfh6AmuCiNEo9a8Iv0RiFWJRCEcJ2sABx+AVkHLVAmx2dhA2DUHvej/rHImaTs+ndvxfcbzksVOkJYdGU2aBGc/+1sIsk5/BeYY16PpGDXJpA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=imgtec.com; dmarc=pass action=none header.from=imgtec.com;
 dkim=pass header.d=imgtec.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=IMGTecCRM.onmicrosoft.com; s=selector2-IMGTecCRM-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xUY3BVOZfR/zF5cGsM4VvWSiSDTNKTxZZMBdtnTWG24=;
 b=iUGaZZprtR49ZbMsLmKJmpswZmR721FaKj5dzIJ+VKqMcR4tpUQADGhW96irgTQ5qvaRdzV0Rtcke43VjKoZxTrvmxLUG7S3egZag+Zc59bf7TZkzbF/14hWygQtsls8hrsrmStXqS6exoQLwJHCG0fI3H6DJbphnr/aEXz2N08=
Received: from LOCP265MB8579.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:4b6::11)
 by CW1P265MB8482.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:26f::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.19; Mon, 9 Feb
 2026 10:18:01 +0000
Received: from LOCP265MB8579.GBRP265.PROD.OUTLOOK.COM
 ([fe80::6a13:bb8b:b1da:77e3]) by LOCP265MB8579.GBRP265.PROD.OUTLOOK.COM
 ([fe80::6a13:bb8b:b1da:77e3%6]) with mapi id 15.20.9587.017; Mon, 9 Feb 2026
 10:18:01 +0000
From: Frank Binns <Frank.Binns@imgtec.com>
To: Matt Coster <Matt.Coster@imgtec.com>, "maarten.lankhorst@linux.intel.com"
 <maarten.lankhorst@linux.intel.com>, "mripard@kernel.org"
 <mripard@kernel.org>, "airlied@gmail.com" <airlied@gmail.com>,
 "tzimmermann@suse.de" <tzimmermann@suse.de>, "simona@ffwll.ch"
 <simona@ffwll.ch>
CC: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Brajesh Gupta <Brajesh.Gupta@imgtec.com>, Alexandru Dadu
 <Alexandru.Dadu@imgtec.com>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, Alessio Belle <Alessio.Belle@imgtec.com>
Subject: Re: [PATCH 0/2] drm/imagination: Improve handling of FWCCB command
 types
Thread-Topic: [PATCH 0/2] drm/imagination: Improve handling of FWCCB command
 types
Thread-Index: AQHcl4H5WY2q4iJduEi9brRCofhrRbV6K7UA
Date: Mon, 9 Feb 2026 10:18:01 +0000
Message-ID: <4f2fc9eb2d6b273a3242c98180e6c1ae532deaa7.camel@imgtec.com>
References: <20260206-improve-bad-fwccb-cmd-v1-0-831a852ca127@imgtec.com>
In-Reply-To: <20260206-improve-bad-fwccb-cmd-v1-0-831a852ca127@imgtec.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.36.5-0ubuntu1 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LOCP265MB8579:EE_|CW1P265MB8482:EE_
x-ms-office365-filtering-correlation-id: 900eebb1-595f-427b-0f61-08de67c4813f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|1800799024|366016|376014|38070700021;
x-microsoft-antispam-message-info: =?utf-8?B?QjFVNnVSUU1HSkhXbTdzTmNoVmZnQ1NUdzFld2Y2RkNRQjlXLytZUXd4ZVJO?=
 =?utf-8?B?N3VhczBYM3RpRk5FNkRsckh0MFZRVnN2aUtrRksvNmp4RC9zdXpPSGozYThz?=
 =?utf-8?B?TGx2MTFSNlZGa3NXKzR4UlZkR2UyNlRQQWxIWkhPZ2tlN0ppdzdDNFJ1dTB2?=
 =?utf-8?B?c3FrYUVpTFc1WTZuTng3SCtMallnZmVZU0VXRUFGY1pQdlEyQTVEajlyRDRO?=
 =?utf-8?B?d0ZXVENiajF5UVVYUnNDUmZkREp3R0JlM3NCZVZ3M1NhZ3VuSFowampMWG9p?=
 =?utf-8?B?RmRqUnBVYTBLaEVpSXpLN1N5Y0NhZUs5RFZqU0lRTGwvcmFUdHRlN3dibld5?=
 =?utf-8?B?SVc0R2M5MXFnTHZXTVdjNGhPTGg3a2EySWNra3VVK2lrc3dHc2JtOWpLb3R0?=
 =?utf-8?B?N0p5ejlWUTk5azQzL0tCS0dhczhYQWNMRGVaSk9OZWpJRmlsaWNmcnYzVjJU?=
 =?utf-8?B?OUxoaUE5L3lNdFdBaVRWYzhFaDZnWU5DYVp2SGVtdkplSDBhVms5ZzJydjY5?=
 =?utf-8?B?SDNQNlViSzU2RTdZZUhYSFZrTlFZRXNNT255cE1mY3NybENzY1EzSHpYRWg4?=
 =?utf-8?B?L1VZY3g2aGcwVy9qRzIzb3B3bzE0VUE0Q3BuTUtxcmFrTFpETnBWdWtPN2tC?=
 =?utf-8?B?MG1QMTV1QWcyVm1pTUNVTmEvNmdwdTZxMzJZdmNBTG1ZWWVjdzFCejN2MWds?=
 =?utf-8?B?dENTZHBMKzFmWlZ6UHFhc0hPRndZRU5sMGVXSndmUUQxOWorZlI0c2hZTjVV?=
 =?utf-8?B?Ryswcit1dkUvT0Y5NG9FRnNoMmErK0RBSVZnQXcyckUvQmdaWExuWlFpNzBU?=
 =?utf-8?B?ZXhJcWdZYnVsNXgzYytBamRrWU5lUEpiU254SklZWmZheG5md0thTDcrSzFT?=
 =?utf-8?B?bkpTbFVIMW9keDhvN2luSGVzNTNGL2RON2V4QVlibDB2QU1Jb01yMUt3Qzg1?=
 =?utf-8?B?Q3ZDMDJ1c003M1B6OWtYdUdFc20vTEorWis4dE5nY3h4cGwxbTVNd3E2aVFj?=
 =?utf-8?B?QmQ2NnlSZUY1R2VtRzEva0pYbmNzdFA5TkdHMlBFaE1JdkgxWFhhb2UyMDhR?=
 =?utf-8?B?V1VJbk1GeGIxL3hQODYwczczWHZNQTlsblpQcTNaOUp0WHkvc3lIRTVvVEdJ?=
 =?utf-8?B?dUNiWHRBb0JiNkxicHJrWnAwTVRmcU8xbk5RN0VXeHY4WEg5dE5FaVE2T3Fi?=
 =?utf-8?B?ZUFHOEpjQ1RucTg4T3VCdW55V0Fnb2JPc1JMSWVELzJZTEFqeTVycy9mWlJk?=
 =?utf-8?B?UE9WSHhCYVRoNTFvTFg0YU9yK1J1UGFiVUFaNEdhSmRNdUV5VExYYTcxcU95?=
 =?utf-8?B?Y1A2TnBYeUFqRDNVbGJ0NFpDdDFtaFZmTXRPUVI5Ylk4QXR5ZW5lK1E0R0t0?=
 =?utf-8?B?ejBHSWZUL29PbkthWVR4QTNSNUVrY0tkdFlXU3dKTnRXa01DcWVQTnZUTXdw?=
 =?utf-8?B?Nys1eHkrYWhEQ2RyK20vanJOb3lsL1FQcEdYbThxNGtKVUJXd21OUVovdE5h?=
 =?utf-8?B?WUdZM0gvcjJZTDArVFAxVlIwNWl3UkhYbkgxTHp6dVdkSnUwYUkxdVAvK1dv?=
 =?utf-8?B?OVZrSHBqanAvRUNucWFDaUg4V0FwNnFCV1B1cjlLbVhUL2tZZkdZSmFSUm1z?=
 =?utf-8?B?QTJjRUUzQnlaYjJVWldJMnRWQXFXdmpmSnl3M0ZaVGZaRzlSeTY3SGNrT1pH?=
 =?utf-8?B?RVdsak14Rk1ldUJyRyszSXVUYjVDbXF0UktuUmJZcU5qclM1TjY1cnBvR3Fu?=
 =?utf-8?B?RjBkUm1ZNlA4RThMeXdwa2tFMENXa2puWWhRbVpPREJSUVJZUGxheHFuZDgv?=
 =?utf-8?B?V1Z0RDFZSjNHVzlKTUQxSzdPckJ4ekptdzRSWU5wQTVQaWVRRnJSaG93dGVl?=
 =?utf-8?B?T2M5WHYzazJnRjFkOHVRWVE2Y0twNFNpZ0pNSnJ3UUVzcktZTDFMNmM0emxo?=
 =?utf-8?B?M1ZpRnNGTjc2RTFYV2F6Um8xOHdsSHZSV1RZSENUWXRQYnh0eVdBTVVHTHVJ?=
 =?utf-8?B?YStKZ2paTVhJNTVlcmFlZUVqUmNGaDNaUHNhdURBMFJmV214cUdvZWVYajVN?=
 =?utf-8?B?TTNWd1g0YVFVSjRLd0tiTkJweDB3U1krWTlqakU5RXA5VEpkWlEwZUIwK0s2?=
 =?utf-8?B?TkhSaDFQTmEyMHNQdUZwcnhsOEcwSHZ0ZWhldURPa21tZU9vSmJXWjF2WFRP?=
 =?utf-8?Q?FyP6DLz/D1znAVAEtzoq9fU=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LOCP265MB8579.GBRP265.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(38070700021); DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?a3VTZDdlMGZySHNoSUlML0VEcnM3RnY0Nlp6QS9JQ21pNHZrNW5LVlViRThP?=
 =?utf-8?B?b3JZWVFaUFlOYk1wN1Fwb1REZENnbVVuVHVyT05EV0VhODdSRVBCaUtiT3J5?=
 =?utf-8?B?M3d0WnZTS3Y1c1N6THRNa1BKbHIyeE5HcVpBRmYwOUZqbGUwZU9SSDV3bUdF?=
 =?utf-8?B?L3BRa2xrdWFIUDQyTFFyR2RrdnVLcC9kTjV5bzBsc1k2QVY5V1JSU1lWbEFs?=
 =?utf-8?B?enZRWVlKT2ExVzNkNS9acVhObkVRKzI5UFgzUFdNWWo4UTU0MnVva3d6K0N6?=
 =?utf-8?B?Y2dZTW9QdG94N0p4NGxkbjJxRUJBQ1BOek1QTFJkU0twampjdjNLWm1kZFIx?=
 =?utf-8?B?WW11ZGsvZ3I2VENzT21mZ3FCWFh5UWJXQWVqMVlsc3VPSlVVOTdWOEUrZ09w?=
 =?utf-8?B?S2NRai9sUnhSZG5TOUdFS1lsUVMyaUs4bjROdWJNVGxZSEVJeWNaam0rYzM0?=
 =?utf-8?B?MzZia2tncFpibkNqblhMbTNvSllhU1RQV2N5NW5oUmVUdnVhQ0FMOFZVUmF1?=
 =?utf-8?B?cTVZeW1nd250K1hEMGcyM3JpQnUzRkYveTJoUzloRktPNWc1SnhOZTgrOCtq?=
 =?utf-8?B?cG5FVWtEd3I1U3hqUktyTzhFNFpVOFpiTEJ2ZW52dkRENjdsODhNWUxYa3Vr?=
 =?utf-8?B?US83WE0xc3pHSCtCeUh6ZDFJeWNhQkl2TXVXMXFremMvZHA1VkFUTlFYelRC?=
 =?utf-8?B?REpSbU1jSGgwVlNhS0VZSWVBOG9jREZjeXlwWDBwTXBsa045SlB0SERTeFFW?=
 =?utf-8?B?ekhZQWU3b0VlY2FhQmhjVHlEZWdHb2IzTkg5ZVhIazYzZ1c2RG9Zb2RJTm1y?=
 =?utf-8?B?SkM3Q2tQKy9HUzVPcHltSUdSOTZLMWI0UFZiTVA0TzE0ckV4eXQ2K2N0anY1?=
 =?utf-8?B?STNHN0F2WFlTUlhEc2UyY2cvckNoWmliczBzUlgrVDlCd1BUQ0d2ZGhUSmp6?=
 =?utf-8?B?S2RYZ2s5ZzJaUzJ0ZUVoYjlhNm1PVU1nYmZ5eW1qTHN2NnZONEltTDRHK0tw?=
 =?utf-8?B?cTB2RVlwbkxab2VMTGk3OE9zb0s0QkpvYTJWb3pkaWxLbEdzU2ZhS1RpQ1o1?=
 =?utf-8?B?L2FUNVltTHpyWUN4ZVRxSVcybHZ3aXB0UExFQmlydmpSQk9SUUZkQmNNZzha?=
 =?utf-8?B?UFZCdDd2WjJwOVZ6c0FHckJ2Qk1GRXpaRDZ5WkRHZzNSbGluamVnZzUxK1M5?=
 =?utf-8?B?NG4zZjhuanVHTWVpbHhvckJpUGRtNTBpcEZmbHY5bnNKTWREdlVJK2dtcWIx?=
 =?utf-8?B?M2xjREpqaVFOQjYwMk9nVkRESGtPVVp1U0NDa1dzd25RZlJSNWtOZGk3Mm5z?=
 =?utf-8?B?US9aN3NVMXh1dHNOalJJOWFsWmFNakVJUXpsa1lScVhYS2lONDJKS0toU1dI?=
 =?utf-8?B?TGF5amVhbGNzVW5HeXlsc0duTWNqTTVkSGdLRGI3VUZEL0V4YWVKM0hGekdu?=
 =?utf-8?B?am03NXVxNDRQTFpsSEp4UFVDa25JN3c3SHlnUHhBMndGbEYxVmZUZ3J6NkNC?=
 =?utf-8?B?QkFzb05YZmwzZDZnSFNVdmU1NmR2cTQ1cWE0N05BRG1zeUt2Tzk3K25Idi9R?=
 =?utf-8?B?eStTQ3hId0ZRQjVlaTNsM0FGVTdNRUJnbGF6cnRCb2tMbkp2V0s3UkpvQllz?=
 =?utf-8?B?QUtVSnd4bGdCZnh4eC9jaUI1cVZBWSs4dld5Q2R0QTIrWWNBTTVNWTVyNmd5?=
 =?utf-8?B?R1JsQUxqdEhNd3I2LytOblN3eHRyN3djc3FocVBOdERCSEtZR0hBc2ViM2dp?=
 =?utf-8?B?anVBR2FKUkk0Y1c4Y3ViNjMyQ3hHUDBPWW9nMU5jdEVNRWFBOGIvRkdnWXhz?=
 =?utf-8?B?UUpIREFtaFdIQk94bTMwM0tQUEhsN0RWWklWcUpzTDh3NitucXI0TGZwSWZJ?=
 =?utf-8?B?YWhvV2RHL3dOd3Nxa3gyazRkQzBvVUlleXFVckcxKzNBMU00VGpzcDNxdnVM?=
 =?utf-8?B?VFZnV2R0WWFUcU1XeU4xUkRoRUtaSFBRbnZWS0UyVjZxTkpQY1NRREdmWHJv?=
 =?utf-8?B?MHpUM01ITzB5SzdiY3BlNkYvbjlNZHBVV0thck85L0NuWU05N1BsTk80YmF1?=
 =?utf-8?B?K3JmeEpLYzVNeWtaSlhZenFyZTBROEszbGxWaTIxbUN4aFFZMmpsRlZpQ3RX?=
 =?utf-8?B?VzRrSlhRa011amR4a0lhQVJGU3lUeDRYUmlGU0s0end4ckFpRVdGR1JjQ3g4?=
 =?utf-8?B?NEM4cDJacmpydVRRTzRZdUVUaS9SRzVkSUdvc2lJcWJ0c2dzaXpGNUpBVFBh?=
 =?utf-8?B?QjBCYk1GL0htVUlZSzhWb0pOOElyUkpCOEdqZlA2bzRVb0VldFNRaFlWWk9n?=
 =?utf-8?B?cjRuQ2VEM2Vhd2o1U1R4Y09VYjdFVFhpR0UxUHc3MmdINDNBckprS3dtbHpB?=
 =?utf-8?Q?Fzt4GajEoOsf7Cyg=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <68670A65CF2DBD44A7B447AC22F6F82B@GBRP265.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: imgtec.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: LOCP265MB8579.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 900eebb1-595f-427b-0f61-08de67c4813f
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Feb 2026 10:18:01.2731 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 0d5fd8bb-e8c2-4e0a-8dd5-2c264f7140fe
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 7pw/QgGSbfKjFLZxyKVDfWVc4HWwzCHNUnJw7fBblGckrWxGkA7tRRw2PGGjdFALTiQPyfCHp0X7XVLEUoqMvw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CW1P265MB8482
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjA5MDA4NSBTYWx0ZWRfX2FOHRzaNWl29
 rOnWlvy886CXVSrkpfxR+CtVZDpF1rXiTQ2I0/y+o2JjM80W/XtPFZSAZoo42fsJz5vQtr7L/z1
 pnAnZumDJqizbhgp0MntjpJxTqlsmfcX3NWrrY+EdqG+xsLzD9hnbhw8Tr0LKu1b2VGfzSLtlMC
 cJOzgpZVwPKzv5sPBSckVMC7vL2GiZ7UT7xPEBf7B234XMnOP2HIuSCcGp6Rnx+2OwSV4xbvAxc
 AdphlqmyUSQoLoOdapu06vs0oSWsBZp9m/eEjKsH2Msq2T+MW1lmpyOwp9EAIgtPCZNPBObXWC1
 5pPijHOxAwX8WiD/+bDZA9GX8xsNxC10uVwCF65E3BvX1iRtwCu8RDAdLPj2eqUG2aV5SSd797I
 p02TIe4sFdmB9+hq/eFIrba4N8IG361h7LKSsGzN3wcIkMEtlWPn1/ZxgMi6zLRpp68NaOj+0Fj
 DpPFmLCMLRYyh0lmmVQ==
X-Authority-Analysis: v=2.4 cv=IuYTsb/g c=1 sm=1 tr=0 ts=6989b45c cx=c_pps
 a=c57zojfn/sHdeyOhpem9jw==:117 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=HzLeVaNsDn8A:10 a=NgoYpvdbvlAA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22 a=r_1tXGB3AAAA:8
 a=0lCJXrwpxg8mME0wy5MA:9 a=QEXdDO2ut3YA:10 a=t8nPyN_e6usw4ciXM-Pk:22
X-Proofpoint-ORIG-GUID: FiD9zCYyfY0lf3dGbukKc-D2Unk0deTW
X-Proofpoint-GUID: FiD9zCYyfY0lf3dGbukKc-D2Unk0deTW
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
	MIME_BASE64_TEXT_BOGUS(1.00)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[imgtec.com,none];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[imgtec.com:s=dk201812,IMGTecCRM.onmicrosoft.com:s=selector2-IMGTecCRM-onmicrosoft-com];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177];
	MIME_BASE64_TEXT(0.10)[];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:Matt.Coster@imgtec.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:airlied@gmail.com,m:tzimmermann@suse.de,m:simona@ffwll.ch,m:Brajesh.Gupta@imgtec.com,m:Alexandru.Dadu@imgtec.com,m:linux-kernel@vger.kernel.org,m:Alessio.Belle@imgtec.com,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[imgtec.com,linux.intel.com,kernel.org,gmail.com,suse.de,ffwll.ch];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER(0.00)[Frank.Binns@imgtec.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[Frank.Binns@imgtec.com,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[imgtec.com:+,IMGTecCRM.onmicrosoft.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[11];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[]
X-Rspamd-Queue-Id: 574B810E305
X-Rspamd-Action: no action

T24gRnJpLCAyMDI2LTAyLTA2IGF0IDE2OjAyICswMDAwLCBNYXR0IENvc3RlciB3cm90ZToNCj4g
SnVzdCBzb21lIHNpbXBsZSBRb0wgaW1wcm92ZW1lbnRzIHdpdGhpbiBwcm9jZXNzX2Z3Y2NiX2Nv
bW1hbmQoKS4gVGhpcw0KPiBzaG91bGQgaG9wZWZ1bGx5IGJvdGggcmVkdWNlIHRoZSBkbWVzZyBz
cGFtIGZyb20gd2l0aGluIHRoaXMgZnVuY3Rpb24sDQo+IGFuZCBtYWtlIHdoYXQgbWVzc2FnZXMg
cmVtYWluIGVhc2llciB0byBpbnRlcnByZXQuDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBNYXR0IENv
c3RlciA8bWF0dC5jb3N0ZXJAaW1ndGVjLmNvbT4NCg0KRm9yIHRoZSBzZXJpZXM6DQpSZXZpZXdl
ZC1ieTogRnJhbmsgQmlubnMgPGZyYW5rLmJpbm5zQGltZ3RlYy5jb20+DQoNCj4gLS0tDQo+IE1h
dHQgQ29zdGVyICgyKToNCj4gICAgICAgZHJtL2ltYWdpbmF0aW9uOiBJbXByb3ZlIGhhbmRsaW5n
IG9mIHVua25vd24gRldDQ0IgY29tbWFuZHMNCj4gICAgICAgZHJtL2ltYWdpbmF0aW9uOiBNYXJr
IEZXQ0NCX0NNRF9VUERBVEVfU1RBVFMgYXMga25vd24NCj4gDQo+ICBkcml2ZXJzL2dwdS9kcm0v
aW1hZ2luYXRpb24vcHZyX2NjYi5jIHwgMjAgKysrKysrKysrKysrKysrKysrLS0NCj4gIDEgZmls
ZSBjaGFuZ2VkLCAxOCBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQ0KPiAtLS0NCj4gYmFz
ZS1jb21taXQ6IGUxOWNjNWFiMzQ3ZTNjZGNjMjFjOTdlYTVkMTFhZjhkYTdmMTM1OGQNCj4gY2hh
bmdlLWlkOiAyMDI2MDIwNi1pbXByb3ZlLWJhZC1md2NjYi1jbWQtODAxZDZlZWFmZmY2DQo+IA0K
