Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CB53BA814E
	for <lists+dri-devel@lfdr.de>; Mon, 29 Sep 2025 08:16:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA90610E20E;
	Mon, 29 Sep 2025 06:16:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="W+E63wtu";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CH5PR02CU005.outbound.protection.outlook.com
 (mail-northcentralusazon11012033.outbound.protection.outlook.com
 [40.107.200.33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9CFD010E20E;
 Mon, 29 Sep 2025 06:15:59 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sTWJPnKNLIQ0OTP24RUq3yGvw5sEtsAjE+pL/LM88kfYvJz5pHibhh/GoLi9e8KDStMFTeRo7oAvK/KYYlnyIfYDmzE6Gmo6Bn/RKFn/PeSvvtOE6GC1kDsC5COWLlied9joFjOE+pIx4g7f1oe8VdtnFqE2mLs7g1rdpFFPymU71eMDj52oBEEn/YhnheGKQj/G8fds+zLp83Bm1n5J92KhUVjsPOQKtZIk8cWwCH8qgqu97ovwuHzRicgLnMqTTxE4KaxB2r7vNOtg/SZYExfHMZBsMZ3MDov4he9goyYJMQ7hD6rtT5wXIVXp0H/pHypLsk+Pf+rrkdw9LUW6bw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rdGMfTBFrFs2y4L/vEi+oNXyiK9w9tZ1ekpuE75qcfI=;
 b=dwEobbFt8qnMUe8j968+OryAcRK2mpiD6Q+E53Wcs6Ds3Rs/rOGenLD9y7mNyuBc3lg1CAbRnXpesYQR2Exv9ox1cpBzsbzOT/liijU0nrDOB3/rsSwasq24t+2wrwE3tht/DZxpKZxxl+uNl7AgLtbK/73cyETO8A3K+jXb4Hj90G8fDVDmFkSEOPay+s7LBKbv5P59NpYX+vDwRXy3Yus7Y/P/IoznnS1MUHRTXnH2w35zRQ4nAb3B8vObm4z6JibVyrj6cCLNR155Aj3NZ3LorgpUOPBenUleNZzzN5320AXAhSqIRvOr5MF9dHVN9K/qiQNvvmC4ZHhkozcpog==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rdGMfTBFrFs2y4L/vEi+oNXyiK9w9tZ1ekpuE75qcfI=;
 b=W+E63wtu6CLx9GAJOCvJ3GmMQeMBCyNjPY4rd7Zi1mAraftQv+gMUQL8QrLHzA6gImrTLx493qVBaHXdrRl39mlwfDtnsqBPrIaV50Gqezux6xY/scAadNzNk8MJ1nOxJGa4SOLBBBGvJb3SsrUJFKefPLZ5S7D3apHuIXVdQkM=
Received: from DS7PR12MB6005.namprd12.prod.outlook.com (2603:10b6:8:7c::17) by
 CH0PR12MB8530.namprd12.prod.outlook.com (2603:10b6:610:188::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.16; Mon, 29 Sep
 2025 06:15:55 +0000
Received: from DS7PR12MB6005.namprd12.prod.outlook.com
 ([fe80::4dc0:f34c:9e7e:ccb]) by DS7PR12MB6005.namprd12.prod.outlook.com
 ([fe80::4dc0:f34c:9e7e:ccb%4]) with mapi id 15.20.9160.015; Mon, 29 Sep 2025
 06:15:55 +0000
From: "Liang, Prike" <Prike.Liang@amd.com>
To: "Koenig, Christian" <Christian.Koenig@amd.com>, Dan Carpenter
 <dan.carpenter@linaro.org>
CC: "Deucher, Alexander" <Alexander.Deucher@amd.com>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, "Sharma, Shashank"
 <Shashank.Sharma@amd.com>, Arvind Yadav <Arvind.Yadav@amd.com>, "Khatri,
 Sunil" <Sunil.Khatri@amd.com>, "Zhang, Jesse(Jie)" <Jesse.Zhang@amd.com>,
 "Paneer Selvam, Arunpravin" <Arunpravin.PaneerSelvam@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>
Subject: RE: [PATCH next] drm/amdgpu/userq: Fix error codes in
 mes_userq_mqd_create()
Thread-Topic: [PATCH next] drm/amdgpu/userq: Fix error codes in
 mes_userq_mqd_create()
Thread-Index: AQHcKIEoiz56LrqOkEqALz8ACmXyCrSYtDwAgAEWi4CAD/KTwA==
Date: Mon, 29 Sep 2025 06:15:55 +0000
Message-ID: <DS7PR12MB6005F149007C50C77ACBFC99FB1BA@DS7PR12MB6005.namprd12.prod.outlook.com>
References: <aMvVAsrczM9W2S7P@stanley.mountain>
 <111d7bd7-57bb-4873-a62f-876128281572@amd.com>
 <DS7PR12MB6005B4FD8CABEE1A06594C66FB11A@DS7PR12MB6005.namprd12.prod.outlook.com>
In-Reply-To: <DS7PR12MB6005B4FD8CABEE1A06594C66FB11A@DS7PR12MB6005.namprd12.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Enabled=True;
 MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_SetDate=2025-09-19T02:34:25.0000000Z;
 MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Name=Open
 Source; MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_ContentBits=3;
 MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Method=Privileged
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS7PR12MB6005:EE_|CH0PR12MB8530:EE_
x-ms-office365-filtering-correlation-id: 34314009-7332-4035-3e98-08ddff1fa62b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|1800799024|366016|376014|38070700021;
x-microsoft-antispam-message-info: =?utf-8?B?bjZ2blUrTk54eTFybS9lQTRXRXp3V1N4VmRrK2tuYlg5Q2ZrSkFjdHYzU3dn?=
 =?utf-8?B?QWVHd0QxbnhyRmhsb2pXZk9VdUdYZ3ZBendTVVFFcEh2SnhIdmRzaUtsd2JH?=
 =?utf-8?B?aXZkc1FtUzI4a0RqNUZtUGRuY1ovS0hlNFgyYzlSTUtMazVVbzdpMjlEb3px?=
 =?utf-8?B?L0c4WHErckZsTjA1c1hWT1VxQTYvTWF6N3I3dVpEV3RBeEh6ZW1YUk11L1ph?=
 =?utf-8?B?ZmFXdXNIRGtqc2NoaFh0UFFBZ3lrcllVTVpTMS9JR002WHJNV1VrTEUrZW1D?=
 =?utf-8?B?RWFyRU5mSXM0UlZnd1BDQWNXdHpraDlWbFNlSGlCYmJPQnk3cUlpT0x6OTFr?=
 =?utf-8?B?d1F4UHorUFNjeFQ4V01NUGxVdEZUMUE1ZDdpTUxoZnhkcnRhNVlCL3RHOUpH?=
 =?utf-8?B?VnVCUFpuODl3OGN3MVM0a09GK3VsdnNQWTg0R1RsdlVjQkpMRkJIbUdGamh3?=
 =?utf-8?B?SE00ZnR3NmFwRURsb1FiOFpsbUh5NWtJYkZ5TXZ5dGZqTVlwTjkvK01MYUo4?=
 =?utf-8?B?OGlXNTIyTk9QWXl4UFQ3Q3dxK3ZTOWdNNnR2d1FQdzA4Q2hQc0wyTGpCTUZI?=
 =?utf-8?B?LytmZXdNZUFESGh4cUpJUU9OamltTWJ1R3Y4VWptNC9nbU5pSU9zM1l3Y3pn?=
 =?utf-8?B?OXRaWEc5bmxNcHIyaWNXSHVSVWxyZUYxWWhIZEFnOTFiTjlNMFBjekc5MHFN?=
 =?utf-8?B?WjRlMFE5dStNTW5rcXdGOUZiVGJSN0RnS0pEcVJnSE80dVg3Z3RGb242bjlD?=
 =?utf-8?B?dU9xNmY1SzljazkyRlFaVUVLUjJUdDk2SDlBQmpKMm1Ib0ZJMGErVVA5MkRh?=
 =?utf-8?B?VER1UDhtdDVqS3E4d0tTV0tmKzkycnA4bXluK0U1alRZeWp6VHpCcmNqQ2tz?=
 =?utf-8?B?VUc0Wi9UU3p6ZUJqcVd2R2l3SEU0K3h2NU42L0p0dFc0bVc1NXMrQjlVUkpZ?=
 =?utf-8?B?eDZLWjFOQXF5Q3JnVjlhcVdya2RkQUt0aVJwTlg2YlRnVG9JaGNTWFlmYzZr?=
 =?utf-8?B?ZW51WERmbTcxc0xhTHVLMnFyMm11UXVnKzZpRXlmMWtrRTZzeW1iYWtGeURR?=
 =?utf-8?B?ZW1hOXY2Rkt0SXV3dG5IMi85SVVMVVV1S25JOG81MExiYnE4b21qQjZCUkRk?=
 =?utf-8?B?YnJNRWY1SVRnejRHaVpzSW5CMkFsQXQvQ2NmT3I3UHA4WFNtU1ZJWm16TTNk?=
 =?utf-8?B?bzFhdmlZUkpsMEVrZVF0cnM5TUxjSlpaYmt1SytRRVJla1ZLQmw0RFFyRHg5?=
 =?utf-8?B?TDlYUjJGZWY0a2VSaXZUQ0JpT0hQV1M3VVNzMGs3OUhvT21iNnhqSk9SN0ll?=
 =?utf-8?B?R20vQXFFT0YyRzNYL3lXeENFbXFEcmE2S3BnaVlZWVoyRDNJUkU3eU1EL09a?=
 =?utf-8?B?dGhtYVFoVC81a05mUHJCK1JPNzVibEJFM2dBVTZwN2hlQ3E3dmY0dzR5YjJh?=
 =?utf-8?B?VUV5U1BySm1oaXBqRjVjTlF0QlNVVlNrQVBNVThYcHhuMkNkeW10ekI2ZWNy?=
 =?utf-8?B?dEhsQ0xJQ2ZPK2dNaVJmQXVDNnZRZk9oRnBDdWVSSFVrM2tPQUU4SUFOUVdj?=
 =?utf-8?B?WFpITExQa0Mxb2NIMExiOGFiRlhkVkdBMGNRd2FjV3ZYZzJJYVZ6K0JDZFcx?=
 =?utf-8?B?UmVSeWdnTzBkVXpTeXI0WWJWVG9sdXllM2R4NTJKOU1HL2xWclVJMXlrKzRu?=
 =?utf-8?B?blE5bS82S0R6dE9SSzFod1N0Qlo3dThhNWVPMlJTNzVpSjNoenphR00xZkgx?=
 =?utf-8?B?aFE3SFE4VllqVGdPSDB4eTZnRERHZjRDdFNaeUI4OVg4K3BxV053OWxHd2N5?=
 =?utf-8?B?UFBaTzBqZ05ZOUN5OWs2TjZRa1VrekR3VkNFVXhleENUL2tsc2N3Y29iV1Vp?=
 =?utf-8?B?elRQTEZ1RXZCcnpxVEJueXNrM2NIVE5xb3ZzMERNZFVETC9WaWFJc1QwNFlj?=
 =?utf-8?B?SzZhM0Z6b2EwUVVmVjZ4Q01xWXZuYy8xSUJ4R3YwYlpWTVhNbkQyQWJqalV1?=
 =?utf-8?B?eFUwUGQvU0ZUaGppU2dVZWVUQkhucUU5STZaU3Q0NWRpeVRwR1RNS01pd3FT?=
 =?utf-8?Q?yrCuNu?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS7PR12MB6005.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(38070700021); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?WVAwLzVabTdDSmkxZDN5Y2Q0SWplc2ZBM0VpbFQ4MjlHVjhZaUhmM3J6dGpV?=
 =?utf-8?B?N0M3c09tMnJQU0tMRmxJQmNOeDIrUFJkbVVSd08wMTdEdjF2bit0T1Z0UnJh?=
 =?utf-8?B?b04zYjI3UzlrNmpIODdyNGoxWWJ2U3lEUzRXSEUwZTIyRWhUZEw5eE85VGFB?=
 =?utf-8?B?U0hhRUVPMllkVVZ0bFR2YnBHUExqOXhBdU1SNS8ybU1UZUgvSXFGYmU4RElO?=
 =?utf-8?B?K0duNjdxZjJESG1HbWJjcEVFZkw3c0pYb1llYm5QVUMvV2xPaldFODdsYWdG?=
 =?utf-8?B?UXNyNEpUcWQ3dzVKa05tRi9KR3MyWlBlQ2ZRZUQ5ZHZuaSt1bEs1UTlBWm0w?=
 =?utf-8?B?QlBVaFdFbGxhR1BsMjdjWTMrSGFBUWh4NXBxM3pXUmxTVVdnZmRndjYyOWJ0?=
 =?utf-8?B?NmlYT0hBSlZpUlE3TEQ1bVdXSUtjREt6UkFvZHdGQndmYWJqUkQ2THovVUJz?=
 =?utf-8?B?MVlUQmswL2E3bTh2Z29FclVJeUZNc0Q0N1c1Nld6NlgzNnpVY2hoWGJpcExO?=
 =?utf-8?B?emY3UDRvZ29Td3U1TnpDQTdQeHh3VURMQy82QW9VODFNcjVEYTNha1h0Szhr?=
 =?utf-8?B?UkNYSStTZmIvbksrOG9lbFR3ZlczVDBIVjFKaVNwU1N0ZnRHL29nQkhWeTFm?=
 =?utf-8?B?UXVUUTVCMVYrcnNJWXpmeURadFR6Z1I3bFk1RkFOenR0MUt0VUVDSWxvS095?=
 =?utf-8?B?TW5GYUJibGVoN3ZqbmMyNzg1RHBwSDNiVzg2d2xBVkUwL2VrcXJIZFA4Smt6?=
 =?utf-8?B?UUlJVUhjTHB4c2JOM25XT1g0V2JzT1BZSHVOZjMvN3ZZZStwemhQZVE1Z3NB?=
 =?utf-8?B?cWJZV1p2NitaNGtLR3dpSmNmQWVIQ3l3Y09BSkg2VE5taTBxUU5Xa1dSajdF?=
 =?utf-8?B?Mjd2OGxNY0phbk5lRytsbzBrWXFhTEc5SzFyNFNjWDMvN1MxSjJNMjJVTUlR?=
 =?utf-8?B?c3UzRVQzOVBkR0VFTFlwbDM1L2hGMFZvczJzME5PYlZ4ek11QmtPaW1lVzUr?=
 =?utf-8?B?UkRiQllnSWVRdWdkWW5aOERQTGR4R1VoWm9IMS81R3Zzek0zU2VrNWRrSVN5?=
 =?utf-8?B?bllRYUxvR2pHQ2NraUZHMnlMa1NTUnEzbElEWEovdHV3QmNLN29PWXJ6UitM?=
 =?utf-8?B?S1ZSZ0dZKytVOFZkS1gyNEc4UUp6RzlIYUw1dWdjY2tjdFY5N3NUb000MWg2?=
 =?utf-8?B?dGVsd1liVnFMVHd1QkkzY3NHRWRtNnRUMC9la3o0ZU1YRlBYTzdHaVd0YTFu?=
 =?utf-8?B?WU1tSmFETGhvSS95VWY5QUp6R2RDb01oTXY4cTRtbCtIcmUwTzVDcWpnUHBS?=
 =?utf-8?B?YktqRUtQTml3RTkxVlg5d2p6R0NiWG5KU2Qxc3YrcW1id0J2N1R4L2pNelNi?=
 =?utf-8?B?MEFlb3YzcFZmL0RLcWtRNGNvb1E3YU9jNkN0ZjcyY1RSUEZXU3NqWmVURlNK?=
 =?utf-8?B?d0JlK1c4cWZ2b0VrQ2pnWEpyUWVyY1M1enhoOW1jTmVvVC91VENuMm5JVUFH?=
 =?utf-8?B?TjRQTXFvb0lSR3VtSFdRejlWaWxqQlpXcVBIS1BlUXUwZXZvbWdHTTFzK1R6?=
 =?utf-8?B?UWhjamc2YldCem4xSktNUFU3a3BLNEJpZ2p3UGhsby9nK0FXT1N6cUY2am1M?=
 =?utf-8?B?TDJqWWcyL0MzQlhscFhNNmNWZEJVSTJjZnpuWkJ1S29PNGtiTFVZQzJCM0Vh?=
 =?utf-8?B?Y3d6U2VtZTZlM0d5L3NVb2RNZU42SmFub1ZENWtFczNzc1E1UWNlSWdOTld2?=
 =?utf-8?B?V3Z2SVFUN1J6dVllMGcwVzd5QUdiK04vekNnYWtkVGdpRzBGVU9rQzNrRVZ0?=
 =?utf-8?B?MjA4d2MvQ3VMcHV0dHlsSWdNUjljUDRXc3R0S0MzK0hGTTBqMFcrWjVtMERq?=
 =?utf-8?B?Zm9VMkRJY0dPWGtoS3hMVDZNanRYQ0ZBd0taK1h2eEZnZitnN2ZXRGhNeTY4?=
 =?utf-8?B?YmYvcm1JL0thYk5ZRXkxL21OdzR5M0VUNE50eXZvYTZpMWw2Rjl1eEE2Uldl?=
 =?utf-8?B?MjVxRzVSVENYYzU5Tnd3UDJKaTA4ZVFxVjJER2NwWFR2MTJEZWUyV3cyTVBD?=
 =?utf-8?B?MzlwNENXdlV1MEROdWpySUxnWWp1ZCtLNmhlQTMrQ2FSc2dUVTRCa0VKK1Vq?=
 =?utf-8?Q?iFzU=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS7PR12MB6005.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 34314009-7332-4035-3e98-08ddff1fa62b
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Sep 2025 06:15:55.3215 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: epVAvqqWs7YPfHep/fE4AM9u+J9O+Vdw040oapn6ELlPwznCCCu2P39Wx37d5AOK
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR12MB8530
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

W1B1YmxpY10NCg0KUmVnYXJkcywNCiAgICAgIFByaWtlDQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNz
YWdlLS0tLS0NCj4gRnJvbTogTGlhbmcsIFByaWtlDQo+IFNlbnQ6IEZyaWRheSwgU2VwdGVtYmVy
IDE5LCAyMDI1IDEwOjUxIEFNDQo+IFRvOiBLb2VuaWcsIENocmlzdGlhbiA8Q2hyaXN0aWFuLktv
ZW5pZ0BhbWQuY29tPjsgRGFuIENhcnBlbnRlcg0KPiA8ZGFuLmNhcnBlbnRlckBsaW5hcm8ub3Jn
Pg0KPiBDYzogRGV1Y2hlciwgQWxleGFuZGVyIDxBbGV4YW5kZXIuRGV1Y2hlckBhbWQuY29tPjsg
RGF2aWQgQWlybGllDQo+IDxhaXJsaWVkQGdtYWlsLmNvbT47IFNpbW9uYSBWZXR0ZXIgPHNpbW9u
YUBmZndsbC5jaD47IFNoYXJtYSwgU2hhc2hhbmsNCj4gPFNoYXNoYW5rLlNoYXJtYUBhbWQuY29t
PjsgQXJ2aW5kIFlhZGF2IDxBcnZpbmQuWWFkYXZAYW1kLmNvbT47IEtoYXRyaSwNCj4gU3VuaWwg
PFN1bmlsLktoYXRyaUBhbWQuY29tPjsgWmhhbmcsIEplc3NlKEppZSkgPEplc3NlLlpoYW5nQGFt
ZC5jb20+Ow0KPiBQYW5lZXIgU2VsdmFtLCBBcnVucHJhdmluIDxBcnVucHJhdmluLlBhbmVlclNl
bHZhbUBhbWQuY29tPjsgYW1kLQ0KPiBnZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnOyBkcmktZGV2
ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnOyBsaW51eC0NCj4ga2VybmVsQHZnZXIua2VybmVsLm9y
Zzsga2VybmVsLWphbml0b3JzQHZnZXIua2VybmVsLm9yZw0KPiBTdWJqZWN0OiBSRTogW1BBVENI
IG5leHRdIGRybS9hbWRncHUvdXNlcnE6IEZpeCBlcnJvciBjb2RlcyBpbg0KPiBtZXNfdXNlcnFf
bXFkX2NyZWF0ZSgpDQo+DQo+DQo+DQo+IFJlZ2FyZHMsDQo+ICAgICAgIFByaWtlDQo+DQo+ID4g
LS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gPiBGcm9tOiBLb2VuaWcsIENocmlzdGlhbiA8
Q2hyaXN0aWFuLktvZW5pZ0BhbWQuY29tPg0KPiA+IFNlbnQ6IFRodXJzZGF5LCBTZXB0ZW1iZXIg
MTgsIDIwMjUgNTo1NyBQTQ0KPiA+IFRvOiBEYW4gQ2FycGVudGVyIDxkYW4uY2FycGVudGVyQGxp
bmFyby5vcmc+OyBMaWFuZywgUHJpa2UNCj4gPiA8UHJpa2UuTGlhbmdAYW1kLmNvbT4NCj4gPiBD
YzogRGV1Y2hlciwgQWxleGFuZGVyIDxBbGV4YW5kZXIuRGV1Y2hlckBhbWQuY29tPjsgRGF2aWQg
QWlybGllDQo+ID4gPGFpcmxpZWRAZ21haWwuY29tPjsgU2ltb25hIFZldHRlciA8c2ltb25hQGZm
d2xsLmNoPjsgU2hhcm1hLCBTaGFzaGFuaw0KPiA+IDxTaGFzaGFuay5TaGFybWFAYW1kLmNvbT47
IEFydmluZCBZYWRhdiA8QXJ2aW5kLllhZGF2QGFtZC5jb20+Ow0KPiA+IEtoYXRyaSwgU3VuaWwg
PFN1bmlsLktoYXRyaUBhbWQuY29tPjsgWmhhbmcsIEplc3NlKEppZSkNCj4gPiA8SmVzc2UuWmhh
bmdAYW1kLmNvbT47IFBhbmVlciBTZWx2YW0sIEFydW5wcmF2aW4NCj4gPiA8QXJ1bnByYXZpbi5Q
YW5lZXJTZWx2YW1AYW1kLmNvbT47IGFtZC0gZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZzsNCj4g
PiBkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnOyBsaW51eC0ga2VybmVsQHZnZXIua2Vy
bmVsLm9yZzsNCj4gPiBrZXJuZWwtamFuaXRvcnNAdmdlci5rZXJuZWwub3JnDQo+ID4gU3ViamVj
dDogUmU6IFtQQVRDSCBuZXh0XSBkcm0vYW1kZ3B1L3VzZXJxOiBGaXggZXJyb3IgY29kZXMgaW4N
Cj4gPiBtZXNfdXNlcnFfbXFkX2NyZWF0ZSgpDQo+ID4NCj4gPg0KPiA+DQo+ID4gT24gMTguMDku
MjUgMTE6NDYsIERhbiBDYXJwZW50ZXIgd3JvdGU6DQo+ID4gPiBSZXR1cm4gdGhlIGVycm9yIGNv
ZGUgaWYgYW1kZ3B1X3VzZXJxX2lucHV0X3ZhX3ZhbGlkYXRlKCkgZmFpbHMuDQo+ID4gPiBEb24n
dCByZXR1cm4gc3VjY2Vzcy4NCj4gPiA+DQo+ID4gPiBGaXhlczogOWU0NmI4YmIwNTM5ICgiZHJt
L2FtZGdwdTogdmFsaWRhdGUgdXNlcnEgYnVmZmVyIHZpcnR1YWwNCj4gPiA+IGFkZHJlc3MgYW5k
IHNpemUiKQ0KPiA+ID4gU2lnbmVkLW9mZi1ieTogRGFuIENhcnBlbnRlciA8ZGFuLmNhcnBlbnRl
ckBsaW5hcm8ub3JnPg0KPiA+ID4gLS0tDQo+ID4gPiAgZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRn
cHUvbWVzX3VzZXJxdWV1ZS5jIHwgMTUgKysrKysrKysrLS0tLS0tDQo+ID4gPiAgMSBmaWxlIGNo
YW5nZWQsIDkgaW5zZXJ0aW9ucygrKSwgNiBkZWxldGlvbnMoLSkNCj4gPiA+DQo+ID4gPiBkaWZm
IC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvbWVzX3VzZXJxdWV1ZS5jDQo+ID4g
PiBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L21lc191c2VycXVldWUuYw0KPiA+ID4gaW5k
ZXggMmRiOWIyYzYzNjkzLi43NzViMGJkNWQ2YzQgMTAwNjQ0DQo+ID4gPiAtLS0gYS9kcml2ZXJz
L2dwdS9kcm0vYW1kL2FtZGdwdS9tZXNfdXNlcnF1ZXVlLmMNCj4gPiA+ICsrKyBiL2RyaXZlcnMv
Z3B1L2RybS9hbWQvYW1kZ3B1L21lc191c2VycXVldWUuYw0KPiA+ID4gQEAgLTI5OCw4ICsyOTgs
OSBAQCBzdGF0aWMgaW50IG1lc191c2VycV9tcWRfY3JlYXRlKHN0cnVjdA0KPiA+IGFtZGdwdV91
c2VycV9tZ3IgKnVxX21nciwNCj4gPiA+ICAgICAgICAgICAgICAgICAgIGdvdG8gZnJlZV9tcWQ7
DQo+ID4gPiAgICAgICAgICAgfQ0KPiA+ID4NCj4gPiA+IC0gICAgICAgICBpZiAoYW1kZ3B1X3Vz
ZXJxX2lucHV0X3ZhX3ZhbGlkYXRlKHF1ZXVlLT52bSwgY29tcHV0ZV9tcWQtDQo+ID4gPmVvcF92
YSwNCj4gPiA+IC0gICAgICAgICAgICAgbWF4X3QodTMyLCBQQUdFX1NJWkUsIEFNREdQVV9HUFVf
UEFHRV9TSVpFKSkpDQo+ID4gPiArICAgICAgICAgciA9IGFtZGdwdV91c2VycV9pbnB1dF92YV92
YWxpZGF0ZShxdWV1ZS0+dm0sIGNvbXB1dGVfbXFkLQ0KPiA+ID5lb3BfdmEsDQo+ID4gPiArICAg
ICAgICAgICAgIG1heF90KHUzMiwgUEFHRV9TSVpFLCBBTURHUFVfR1BVX1BBR0VfU0laRSkpOw0K
PiA+DQo+ID4gVGhhdCBjb2RlIGlzIG5vbnNlbnNlIHRvIGJlZ2luIHdpdGgsIEFNREdQVV9HUFVf
UEFHRV9TSVpFIGlzIGFsd2F5cyA8PQ0KPiA+IFBBR0VfU0laRSBvciBvdGhlcndpc2UgdGhlIHdo
b2xlIGRyaXZlciBzdGFjayBkb2Vzbid0IHdvcmsuDQo+ID4NCj4gPiBXZSBzaG91bGQgcHJvYmFi
bHkgZHJvcCB0aGUgbWF4X3QoKSBhcyB3ZWxsLg0KPg0KPiBUaGUgdXNlcnEgRU9QIGJ1ZmZlciBz
aXplIGlzIGRldGVybWluZWQgYnkgdGhlIE1lc2EgZHJpdmVyIHVzaW5nIGRldl9pbmZvLQ0KPiA+
Z2FydF9wYWdlX3NpemUuDQo+IEFjY29yZGluZ2x5LCB3ZSBhbGlnbiB0aGUgZXhwZWN0ZWQgdXNl
cnEgRU9QIHNpemUgd2l0aCBkZXZfaW5mby0+Z2FydF9wYWdlX3NpemUNCj4gYW5kIHVzZSBpdCB0
byB2ZXJpZnkgdGhhdCB0aGUgRU9QIGJ1ZmZlciB3aGV0aGVyIGlzIHJlc2lkZW50IHdpdGhpbiBh
IHZhbGlkIG1hcHBpbmcNCj4gcmFuZ2UuDQpXZSBjb3VsZCBhc3NpZ24gdGhlIHJldHVybiBjb2Rl
IGlubGluZSBpbiB0aGUgaWYoKSBjb25kaXRpb24uIEnigJlsbCBpbmNvcnBvcmF0ZSB0aGlzIGFu
ZCBtYWtlIGl0IGV4cGxpY2l0IGluIHRoZSBmb2xsb3dpbmcgVkEgdHJhY2sgcGF0Y2ggc2V0cy4N
Cg0KUmVnYXJkcywNCiAgUHJpa2UNCj4gVGhhbmtzLA0KPiBQcmlrZQ0KPiA+IFJlZ2FyZHMsDQo+
ID4gQ2hyaXN0aWFuLg0KPiA+DQo+ID4gPiArICAgICAgICAgaWYgKHIpDQo+ID4gPiAgICAgICAg
ICAgICAgICAgICBnb3RvIGZyZWVfbXFkOw0KPiA+ID4NCj4gPiA+ICAgICAgICAgICB1c2VycV9w
cm9wcy0+ZW9wX2dwdV9hZGRyID0gY29tcHV0ZV9tcWQtPmVvcF92YTsgQEAgLTMzMCw4DQo+ID4g
KzMzMSw5DQo+ID4gPiBAQCBzdGF0aWMgaW50IG1lc191c2VycV9tcWRfY3JlYXRlKHN0cnVjdCBh
bWRncHVfdXNlcnFfbWdyICp1cV9tZ3IsDQo+ID4gPiAgICAgICAgICAgdXNlcnFfcHJvcHMtPnRt
el9xdWV1ZSA9DQo+ID4gPiAgICAgICAgICAgICAgICAgICBtcWRfdXNlci0+ZmxhZ3MgJg0KPiA+
IEFNREdQVV9VU0VSUV9DUkVBVEVfRkxBR1NfUVVFVUVfU0VDVVJFOw0KPiA+ID4NCj4gPiA+IC0g
ICAgICAgICBpZiAoYW1kZ3B1X3VzZXJxX2lucHV0X3ZhX3ZhbGlkYXRlKHF1ZXVlLT52bSwgbXFk
X2dmeF92MTEtDQo+ID4gPnNoYWRvd192YSwNCj4gPiA+IC0gICAgICAgICAgICAgc2hhZG93X2lu
Zm8uc2hhZG93X3NpemUpKQ0KPiA+ID4gKyAgICAgICAgIHIgPSBhbWRncHVfdXNlcnFfaW5wdXRf
dmFfdmFsaWRhdGUocXVldWUtPnZtLCBtcWRfZ2Z4X3YxMS0NCj4gPiA+c2hhZG93X3ZhLA0KPiA+
ID4gKyAgICAgICAgICAgICBzaGFkb3dfaW5mby5zaGFkb3dfc2l6ZSk7DQo+ID4gPiArICAgICAg
ICAgaWYgKHIpDQo+ID4gPiAgICAgICAgICAgICAgICAgICBnb3RvIGZyZWVfbXFkOw0KPiA+ID4N
Cj4gPiA+ICAgICAgICAgICBrZnJlZShtcWRfZ2Z4X3YxMSk7DQo+ID4gPiBAQCAtMzUxLDggKzM1
Myw5IEBAIHN0YXRpYyBpbnQgbWVzX3VzZXJxX21xZF9jcmVhdGUoc3RydWN0DQo+ID4gYW1kZ3B1
X3VzZXJxX21nciAqdXFfbWdyLA0KPiA+ID4gICAgICAgICAgICAgICAgICAgZ290byBmcmVlX21x
ZDsNCj4gPiA+ICAgICAgICAgICB9DQo+ID4gPg0KPiA+ID4gLSAgICAgICAgIGlmIChhbWRncHVf
dXNlcnFfaW5wdXRfdmFfdmFsaWRhdGUocXVldWUtPnZtLCBtcWRfc2RtYV92MTEtDQo+ID4gPmNz
YV92YSwNCj4gPiA+IC0gICAgICAgICAgICAgc2hhZG93X2luZm8uY3NhX3NpemUpKQ0KPiA+ID4g
KyAgICAgICAgIHIgPSBhbWRncHVfdXNlcnFfaW5wdXRfdmFfdmFsaWRhdGUocXVldWUtPnZtLCBt
cWRfc2RtYV92MTEtDQo+ID4gPmNzYV92YSwNCj4gPiA+ICsgICAgICAgICAgICAgc2hhZG93X2lu
Zm8uY3NhX3NpemUpOw0KPiA+ID4gKyAgICAgICAgIGlmIChyKQ0KPiA+ID4gICAgICAgICAgICAg
ICAgICAgZ290byBmcmVlX21xZDsNCj4gPiA+DQo+ID4gPiAgICAgICAgICAgdXNlcnFfcHJvcHMt
PmNzYV9hZGRyID0gbXFkX3NkbWFfdjExLT5jc2FfdmE7DQoNCg==
