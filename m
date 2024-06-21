Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BE7A91226F
	for <lists+dri-devel@lfdr.de>; Fri, 21 Jun 2024 12:30:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 75D4910E10C;
	Fri, 21 Jun 2024 10:30:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=marvell.com header.i=@marvell.com header.b="dQrzCNes";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0016f401.pphosted.com (mx0b-0016f401.pphosted.com
 [67.231.156.173])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE68410E10C
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Jun 2024 10:30:33 +0000 (UTC)
Received: from pps.filterd (m0045851.ppops.net [127.0.0.1])
 by mx0b-0016f401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45L3WEYm011456;
 Fri, 21 Jun 2024 03:30:21 -0700
Received: from nam04-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam04lp2169.outbound.protection.outlook.com [104.47.73.169])
 by mx0b-0016f401.pphosted.com (PPS) with ESMTPS id 3yvrj3ba63-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 21 Jun 2024 03:30:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TQb+JYsma3kQZBR5BeljyCicOiQm6lz8y8nEKKzSGN/SdOJhnVt29EGCZWbHJVDOZPAwECXguBdwJFcDOwGJiymsxp6CnnX1KkdfGsGkkdlCLZniyoEYdNNCRygPJUEV715LRGtdO60VKSNvyUvQGaN9HjhGH3XHoJlqHNr+vkEClmGq+wcpTuvKLhG6I2nZetS8igpYUIz60dDIOGQRoxKsPRsnj6szNvL/Uu1l/W5ewSqYQVzAcB+kvupNepniYttiTPSnWP85U7x4iGD6MuxNoxmw99Wep560DK/NPMKo9xromsB7T4W8VqSBGgUUlnbTTrl0N4c03FZmGXgUeg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uGSetLINLTfRX0fm22kpg95zvRvYLt+kgMSK63RAs3Q=;
 b=QL/pRcd4PtDuqpibyU9EFOeCg7nW255Y+d88vHuJHi30TR5gTmp++SdpafT+C3ZMokhs7xXyGlZ89fk7iJTXstnhPrKc2piunkoNsRbOL1QAhm1mOTE/6tts8auoeW0Z6xcYdiL+zOyKjmUOMCpmqUWnLlDLBxqnaHeMOdqkBybs+AGY7f0wM4zCcr8fQL4gynCgy8qrbNbPaN8UhEDJ26aBkgotHxBi2oHyC9Vp3fSZSkCc9Kvb/rk66EW4cSi5R2USiG1dVGCOBmgTYmHVceZZ74oS5CWzmk9VxIcpXTrj6DqceFBeXY8y2oG/Czw/S4PafsTTFndhaUi3BCmNuQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=marvell.com; dmarc=pass action=none header.from=marvell.com;
 dkim=pass header.d=marvell.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=marvell.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uGSetLINLTfRX0fm22kpg95zvRvYLt+kgMSK63RAs3Q=;
 b=dQrzCNesurJVGwjgaLZd501dz0Y15b6Fb9l0iSvE0EFFyTb101ASWz2ihN+/f8/fDKdQWtp4rekkHQw7GCj2C4zfM6xFHhOGIi8pRhxyuuyEm4D/+tZgy2WHjowM15pg9hlve7wn410FZoDOp+Mim3wuJx37+j7MraNrtRPrdqQ=
