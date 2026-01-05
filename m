Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EA0EECF20D3
	for <lists+dri-devel@lfdr.de>; Mon, 05 Jan 2026 07:21:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F00E410E095;
	Mon,  5 Jan 2026 06:20:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=microchip.com header.i=@microchip.com header.b="NbXMblzT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CO1PR03CU002.outbound.protection.outlook.com
 (mail-westus2azon11010056.outbound.protection.outlook.com [52.101.46.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3371F10E095
 for <dri-devel@lists.freedesktop.org>; Mon,  5 Jan 2026 06:20:56 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=t7QunUglq1H6sWx3FgYP5CfpxeBtA4JrYfo+T237P3fnLY4XnPVruqln83fhEXzlYGRsEz7bfPBE6QAMVu3lip+1nYC9OdLEvYIdvTXX30KlWKjAz7GTvzXSk//12EZxstfnFAW5Dw/tkjxXrXxr/l8G/+aDqznwHUbtULw1R+UPZsjIq9tqo7Ky2vZy8nN6OrkHOARvtashmpa28GIMS4srx4fP3GkhfEhO2UUYovWMU/Fuik0ogQEJnnsYiTxbDlqQij7rgrgqElz1ueR5u69vtHpKfhVqDDq/qdXmM1uxz3efFb9LO++rkf8ZSLkEt7FD78AC5uAYL705F2lnEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UQ0KlKO2Yu/Amn9Rxa/59u/LkHXC/59LXnN2B1GySYc=;
 b=UgVBJrO6bsT8qaIuSFqoSTraybSX0vKj46cgSpzgW5A0DJUQ15ZHb9tyc+xE6hWqTgyHi1x7Ux76hM1Ze9Dme2yvU9BuOZYrU6sPgbqKMYPuo4V80lbgqELZxyxG0jha0GWLajZfsdItczAN6FcbKWREybQ33nPzmJ7lB6SCDEy70czw+5YfJYBabJoCQCe3cQmDcWaK7JG7HWl4brBsOgWFITZhPy9YSSK1IdA2IAY29xLoQGWnW64XZ2zo7+qoA6PKENmIIfsWyZwMTH2I+/u/9vESKGW5kabhYGHo1hhEH/rKb/102/4p9GNpHdycSupAPUssPKPJti9DCIjMpA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=microchip.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UQ0KlKO2Yu/Amn9Rxa/59u/LkHXC/59LXnN2B1GySYc=;
 b=NbXMblzTZf+7w1qG6HHXnAgE9L/weSW9NSqID/YeVZ965V6IjdqX+FGxN3ddfGCX/QGaafZWHU55aP8xk93YCHpDW0UMSYAr3qEfcG+JJ2ZD7F66VAIbG9ojh9bfAqQ5s7Zs2U8nUG0FJ0mbBBpiGnHTLp5sYkIqPYWA6+eXJCLYVaMiJU1l9u1e1ojNfrsSRdllaSHGle1mVtmeiFX0DJT9OMRBZdUgLdT/VptPEyYGzj/btvtpszOkhi9VVcD3JLzgF5SgBapbAzEO98rH07iPQHDJckqaLSXhHoT13CK/jbx8978GYOi55qiApNQsbEj1261UZJzSOYfYH34WXA==
Received: from DM3PPF9623118BD.namprd11.prod.outlook.com
 (2603:10b6:f:fc00::f3a) by SJ0PR11MB5118.namprd11.prod.outlook.com
 (2603:10b6:a03:2dd::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9478.4; Mon, 5 Jan
 2026 06:20:52 +0000
Received: from DM3PPF9623118BD.namprd11.prod.outlook.com
 ([fe80::253c:c449:c087:43b1]) by DM3PPF9623118BD.namprd11.prod.outlook.com
 ([fe80::253c:c449:c087:43b1%2]) with mapi id 15.20.9456.008; Mon, 5 Jan 2026
 06:20:52 +0000
From: <Manikandan.M@microchip.com>
To: <Ludovic.Desroches@microchip.com>, <Dharma.B@microchip.com>,
 <maarten.lankhorst@linux.intel.com>, <mripard@kernel.org>,
 <tzimmermann@suse.de>, <airlied@gmail.com>, <simona@ffwll.ch>,
 <Nicolas.Ferre@microchip.com>, <alexandre.belloni@bootlin.com>,
 <claudiu.beznea@tuxon.dev>
CC: <dri-devel@lists.freedesktop.org>, <linux-arm-kernel@lists.infradead.org>, 
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 5/8] drm/atmel-hlcdc: use devm_drm_of_get_bridge()
Thread-Topic: [PATCH v2 5/8] drm/atmel-hlcdc: use devm_drm_of_get_bridge()
Thread-Index: AQHccCH/x+liOdW0v0WrksoRwU6xsrVDNpyA
Date: Mon, 5 Jan 2026 06:20:52 +0000
Message-ID: <c477520f-0ac9-48ee-9c84-21df015c5b79@microchip.com>
References: <20251218-lcd_cleanup_mainline-v2-0-df837aba878f@microchip.com>
 <20251218-lcd_cleanup_mainline-v2-5-df837aba878f@microchip.com>
In-Reply-To: <20251218-lcd_cleanup_mainline-v2-5-df837aba878f@microchip.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM3PPF9623118BD:EE_|SJ0PR11MB5118:EE_
x-ms-office365-filtering-correlation-id: aaf7a4d4-7e85-4c2f-9eb5-08de4c22938f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|7416014|1800799024|366016|921020|38070700021; 
x-microsoft-antispam-message-info: =?utf-8?B?N3ZyUWxUUmVqa3hKNHRvME5KV3hKZWphdThEb1J3cDlxdzVIbVZIMUlOQit6?=
 =?utf-8?B?QlpCSTFqWXJTOTIrTlNUT1BkTWkzYU1VYXBtd0hMUGpLL2NYcFRQK1J2VFUy?=
 =?utf-8?B?WkxVWnc4OXhJMGZiVVBkVS94MXU1NlowdUlLTHZFMkt5dUg3QUdFckhRdm9P?=
 =?utf-8?B?a1FIYTNBR0tpRG5CMU5aR3h4WFVrYjNDbDV0b251VHhFYjM5cU9aQTB4UmY1?=
 =?utf-8?B?Z21jcVJSeTN4YjNlWHl2WlRISXRyMUN0cnd6SC90SngxOW04TTdGeHZEKzd1?=
 =?utf-8?B?ZlJ0ZElkWVM2bWwvUUJvTFNBMll4eWd4WkN3Y1MyN2VHbXJENDhoUTdUMERt?=
 =?utf-8?B?Q1dCUm1RYWFIMHNpVElteXoyV0hyeVJkZmtVNEo1MTQ2Q0tZMlNBall4MXdC?=
 =?utf-8?B?WEttaGo1WGhsUmRPNjdCSmFBNS9PKzVpNXVLcTJFWGhEUnkvbHlqZjg2RUNH?=
 =?utf-8?B?emhzSWxMRVpEcjl3dkZjb2drNmZDZGdsQ2lSWWlVcmN4VGNzdnd3SEZUUEdu?=
 =?utf-8?B?czE2TitCcXVmalQ2enBQaHpLWklyV1VGdnZkaFE0MUpwVUExa0ZIREh0Wnlp?=
 =?utf-8?B?QWdmbWc4TlVFS3pTUEl3SFphWjVQcjk5TUNRb1pNck9wTFVhNGpERGNPZXZS?=
 =?utf-8?B?R1YxRTU3TEhSanBraGFOeXR3RDE0WEQ3VnpVc01qU2hITGN6RW5KZytad1Zm?=
 =?utf-8?B?a1hEM2JGZTlEU2RQcnF2Qlp3cFl2eU1xSHBIM3RaVGVQVjFQT0JRcUc0N1c3?=
 =?utf-8?B?NEtkdzRhTFFPQWgzeDVsZm1mRWhjTDVYeTBBUFI3RThRN3RYdVNPS1NLWWM1?=
 =?utf-8?B?eG5PKzBtRi9QdWdhQ1o0bzFxUmJKdi9WTDkzV1lzZThlRkZ6MnJCQTZ1aE1n?=
 =?utf-8?B?aDduMkNYWG8ybWM5U2dNVEhHWDBlU1lReTNpcnREa1FMRURadkw0THJOSFFQ?=
 =?utf-8?B?WnB2ZXhWaVd6S0Q2aUFzeWdtRUtwNU55UGI0MHNVOFVFd05ZL3FudzdXUjBX?=
 =?utf-8?B?dVYzVWR6bXhwUnBrR2laVUJablZkYm1ieWs0VzhBQzZFWkp0WlRQZHVmQkpp?=
 =?utf-8?B?azA0UXhvbzZuUDJPczdabC9pNHJtbXNLaVZtT2REdnNGTHdxS0tvUlBRTG9n?=
 =?utf-8?B?bTg4a3hDazBzSVMxbitnbUJxTlpYcVZvV2hlQ25wRjVCVWFRUXhublRRRDlE?=
 =?utf-8?B?MmVnQUJaM1V2MGN2RGpYdXhmUHlJSUlEZ3c2c3ZiYVY3cTFVdFZMVE1mTXdB?=
 =?utf-8?B?WDhZSnA2VWFPaDRKSmsyNGJBTkpmcnV3azZyUldPYjY3OTZjNk9USGdHN0kr?=
 =?utf-8?B?Qnl1am9GNVpDbThOSkpYcXBoNXczS0plaWQxdWI0bkdKUDVkUHZ4Rk9oVVhR?=
 =?utf-8?B?d2I1VDlwRFRDR3l2RTN2VUlhYkQxMmo1UzhiNHNycWhtVkpEYWhyQWMzeFc0?=
 =?utf-8?B?NUIyTForMFBJMWJyTzdKV2dqMTcrbzJwUnN1MkdZQmZPYVVBSHRjTmROamlJ?=
 =?utf-8?B?VHkzcU1xSlQwR002Y2dSZGZLektYZnJGUStDMmUrVHNEYk03N2I2bkNMbmY2?=
 =?utf-8?B?QzBLUHJmd3pJQmtkYUVPWlhxNjFkMW9uVkFyTzBmMVFZencwbjkzck1qa3RL?=
 =?utf-8?B?UW1BNXZLV3Z0RzU0TG8wbFZIM1dicUJscFFzaW5PR0dvdTF2bGxSdjB6TGhU?=
 =?utf-8?B?dTliL0ozWnNkZERIaDJORFRXcEFJVXh5Z3lPeVgyUmlpTUdHd29IWlZVT0tu?=
 =?utf-8?B?aUk1UU9vYnoyR2duTzZPTkFYeFpNbngrcFlJR2VyZnA4SWRvb01BSkMzdUJa?=
 =?utf-8?B?MGR1RGljUC9HeUJpUkNqNWpvNVFZSmh1S1RxaHZSVTRzUGkzb2hkZWFCM0Np?=
 =?utf-8?B?V0RIblI0eG9qS0RRNzhQVkxhMnB5M1dxYjZZbWNrQVQyZVZ0bmxSUnowcHhP?=
 =?utf-8?B?QlZZRmY1VmFKZHB4RGlDNHdxcEpZRjZjQWltSmE4emc1cmVCaWFkMkxkLzZt?=
 =?utf-8?B?RFc5K0lwN1dHazM0dGZXd21pTGQ3azAwQ2xmV1FFVnY2OTJubHVGY0JDV2Vt?=
 =?utf-8?B?bHcvRXo3OUdEOWp5ZUxKQWZnMk9Mc2h5U09zUT09?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM3PPF9623118BD.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(1800799024)(366016)(921020)(38070700021);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?N0g5QXIwdjZFM01GK0JCU01EaEJMYXdDNGZtSUVRV2RxSUwvZlFqeWZaSEtL?=
 =?utf-8?B?aDdnZmRHMGt5OHRlWWpmb2d3NnpLZVdjUGFhakpUUTBKc2hVR29kQ05PV0pq?=
 =?utf-8?B?T1VNSStDNEFxZVJYeEtObjhlMGxES3l3Mmh1L1J2NUtUMkJZSXNsVk9PN1pv?=
 =?utf-8?B?MGlFWjlwalc0dGJ0WjB5TEM0b24zeG5keHdSSnZkUktINWFzTU9ObmRyYVBJ?=
 =?utf-8?B?ZmtQa0cvTktsa2l1czlqZzVKZ29YYldZK2JpMmpmbXdsdnEvb0JwQUNGSDBL?=
 =?utf-8?B?OVhiTXVtb0w3U0NEWFVmbkFuS05wRC9HMDM5STg4d2tBb0IxZGF4WWJoV0N2?=
 =?utf-8?B?UU9RUUhGbDNvc3JSQ0Q3VHNtZVhsOHdVY2h1VnlqK3ZUUnVybnJQc2VpY1NZ?=
 =?utf-8?B?ZHJiNTFtU0U5cTRYUG0vcC9JMjJJK0h4Z1lUY3hxb2k2alJFRlRLMGlFdWN2?=
 =?utf-8?B?SURHeGlLc1k3bDE4V3FPOFBpbFQxUDJUVjlENG1SY0swdGNDVDFvNGhkTmR0?=
 =?utf-8?B?UWdFS0Znc2NJYnhFbWpvMzl0aDlNQjRZZThRb3JIK09IS09lSDZGLzh6ZGVn?=
 =?utf-8?B?dy9ISkhNSExNV05Xc0luUmxVL1NCRktGRXVQcTB0N09LNXRTZGRsZGRPMncy?=
 =?utf-8?B?UjR1ZDNTZy9ZYTBMSGJYWlUxTm1wOFR4QUpIbHh5R21xemlFVHNzcmVjakox?=
 =?utf-8?B?RW9Td0pMTnZJK2RIOEtXa09ua3dHTzhkU09oWmlrb1pBa2FDMTBaV2tpNkZz?=
 =?utf-8?B?Uk44elhaVEZmV3dFY1F6TWpIM1M2bmRMU1F1UDRrWTliMkhva3RCc3Bqa3Fk?=
 =?utf-8?B?OGIvWDIrb3dIM0ZsNlNJM0lrNEZTWjJ5eEpPcUtoTXlmNVp3cklhb0kyMDRU?=
 =?utf-8?B?VjJwOEdQWjNCc1BCRmtRak5rT3pLMHdHSlczS3h4MUpOeVJwbFlKdjJrK25t?=
 =?utf-8?B?S25jL2o2R1JiUWxLQnpTMFpGOUhCQmhzd0VZNkFpWEZSaDJ2QXRBMWVxMTAy?=
 =?utf-8?B?N2xFZDlrTVNUREo4YkhBM3Evc1JwRU8zOGFJVVgySHJXRDFXeWhzdE1ZVjNy?=
 =?utf-8?B?WjMxc1hFWCtJNWVPSlNWbERVWURrSGlJd2RXcUFXNm1BZ2pTVmVjaEFIeGJj?=
 =?utf-8?B?OEtzVVRJTjlTZXc1UzFnVEQreVl6Si9iVEtqY2hjTTcxclYyR3lPZ1UrVFpt?=
 =?utf-8?B?Y0pwNHRLc3R3ZWdINGtrQUsyQ2FHSDJYbHdsRjQ1Vi9HSHF3V1RnT1JPV3J5?=
 =?utf-8?B?N0ZDUjdzMnNUQkhuS0ZMSHpmOEorZXlTV0FqNk9pZzhoK1VLK25xa0FSTFJy?=
 =?utf-8?B?MXhaN1VBZkxGaGtsb292NElOQjhLbGhqbDJaMjkxZVBwc09wU3ZNY1VpVnpu?=
 =?utf-8?B?cWVMd3g4NTdDYWUzQjNPcEZ6eHNaamNOeWJkZHZrMjhVUWVaUnRlWW1yOXFX?=
 =?utf-8?B?QjFMMXFkdkNDUWhFNFZ6R0ltMnZRYVN3Y3pPMElQeU1sR2VheDBRd1Jkc2lq?=
 =?utf-8?B?dXRTWUZQd05mZzBRUENHYjBoVEhER3hUNi9mMUJvTENqZDJ2Z0NDTXJKdDJD?=
 =?utf-8?B?QnpDY0plNXdwVVNZN09RZW8zcFp6cnFoTFhEM05YL1dZNTAxSW5nalFQVFNU?=
 =?utf-8?B?V0FwNDNLaG1haGQ2RVlLZy9NVytNeGNEejQzK3FNSGl1TDNOSGNMbjMwaXZC?=
 =?utf-8?B?cFVwRDh4YTJYQTFtN1BQdXJmeThOYVIxTmlqNUxzL28xdjI4TDV1VlhPMWpO?=
 =?utf-8?B?dVhHL1V0MGt5a1Evc1lHNG5yMWtmVldzdG9mak94UHlJNTFpUlFja24wUnp2?=
 =?utf-8?B?eEI5endkcEtuM2tEK0lYaGQvS0dybDRHSXhPU0dSVE1obE9DNnhVeThoYm1J?=
 =?utf-8?B?SFVMaGxlMFp3dnhlbkd5Vk9Wa0FlTFhDZ0IyL3lrMVFVbGpJR25ocFQ0YWNq?=
 =?utf-8?B?akZvdlg2a00yYjhXOCtiNkZqRmRESXRELzFETVhqcEN0eVkvSXgwTGd1NS9t?=
 =?utf-8?B?V0FEbmRBUmNmbzUrelFhSTc5dmh4a3BPdENYK213N2IzWnd0WFVIUDZGbUE1?=
 =?utf-8?B?VlV4RS96YjZLRUxlbU9qLzhVY28zRTZFd2FZRDY0STdsaG5yYkRDaXdPYWVD?=
 =?utf-8?B?YStVNjg2Y0dKdytQd0JJN1ZjODVablQzTXh2Q2dvcEVWNmthMXptbGFpN3JF?=
 =?utf-8?B?bHZKRndzMUQ0Smg4YUdWWHZQV1FwUXArblFMa1I0Nlg3NVZXOW1NWE5CM2p6?=
 =?utf-8?B?NFR2K2dYN2Y2VzdYbndkb3FIcjd5aGRoME8yK0JzQ1JGWVFXTVJVcERFd25o?=
 =?utf-8?B?bnZRTHM2dVg2eU80dGFjVWlWZ0ZYUjl1bDJQOFZEMDkyMTVDWmNIUT09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <A17E280E7FEB464782B4DA41536F2E87@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: microchip.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM3PPF9623118BD.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: aaf7a4d4-7e85-4c2f-9eb5-08de4c22938f
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Jan 2026 06:20:52.0810 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: S+DgjcXvMjvm0y5B/uH+/7hM3nqG9VzVYuNg7yPFuolS5C6K6pvW44J3f0wWR0taRoCr42DJS/7rM9qoEdxC0aL4t6vOObY4gyhj1aNtvwc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5118
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

T24gMTgvMTIvMjUgNjo1NiBwbSwgTHVkb3ZpYyBEZXNyb2NoZXMgd3JvdGU6DQo+IEdldCByaWQg
b2YgZHJtX29mX2ZpbmRfcGFuZWxfb3JfYnJpZGdlKCkgYXMgaXQgaXMgZGVwcmVjYXRlZCBhbmQg
dXNlDQo+IGRldm1fZHJtX29mX2dldF9icmlkZ2UoKSBpbnN0ZWFkLg0KPiANCj4gU2lnbmVkLW9m
Zi1ieTogTHVkb3ZpYyBEZXNyb2NoZXMgPGx1ZG92aWMuZGVzcm9jaGVzQG1pY3JvY2hpcC5jb20+
DQpSZXZpZXdlZC1ieTogTWFuaWthbmRhbiBNdXJhbGlkaGFyYW4gPG1hbmlrYW5kYW4ubUBtaWNy
b2NoaXAuY29tPg0KDQo+IC0tLQ0KPiAgIGRyaXZlcnMvZ3B1L2RybS9hdG1lbC1obGNkYy9hdG1l
bF9obGNkY19vdXRwdXQuYyB8IDI1ICsrKysrLS0tLS0tLS0tLS0tLS0tLS0tLQ0KPiAgIDEgZmls
ZSBjaGFuZ2VkLCA1IGluc2VydGlvbnMoKyksIDIwIGRlbGV0aW9ucygtKQ0KPiANCj4gZGlmZiAt
LWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hdG1lbC1obGNkYy9hdG1lbF9obGNkY19vdXRwdXQuYyBi
L2RyaXZlcnMvZ3B1L2RybS9hdG1lbC1obGNkYy9hdG1lbF9obGNkY19vdXRwdXQuYw0KPiBpbmRl
eCBlNTgyMzE1ZjcwYTExOWYyYjM5MDU3ZmYxMTJiYzQyNzExN2I4NWY1Li5lOGFlYTkwNWZiMTBk
MjBkODljMGNmZDc5MzcwMzliNDRkOGE1NWI3IDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL2dwdS9k
cm0vYXRtZWwtaGxjZGMvYXRtZWxfaGxjZGNfb3V0cHV0LmMNCj4gKysrIGIvZHJpdmVycy9ncHUv
ZHJtL2F0bWVsLWhsY2RjL2F0bWVsX2hsY2RjX291dHB1dC5jDQo+IEBAIC02OSwxNiArNjksMTQg
QEAgc3RhdGljIGludCBhdG1lbF9obGNkY19hdHRhY2hfZW5kcG9pbnQoc3RydWN0IGRybV9kZXZp
Y2UgKmRldiwgaW50IGVuZHBvaW50KQ0KPiAgIHsNCj4gICAJc3RydWN0IGF0bWVsX2hsY2RjX3Jn
Yl9vdXRwdXQgKm91dHB1dDsNCj4gICAJc3RydWN0IGRldmljZV9ub2RlICplcDsNCj4gLQlzdHJ1
Y3QgZHJtX3BhbmVsICpwYW5lbDsNCj4gICAJc3RydWN0IGRybV9icmlkZ2UgKmJyaWRnZTsNCj4g
ICAJc3RydWN0IGF0bWVsX2hsY2RjX2RjICpkYyA9IGRldi0+ZGV2X3ByaXZhdGU7DQo+ICAgCXN0
cnVjdCBkcm1fY3J0YyAqY3J0YyA9IGRjLT5jcnRjOw0KPiAtCWludCByZXQ7DQo+ICsJaW50IHJl
dCA9IDA7DQo+ICAgDQo+IC0JcmV0ID0gZHJtX29mX2ZpbmRfcGFuZWxfb3JfYnJpZGdlKGRldi0+
ZGV2LT5vZl9ub2RlLCAwLCBlbmRwb2ludCwNCj4gLQkJCQkJICAmcGFuZWwsICZicmlkZ2UpOw0K
PiAtCWlmIChyZXQpDQo+IC0JCXJldHVybiByZXQ7DQo+ICsJYnJpZGdlID0gZGV2bV9kcm1fb2Zf
Z2V0X2JyaWRnZShkZXYtPmRldiwgZGV2LT5kZXYtPm9mX25vZGUsIDAsIGVuZHBvaW50KTsNCj4g
KwlpZiAoSVNfRVJSKGJyaWRnZSkpDQo+ICsJCXJldHVybiBQVFJfRVJSKGJyaWRnZSk7DQo+ICAg
DQo+ICAgCW91dHB1dCA9IGRybW1fc2ltcGxlX2VuY29kZXJfYWxsb2MoZGV2LCBzdHJ1Y3QgYXRt
ZWxfaGxjZGNfcmdiX291dHB1dCwNCj4gICAJCQkJCSAgIGVuY29kZXIsIERSTV9NT0RFX0VOQ09E
RVJfTk9ORSk7DQo+IEBAIC05NywyMyArOTUsMTAgQEAgc3RhdGljIGludCBhdG1lbF9obGNkY19h
dHRhY2hfZW5kcG9pbnQoc3RydWN0IGRybV9kZXZpY2UgKmRldiwgaW50IGVuZHBvaW50KQ0KPiAg
IAl9DQo+ICAgDQo+ICAgDQo+IC0NCj4gLQlpZiAocGFuZWwpIHsNCj4gLQkJYnJpZGdlID0gZHJt
X3BhbmVsX2JyaWRnZV9hZGRfdHlwZWQocGFuZWwsDQo+IC0JCQkJCQkgICAgRFJNX01PREVfQ09O
TkVDVE9SX1Vua25vd24pOw0KPiAtCQlpZiAoSVNfRVJSKGJyaWRnZSkpDQo+IC0JCQlyZXR1cm4g
UFRSX0VSUihicmlkZ2UpOw0KPiAtCX0NCj4gICAJb3V0cHV0LT5lbmNvZGVyLnBvc3NpYmxlX2Ny
dGNzID0gZHJtX2NydGNfbWFzayhjcnRjKTsNCj4gICANCj4gLQlpZiAoYnJpZGdlKSB7DQo+ICsJ
aWYgKGJyaWRnZSkNCj4gICAJCXJldCA9IGRybV9icmlkZ2VfYXR0YWNoKCZvdXRwdXQtPmVuY29k
ZXIsIGJyaWRnZSwgTlVMTCwgMCk7DQo+IC0JCWlmICghcmV0KQ0KPiAtCQkJcmV0dXJuIDA7DQo+
IC0NCj4gLQkJaWYgKHBhbmVsKQ0KPiAtCQkJZHJtX3BhbmVsX2JyaWRnZV9yZW1vdmUoYnJpZGdl
KTsNCj4gLQl9DQo+ICAgDQo+ICAgCXJldHVybiByZXQ7DQo+ICAgfQ0KPiANCg0KLS0gDQpUaGFu
a3MgYW5kIFJlZ2FyZHMsDQpNYW5pa2FuZGFuIE0uDQoNCg==