Received: from BY3PR18MB4737.namprd18.prod.outlook.com (2603:10b6:a03:3c8::7)
 by SA0PR18MB3520.namprd18.prod.outlook.com (2603:10b6:806:96::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7698.21; Fri, 21 Jun
 2024 10:30:19 +0000
Received: from BY3PR18MB4737.namprd18.prod.outlook.com
 ([fe80::1598:abb8:3973:da4e]) by BY3PR18MB4737.namprd18.prod.outlook.com
 ([fe80::1598:abb8:3973:da4e%5]) with mapi id 15.20.7698.020; Fri, 21 Jun 2024
 10:30:18 +0000
From: Sunil Kovvuri Goutham <sgoutham@marvell.com>
To: Omer Shpigelman <oshpigelman@habana.ai>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "linux-rdma@vger.kernel.org"
 <linux-rdma@vger.kernel.org>, "netdev@vger.kernel.org"
 <netdev@vger.kernel.org>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>
CC: "ogabbay@kernel.org" <ogabbay@kernel.org>, Zvika Yehudai
 <zyehudai@habana.ai>
Subject: RE: [PATCH 06/15] net: hbl_cn: debugfs support
Thread-Topic: [PATCH 06/15] net: hbl_cn: debugfs support
Thread-Index: AQHawndlNaIwRtcBdEGH7Y0EfiL4XrHSA6QAgAAC4GA=
Date: Fri, 21 Jun 2024 10:30:18 +0000
Message-ID: <BY3PR18MB47373D1A7ACBDB92DDDAB655C6C92@BY3PR18MB4737.namprd18.prod.outlook.com>
References: <20240613082208.1439968-1-oshpigelman@habana.ai>
 <20240613082208.1439968-7-oshpigelman@habana.ai>
 <BY3PR18MB473757A4F450A2F5C115D5A9C6CF2@BY3PR18MB4737.namprd18.prod.outlook.com>
 <ac16e551-b8d6-4ca7-9e3c-f2e8de613947@habana.ai>
In-Reply-To: <ac16e551-b8d6-4ca7-9e3c-f2e8de613947@habana.ai>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BY3PR18MB4737:EE_|SA0PR18MB3520:EE_
x-ms-office365-filtering-correlation-id: 4eb3f877-cc5b-4eb6-1bd0-08dc91dd25e0
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230037|1800799021|376011|366013|38070700015;
x-microsoft-antispam-message-info: =?utf-8?B?bzJ6ZG5RSWFiVFhiMTB6dm9RWlZYQW56c05xMXlyQk5MQWpWODdjUWNPSjNw?=
 =?utf-8?B?WEVSQXZWcG9ka3FDQzFsSWRXMXhtOCtacCtKVDBOaFRlVnh5bXYyR3hBVUtp?=
 =?utf-8?B?Si80aDhCYkxWbTNxRGdmMHVzUWgyUG5ycFhGWmtOUnF0aThtQ1ZHWGV6bW83?=
 =?utf-8?B?ckJMbTNOWEo0dzI1Z0xqT2pYT0FaZTFqejdQcFVUTC9EUXgzZzZZY1lRSFUy?=
 =?utf-8?B?WW8xZ0FYZ1RTQVNWRnFmNXpleU5zL1pxdTR2czMxTmlpUGd2MnJiY0hwUUtn?=
 =?utf-8?B?amMvTnpOWmtxa1E4ejF4cWhXNVlXUEpvSExoK29MaWtRNURtRmk2UlJzL3BL?=
 =?utf-8?B?SzJPS1VIK2ZRNXR0S1AvanVTSUxVdkNUYm53WDVXd2pGNWFwcTRIWXpHOVV6?=
 =?utf-8?B?cWZQT0ZXcEZYRENZUzlJb0RTckhUMlNjTmhKWWZUcGdVZjJJN1AyVjZsSXBG?=
 =?utf-8?B?bDBtdVMzUUtBN0plSVJIaWRCT0Z5NjdwZ1pYQU8yWXF4VzVQNXNTSGpaV1FM?=
 =?utf-8?B?azUyL0dXNW0rQkpKM000MUdZZkx5ZTZIZDRhYUFvNnEwTzkyOExud2ZZc1px?=
 =?utf-8?B?amRqdG4zOWI2SlByZ2JKYm9EN3BjZk5sNEhBMmJrNzYrSEhpa3FEZXZYK1po?=
 =?utf-8?B?RWJrYnI3My9BK1A1M00yZU9uZVZ6ZmtVNXRoVUZRcEsyRmhTTWtleDhvZGlq?=
 =?utf-8?B?VUY1NktUK0cxeU56MXIvb1VyclVWK0wvYkg5WjNCWkNwK3B6ZzFqd0hFMGdX?=
 =?utf-8?B?Y2FYUFRSc2xHVjZQQXNnZjNKaTRVZHZ3VVhvK3NhNWtDRUhHdlVYTDFUYUN6?=
 =?utf-8?B?dnlNcTJ5NHRQMGVya3lQalpUNGc1am1HT1ZIT1FVQyt1OEY5bWtRMHlOaHQ5?=
 =?utf-8?B?MzlRVnl2QkNLU3ZxemYvRDk2VEJjZmh4TTluZ0xjSmJ4NGs3UUVsYmxMYmZQ?=
 =?utf-8?B?bXFGUGVLVVFwUU5Vd1dsZ2dRcEZuR1dZZ00xSTNyQ3ozZE13bEVRM0ZobmFE?=
 =?utf-8?B?UU1GK1BkY0JUejgyR3h1YUVxQnEwSEJoNDcxK2Z5WkRlZThzWHplbEcvdHBS?=
 =?utf-8?B?cmhFdkUrU0tqYU5mbUJ3L3RrZ1ZZb0JhVjhhVllBYWJ6a2lmUFRoakhuS2pN?=
 =?utf-8?B?czZldlZsVWlBeTM5YWFQWmhOcHhVSU85V0ZXZHQ0Q3hLMkJVbHdpNGFVWEZr?=
 =?utf-8?B?dWpGUEpsN3B4MndwNk9iQjY1TTRTclhtTkUyVUE5K0Z2T2NDYjZ4M3A1cmZU?=
 =?utf-8?B?K1FmdWFNQTdQc05VQXhIMnczMDRXbU85TDNtR2JoRk1EZHJWQ0Q3OGZRbzlj?=
 =?utf-8?B?Qkc0cXMwMGppTVhSaUZ5RWo5WkRXMWtMajJIQ3IraU52TC9SNGswY1Mxem1V?=
 =?utf-8?B?TWxSVzJkNkRHSnBxWHNFdnRVN3JpZVgzTFFVTkNVUnNyVHFoSXI0U0kydDBv?=
 =?utf-8?B?TU5uWDE2RkJ5MDBvTTR2TktGV0l6elpDNStMN2VPZXJaakdMUGwyZHFqdk1P?=
 =?utf-8?B?QjFDMUpSTjY1d0lsR3VTejhrWHJNRWVFSzhqOFBTOTNLMDl0NHhRcGRZNGk2?=
 =?utf-8?B?RjVUUHp6MFFBQWNoOVBtWmdnS3V5Vm9oT1JockFuOExnRW5UMWc2SFhUK015?=
 =?utf-8?B?ZkdNQlM4WURTYm04ZlAwNHJiVStVSWJuRjFOT1psdFcwblVRc3N0Sm9iQ0RL?=
 =?utf-8?B?SXRwMUlpVFJrN0hpWE1BWWdKMjV6T2VOcFZYb09TWTQ5d1pCWUg2aWVwdGRL?=
 =?utf-8?B?cnhHVXlnUm53SitrK3Nnc2ZkaVhPZVdJSDNReUlOcStLUFZUWUx3OGNMZUdO?=
 =?utf-8?Q?tzqqknEkmz0YMvR1wUoPXHOTgK8rxXiBCjG/I=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY3PR18MB4737.namprd18.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230037)(1800799021)(376011)(366013)(38070700015); DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?OFhUWjg5d1g5WmlyRFJNSHZ6MlpYWnlvNTcyS3VEbGZaQXZQREVtbGFFTnc3?=
 =?utf-8?B?TGtZUnZkamhnQ1JOUkxFUW9Td2JJZjgrczN5TWF0WkI1Y0wvV3pjSEFuU2JB?=
 =?utf-8?B?bkl6MVdiOXBRNXdzK2toOXFzS1dOdEhUS3RQTHo2UUxYWkhmdzROaGgwQUc4?=
 =?utf-8?B?djVUdzZ2ZDN4TytuaDluWjdid2RiakthbEpUbG5HV2docjkycVZOTXRRckcv?=
 =?utf-8?B?empqUENoS3QrcXhWbnF2SHpNKzA0YlVyeTBjSDFNcE4zd1Y1Qnp5YzY1WFRE?=
 =?utf-8?B?SnNGc2RKRjhkUVVvQ1AwNnFxZ0I5cFl1SjlySEU3Z1VhVWdlcnF1alYzZHpl?=
 =?utf-8?B?K3FrSXNSeWhRUmJFeXBGd2lnZXMzRWpQU3k2Q2QxS1RLTWdUaEpEUjJqMkhH?=
 =?utf-8?B?djl1YndXOENVNkVJZmdQSURMR0ozd2RSQmd2TVVuUUt6ZEFKaUVCZTNZcDQr?=
 =?utf-8?B?SnVicWVFRHRyWlppU3huKzhNWHlUclFyWDBOS1VNcVh1TGs2RHFTTnJkV0lO?=
 =?utf-8?B?V0FHTG9hTExoOEtDcWVNTVZGazUrUnUvTlV4WHNubjdhdHlIbWtiakFxS1cy?=
 =?utf-8?B?cC9rN3VsazY1d29JVnRoazhpdS9vbDFqSnFXUVZuVEx1UUNqSU5uWk1sOU5m?=
 =?utf-8?B?ZHp5Tzl4bHNXb2RnZU83b0xWeEVkU3RFYTE1QytMRnRGOXZSQlVvRUhjQkRF?=
 =?utf-8?B?R0dBMk0xcXRFNDNnRFhnRjBXdlBpbk51L2JNVXJqRlRVaUE2S095MWozTmpw?=
 =?utf-8?B?L3B5TnBPZmNRS3o5d1JjUDVCdk4vZ1U2VHhqeWVYRUsxbXZpT2N3a1VROHpz?=
 =?utf-8?B?SmxEK05mYUNaL0lEMU9Ic2FaL3g0c3ZrOHVCNWlVWnRyOHdhbTJaWVhqZktB?=
 =?utf-8?B?b1EwNzZyRktnU2Fqa3cyR2h3V2NsYlBLWjJoQXErUHl4YTNRK1V4NXUweTFi?=
 =?utf-8?B?MmhnT1ZmRWhtZ1dFUFdud2pBcXRLcUFEbnp4YXJ5aS9MNmFXQVQyWGdhVzk3?=
 =?utf-8?B?SkI5SldhWGh6T0NYOU9hdHZkemZXMkhSVnBhOFh5d3FUclZaWUcxN0tUa2Q2?=
 =?utf-8?B?M015NkhyVWthcEV0SWFxQnVHUDlkUUo5dlIxWElpUXZLc0FweEJnU0YyYkVt?=
 =?utf-8?B?Sk5FbHR0VUhzVnhNUWJzS1NiSitEaXBuK1hSV0NzWlhqKzBqTVA2UUFyK2Fn?=
 =?utf-8?B?Q2Z5T2pZMHhlZmtxY1lGazYwclN5LzcrRmZaUkxhTVBuSThNcENWMm9iRllO?=
 =?utf-8?B?UlkyKzNleXQ5b28wblBRcWRPYVpNSDdPL3dpSkU0YkVpSWw1Yk5pMVFWN2Jq?=
 =?utf-8?B?NmllY3BzSVhBL0ZlcWhlaldJaUVobjFGaHlhN3VNMjRKRzRnSDI4cW9SVEJ3?=
 =?utf-8?B?MFAzTmVPMEtPRXp2Zm9naTMzeXY5M1c4Uzl5NGZSWE1xT0p5R0RHb0wzMXpC?=
 =?utf-8?B?L3ZyWEE5RlNtTFJEa1lLS3pWS080aWhKcmJ3YlFNa1dyc2ZLMEQ5blZJZVow?=
 =?utf-8?B?MjlDR0Jqc3IzRHRZNnZvbXFGZDc4eHo5dnlyenlWWUM2dGlZdzVIY1ZqTGFC?=
 =?utf-8?B?bUhZYVcyQUNKR1NwZ2VFdGdUY1NBQmdqbnNaUXFNZVZNUkF0Q3ZPMjExQmtL?=
 =?utf-8?B?Q1M5VzR4V2VJS1VOREZBVGlSR25iYlp4a3hkcE5GWXR3ZHRwYWNqbHVNYzBY?=
 =?utf-8?B?QUU0TTFFSytKRnR4Ri9vOStSS3hjZUNDcmNQakhhMWloS3VYVDgxYkRnYzVV?=
 =?utf-8?B?b0p5MVVUYW8xN09DK0VhS3hjQkdrc043bzJ6eVNZb1pKMklVa2pTUy9Ta0t5?=
 =?utf-8?B?ZXZOemxFSFhZdE5tRzM3SXZkQklPbENzQ1B6dFBGRHJLRktMSU5GSUhzQkYz?=
 =?utf-8?B?TlZlam1aTHpzSkNxMzBpRUQxUjlNVHoyNElpcUFaOHJMaXdWL0VUYjJ4TzlC?=
 =?utf-8?B?eTh0MStjcVU3anNuVVlGeExsRjh6N2w1TUxSNUxGeWtobUttNVNRRGRjZ1U0?=
 =?utf-8?B?UEtoMUE0NDFzTHR2VWZjT04xRy9RcWpRV1pRcytUVHVNbWVIa3FhMW9JUjhu?=
 =?utf-8?B?TzcvdHVsL1ZvZGtILzB5cWd1c2lHRzBJYlEvd05WM0RiNS9qZW5qcDQ1YlVa?=
 =?utf-8?Q?83toFO0UHg5Up4mCCnban5MRZ?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: marvell.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BY3PR18MB4737.namprd18.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4eb3f877-cc5b-4eb6-1bd0-08dc91dd25e0
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Jun 2024 10:30:18.8667 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 70e1fb47-1155-421d-87fc-2e58f638b6e0
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: GKQoIGo5gBDQHgbkg29vXF6yU/CpY8WaN/NSrHTerhuIQg8Bp495BN+6wKoKHgmDoYMEoozRVzx73dGdL/nBFw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR18MB3520
X-Proofpoint-ORIG-GUID: rrSfUr_X9YyeL94HGiWJKXqbcnYknpzA
X-Proofpoint-GUID: rrSfUr_X9YyeL94HGiWJKXqbcnYknpzA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-21_04,2024-06-20_04,2024-05-17_01
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

Pj4+ICsNCj4+PiArV2hhdDogICAgICAgICAgIC9zeXMva2VybmVsL2RlYnVnL2hhYmFuYWxhYnNf
Y24vaGJsX2NuPG4+L25pY19kaXNhYmxlX2RlY2FwDQo+Pj4gK1doYXQ6ICAgICAgICAgICAvc3lz
L2tlcm5lbC9kZWJ1Zy9oYWJhbmFsYWJzX2NuL2hibF9jbjxuPi9uaWNfaW5qZWN0X3J4X2Vycg0K
Pj4+ICtXaGF0Og0KPi9zeXMva2VybmVsL2RlYnVnL2hhYmFuYWxhYnNfY24vaGJsX2NuPG4+L25p
Y19tYWNfbGFuZV9yZW1hcA0KPj4NCj4+IERvbid0IHRoaW5rIGRlYnVnZnMgaXMgdGhlIGNvcnJl
Y3QgaW50ZXJmYWNlIGZvciBhbGwgdGhpcyBjb25maWd1cmF0aW9uLg0KPj4gRGVidWdmcyBzaG91
bGQgaWRlYWxseSBiZSB1c2VkIGZvciBkdW1waW5nIHJ1bnRpbWUgZGV2aWNlIHN0YXRlIGluZm8g
Zm9yIGRlYnVnDQo+cHVycG9zZXMuDQo+Pg0KPg0KPkkgc2VlIG90aGVyIHZlbmRvcnMgaGF2ZSBk
ZWJ1Z2ZzIGVudHJpZXMgZm9yIGRlYnVnIGNvbmZpZ3VyYXRpb25zIG9yIHNldHRpbmdzLCBub3QN
Cj5qdXN0IGZvciBkdW1waW5nIGRlYnVnIGluZm8uDQo+DQoNCkJ1dCBkaXNhYmxlX2RlY2FwIC8g
bWFjX2xhbmVfcmVtYXAgc2VlbXMgY29uZmlndXJhdGlvbiByZWxhdGVkIHdoaWNoIGNoYW5nZXMg
dGhlIHdheSBwa3RzIGFyZSBwcm9jZXNzZWQgbm90IGRlYnVnLg0KQ29uZmlndXJhdGlvbnMgYXJl
IHN1cHBvcnRlZCB2aWEgZGV2bGluay4NCg0KVGhhbmtzLA0KU3VuaWwuDQo=
