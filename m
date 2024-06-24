Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C2D4A9143A0
	for <lists+dri-devel@lfdr.de>; Mon, 24 Jun 2024 09:25:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6A21210E386;
	Mon, 24 Jun 2024 07:25:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=habana.ai header.i=@habana.ai header.b="if9bQQBs";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from cluster-b.mailcontrol.com (cluster-b.mailcontrol.com
 [85.115.56.190])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 48F7510E391
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Jun 2024 07:24:59 +0000 (UTC)
Received: from rly32b.srv.mailcontrol.com (localhost [127.0.0.1])
 by rly32b.srv.mailcontrol.com (MailControl) with ESMTP id 45O7Ojgr034581;
 Mon, 24 Jun 2024 08:24:45 +0100
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
 by rly32b.srv.mailcontrol.com (MailControl) id 45O7OLS1031948;
 Mon, 24 Jun 2024 08:24:21 +0100
Received: from EUR03-AM7-obe.outbound.protection.outlook.com
 (mail-am7eur03lp2232.outbound.protection.outlook.com [104.47.51.232])
 by rly32b-eth0.srv.mailcontrol.com (envelope-sender oshpigelman@habana.ai)
 (MIMEDefang) with ESMTP id 45O7OI0l031460
 (TLS bits=256 verify=OK); Mon, 24 Jun 2024 08:24:21 +0100 (BST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MF3SiOZOwtXmlGsjZ4Y6BcNFvOX4DwzBo9Q+uEJi0GOUXL1m+gePMGibNItxhHeCYzcIn6Jeic0+71c6L/9z7zWUO1g8smeEAVeV2DzOyQPSK5bz/j1ZATiEs9ssTDZgOAlotJFhoH9Q4g8Gxm/N262nBP3WlOP7FCatYsmY6XYwUF8hlxhBrb7VFyJeTapn/e2X9Hvq1T3sBeLH1TVkgTjxTkPQPYuA331gD656P1YJC4YN0a8bOqU0g+G45MVf751ExLCc0sAMc8SLwLZYJe6D5dj4zdzaH9i4Yh5mzXqTDshrWeBIe5ogq0398HdjkhFxPK6iaermoTuHQLZtBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ljvw+7IU8RTD2ps7NUiHwBSs8ylinNFPFzhtOiqXkRQ=;
 b=m0Fr3VmWk/7I0pQ7C4xIBDLIbx2iwfdRmeTTEJo5tEbLZ2tsdMbuf0gDPnUN3sOiL+7cCNzU2MijotTuxFhR3GXgkOaamawTrS8PsdQvtiR696EXyWegwAxpxwOHrqkjzj3WU5dVkeeVniVKUzYrXkWnfVK7nIsTkSJdvbfaxz0eb1itFOTc3tH7m1pYT7lVoi1w2O1SoLrEfQz95GMoSUQyl26sI533kyH8Q1hP2IfoD53lGF+EqhkK4HxEi66pjpBTJ0PRlrBypS1kCc6/9vvBFBYjXG8Gl6MsAlk3QZI5PQCh9mR8nN8np7fKGTNFhRmNaNm8FAIxBGMmAbcShA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=habana.ai; dmarc=pass action=none header.from=habana.ai;
 dkim=pass header.d=habana.ai; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=habana.ai; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ljvw+7IU8RTD2ps7NUiHwBSs8ylinNFPFzhtOiqXkRQ=;
 b=if9bQQBsqkPzrRHBsuKYY5DCL63eMIa0X4dQnfcGY0Jd/FDC5dFVGiKE9kx1VH+szXfWtyhDxvhUva3Oet2OpFwxrzF5eBxFlk2fKNn5CaWHdcw/5+tXwtFyPzZu4hvf4VQRV+KtfEzpnOEz2BLqSGLefMQEzjglNesB/W03ELWNZEV4Sa0tgXgSXUCfI+C+DSBHXST10dEhvgA0Ar99ag0x/7ufhCQn73Z8v35P2R4dmurL6usd+uVYuZV4k9pxLW8m5FsBL9qErVvB4TACSKedAb0OosS/15gku5Hwxj48XeQuErnERBQzP4dAyPtf26Mvb3xLI7KBnmqXS+djfQ==
Received: from PAWPR02MB9149.eurprd02.prod.outlook.com (2603:10a6:102:33d::18)
 by DB9PR02MB6617.eurprd02.prod.outlook.com (2603:10a6:10:212::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7698.28; Mon, 24 Jun
 2024 07:24:16 +0000
Received: from PAWPR02MB9149.eurprd02.prod.outlook.com
 ([fe80::90a0:a4f0:72e9:58b9]) by PAWPR02MB9149.eurprd02.prod.outlook.com
 ([fe80::90a0:a4f0:72e9:58b9%3]) with mapi id 15.20.7698.025; Mon, 24 Jun 2024
 07:24:15 +0000
From: Omer Shpigelman <oshpigelman@habana.ai>
To: Leon Romanovsky <leon@kernel.org>
CC: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-rdma@vger.kernel.org" <linux-rdma@vger.kernel.org>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "ogabbay@kernel.org" <ogabbay@kernel.org>,
 Zvika Yehudai <zyehudai@habana.ai>
Subject: Re: [PATCH 04/15] net: hbl_cn: QP state machine
Thread-Topic: [PATCH 04/15] net: hbl_cn: QP state machine
Thread-Index: AQHavWrPJze4juUNfEuFiVLDSv8hgbHL9sCAgAEVMQCAABXugIAADgUAgAARN4CACVMYgA==
Date: Mon, 24 Jun 2024 07:24:15 +0000
Message-ID: <e73c1a51-9288-4bd8-9e12-0d0bcf5738e4@habana.ai>
References: <20240613082208.1439968-1-oshpigelman@habana.ai>
 <20240613082208.1439968-5-oshpigelman@habana.ai>
 <20240617131807.GE6805@unreal>
 <a43d2eaf-e295-4ed4-b66a-3f2e96ea088c@habana.ai>
 <20240618070843.GD4025@unreal>
 <5bac8717-55d8-419d-b7cd-7fcb69fd49fb@habana.ai>
 <20240618090031.GE4025@unreal>
In-Reply-To: <20240618090031.GE4025@unreal>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla Thunderbird
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=habana.ai;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAWPR02MB9149:EE_|DB9PR02MB6617:EE_
x-ms-office365-filtering-correlation-id: b349726e-67dd-4110-8c20-08dc941ea728
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230037|41320700010|366013|1800799021|38070700015; 
x-microsoft-antispam-message-info: =?utf-8?B?QmpZMlkwNlBackpGdTVsdnExUXhBQU5zWUlVbk9MVlRnZFNiNFp1UjkwZXNv?=
 =?utf-8?B?VWhjK3pSejFIRjc1WDZqbm5SVnJDMCt0bHFBODg0dW9kLzc0M21IYlNBWUZ1?=
 =?utf-8?B?czNyUU1lMTBGeSs3ekk2TFdDQmJXTHlhWDBIeWxlQVdydmV2MExqMjUxWWtL?=
 =?utf-8?B?dXlycWhTcWxIejFxNGlQWWZWajNLZ0lxL2N2Z1Y0Z3dhVjlhYXh2TjBSUHA5?=
 =?utf-8?B?MkJ5dW5lWEdyc2FMckpneXVybDhqU2NweGQ2MUo2TmpqUUdES2Y5NlNFTjBy?=
 =?utf-8?B?bmJZSGpGRHZpSklTTHVjTFlFQ0UxV01jaDJYNjF5YW1kZlljK1pETk94c3VT?=
 =?utf-8?B?QzZCSE1nOU9sdmtVLzdJM0VWRG0xY3QzZjVnNXRPZDY0ZmhNL0pOdEZTUnhJ?=
 =?utf-8?B?VDZ2M0lVdGZmNFIvUTZxVTk3bHdYOXR2SThMYjcybjdqZFNHdEJQT0x6Rzdi?=
 =?utf-8?B?dnNmMWxQckVxSmp0Ly9VTDQ2VVBWU0l2aUliNjhvUFE4dGtIZkdyK2RUZVNa?=
 =?utf-8?B?NjF6OVhwNFhLcnAybEFSSitGQmtKa2dMUHoyOS9DOEtMWXoyNzJtQjMyZ2pH?=
 =?utf-8?B?cmkwVnY5dzRsOExuakVDU0JkeGhvWnZSbDZOZG5ZWUVzemNweERjbUNtb2M2?=
 =?utf-8?B?ZDZCMWxzRE1ScXFuMVFhZ0JDY2wxeC9Ockt6REhGdVdzMnpQSHlPMGNEdG5W?=
 =?utf-8?B?WldqdVIwNnJBdVFWYnp6emtvdEhLUEwrWnVNV2p0UG5VWWRxTGdPeG05Wkc2?=
 =?utf-8?B?Z3ZHSmQwUTZ1UE5mRlVGVk5iOXQvTzV0Ry9JVFRWYVFVNkZwSEE2NGJBRlZr?=
 =?utf-8?B?cmJOUkVyS0hReWMybW1LZ2JWWEJPbktoYkoxK0R0Vm9hZ2ttZ1hoQnExb1Bv?=
 =?utf-8?B?Q2JGU0duUXVXQlozbzdRR0M5QVpaTDU3czVBSU1UdHl2MEJTbmtmUGJDNGVr?=
 =?utf-8?B?TkZzY2JxaDZCQnY0dGYrY1laMDJBY296L0EyZzk1TDBHL0JNbzlTRHRDVEds?=
 =?utf-8?B?ckxtbHFPc0prQm1Sb0NaVkVCR3pRTm82ZGw1bjJUd2tVaXdPQlh3L21RSVR0?=
 =?utf-8?B?YldnQ1JFZG9VYUlOSGxvVk9Ha2hPT3ZQNVE2MStFdzZYNXlLdEhyTUVaWVRm?=
 =?utf-8?B?cFMzUmx5aVZGVGY5SnRYdmtTTkdrdTlPU2p0VzdvY290elVWZVRxZjkwWFpt?=
 =?utf-8?B?WGE3Y1RlbDBQOExYcTkzR1F2anlUUFozd3ltM1NoNkRaVld0UEhYQ3AraFBq?=
 =?utf-8?B?bkhwak1haHpxZGI2OUpvS2FGbEtza1FwdUptT2tZV3FrODFxaHBtVnYxSUZ6?=
 =?utf-8?B?ZEwzbWpscndTZ0xzRWhaUkNreHJsNEN3MDhhQ3UzdzRIdmlsdXVkMkE2QVpi?=
 =?utf-8?B?d0hHUDI4WDFpUGhCWUp4UDZiNjJXa2FSQUREVC9jZE9kYjk4RWNRZ1dWL2RE?=
 =?utf-8?B?dXpkWDdudmo4K3hFVk5teGZHN2VwcURmTGtQdGxodDBIRC9oSTlZSG05Qllp?=
 =?utf-8?B?c0FLeW50UjkvczdUODJvYU1ReFFjeWU5b2pJZERSb1VSZDNzWFJtcHVFU015?=
 =?utf-8?B?SXU3ajJ4ellsUG1tSEwxRXhMdUNQWld1N2k5QUVhdkE1UGpmRFJhTGJNSTlT?=
 =?utf-8?B?NUFtTllVa2tWRUNQdjQ5UENHenI4RUEzL1JvT29VS1JvM2VhUXYxNEdzOU51?=
 =?utf-8?B?YjJPRFhQc1JDZ053cXNZWmt1cVIwVk1VNVFYQ2FXK3Y3cTB1TmxONGtwM0RM?=
 =?utf-8?B?T3ozWTkyS2Nxa2dabm9GMHdQbFFqTXk5UlBrTE5aWGduQklObkQxMlJjNTZG?=
 =?utf-8?Q?4U3xQ2nqsvyzhxJLFYjysWO32HpCSS7nRhlcg=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PAWPR02MB9149.eurprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230037)(41320700010)(366013)(1800799021)(38070700015); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?TGdldmo0ekxtWkNnb0wyd3dTU1QvbkpXRHM5WjBJSkpyb1UzVEJUdlRUNGxa?=
 =?utf-8?B?RDdjRzhuRnM0R3JFMjVnY05IOVp0QXNyZ3ZYaE5GcG15bWVWL3A2a2E4bjRG?=
 =?utf-8?B?SlgzdlNVVmFYWE1xdS9oanp0K0E1YTJXbEpLSUNqQ01QdzFoVFpOaUY5ZGVP?=
 =?utf-8?B?Ymprd0FhQUtHS2ptejhTYlRrK2ZISnJhMlk4U3lKWHhJMGVCZ0F6S2lIb0Fp?=
 =?utf-8?B?RFZsNlVvTWdaQzRHemF3eHVkSm1kTGNqVVgzdUhDVjFrSjdwYTFFQzhmNDVI?=
 =?utf-8?B?OGhTaDdHeFRNUkp5OVpBYXNWUHVQdUxXcUMwVTFrYlhHLzNHUTNLTkZWMHNB?=
 =?utf-8?B?eXFPclFTWGZINGxzV1R5SElCTXlReHRJQ0k4WTNrZ0Q2MzFBQ3dMQWYzQjlI?=
 =?utf-8?B?TWduTSttYzhyL0hNSFNXZHhTM256QjV1RUttS2RMMUE4ZE4rb1E5WHBlelVw?=
 =?utf-8?B?eHV3U3FtVFlNOFFtWm00T3k5OWR6MDVRTzBLSFNWbW8yUUliUUZONmFnbnps?=
 =?utf-8?B?aXRpQURkN1dQN2ZPZVluREcrUkVENEljQ05wV2tudDNlUXV4ZWhhbU5jbUR5?=
 =?utf-8?B?ZllUbnpQMW9VWUtmUTlYRDg5ZUJna1FDM1J4emFiTnBPMWpyTGwwSVJBK2dU?=
 =?utf-8?B?enJVWlh0YzYzOFoyZHR5NmVBM1NkWU9FSzVKTmNwU0N1dUVwM1A5RHdYUndF?=
 =?utf-8?B?L3ZzSVdBNHVyRjRyMHpHL0lRZEZNUnpEQitlM2RNbUY2YjZNQVpWc2dGQ2JR?=
 =?utf-8?B?cEpLU1BqNjhndlQydC9EYkIrbWhrdnRzSW9wWHM1OTVXa2RWWU5IeWdtWlVi?=
 =?utf-8?B?YjllRTVmSHkxNmc5ZVpxaEVCMFgrcFM2WEtuZ3NrQm9TYjE1TC9haTVTVWdr?=
 =?utf-8?B?T0hsb1g4WFBGZnVBV1NGQXVIcmZNWE1ZRzNZN0JMTnNLdmJla2doenN6bkQy?=
 =?utf-8?B?MStXeTdaSjY1YThTN3RmZllUTE56NXoxUDE1c0drc0hTV3ZrL3F2SklwVFRK?=
 =?utf-8?B?WDRRc0dvSXJTeUJpa1ZUcm9wVWxINTlMdnc0VTJIc3Rpc1lIamU3WTB6Zk5H?=
 =?utf-8?B?NmNZa0hpbWxLVEdBMnRPZy9mZlVlOGtEa3BBdFQ3OWpwSkJCMXI0SGtxZFhv?=
 =?utf-8?B?Sld6NG1FbFFCVVRvRDJyZVhRaGlnazlPK3F3b0tQbytCejNmMEFRMEViQkJC?=
 =?utf-8?B?UUsweldaTHl1Yk1DNGJZWS9veGoyZkIvb1oxd2U0UndvT2l3QlF3QVQvUnBx?=
 =?utf-8?B?dXR5QWNIUGVQN0tpQ0xFOXV4K2NmTzMxcmFONzFNeGZFNUlzdzFZRE0ybjlJ?=
 =?utf-8?B?UVFJYkdCZDZHaS9tVDFET2h0cHEwZWM4bDdPbkZHb0picUthZ2dNdGVyWmUx?=
 =?utf-8?B?cUQxT2ZTZlAwZjdJMk12aENhRkFGS0c2elF2aDgvSnhGNGdYa0dDNlJMOWtk?=
 =?utf-8?B?ZGRkMFhLbU1rMWkxTm4vYWdlNnhyQ2poUndSNThjQ0ZFbU1sOC96cWRJWkVR?=
 =?utf-8?B?ZktBUXhwRFNuaHp5a3QxY013ZGlqY0d2WDNxU3NnQ0llTWZhMktIK1UrSkN2?=
 =?utf-8?B?MjdxTUZzMjJ5VjVOM3NMREVITE45QS9iT1BZMHRhd1hXSFZTRlJNSlkxREVt?=
 =?utf-8?B?M2plYjQrVmJIaDdmd0gvRjJCRC92bkNZbGkzdk9ha1pmM0N0Skh6d2wxSGZy?=
 =?utf-8?B?MEZlS3NEU0ZtbzRwUnBYNXZwcFQ5REUyUksvRmxEU1FBVCtJMlZYUXpGN0hy?=
 =?utf-8?B?a1FvL0RmQWZWWFpSSmFmVDJ3N3F1bUZRUm44YWw5YlpudWMzMnpKam5sanE2?=
 =?utf-8?B?blpOVkdoS0huQkJvNGpZcDVSVnlhT2t2SmdjOTc5bjVxT0F2SDNQTGl3bkN0?=
 =?utf-8?B?eVR0T2JtSEt6cUt3bXVybDdqc1BmM2M4cm9jaHplOVFobUQvMzlsQjZRT2o5?=
 =?utf-8?B?SngyeFp0NXNSSk0zUWxwWWkxOHJ5QkJZdDlkL1kzSzl0K2U0TDJvczNHZ2kv?=
 =?utf-8?B?MnJ3NU9Pc1hZUjk3c2xzbDhucXNRSnhYSm9BRy83ZUlJTHAwbndDNy9zampK?=
 =?utf-8?B?VEtWRTB6RG5NYmZXUWhhK1dkaGlIWXFzQlRPL2lDVWlZOExJVytEWGdtUFNl?=
 =?utf-8?Q?pOWCr+EQZRVc0sEJ5wRUV9XWg?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <CFE2DEB446F5A444A26C17DE05B9079D@eurprd02.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: +boWZEN1aB6wpnCLHKYWzqdLWu5jAESTWxvhxfpFjWah+L+qEWe682IbOkh1BOHVascPKCgjk2/1QiyRuen8UrgtbBfF4MpSuV1rquuuS6QMEzyCrQFnpIfVIpX6AUWVWGX/U8WjJ16dlfsTXIX8u1gwLkgzTlDpnF/GVI7kKnsvhrQK2d6wAGDTaqH6+l8kJJeHVvB5aYHKsmFwQnoVJswNfwLn+GQwwth+gSxyounc1ELYB7ogI9iL2L5JdiGXQMTonNHurwcNc1MQ9x7Ieq8e7V9sw3iVvDkBAxgD/de0VS5gVx3WQKfMe2bX9GgUgO7cpze8U3HKjEShh++CZ/HTIUfoQgIevaFeVawn2x/ERzvJKaKKJgkq1zaQZShrjGIPQiY62Ozt1NXVEtTD8YNr9SnD8PRf0Ftr9nuqnlyjrzE6QBHdqlLZRm30G2DU5bhEPP93RyeRAB455StQgS+VEFJ572F1f0cR7RqRXodtnywiSdeg232WWeGD1UT1BYbefnuOqj7Zbzvhc9ahqylPwVHuA3xSbvJnOGvJiat7m0fVSbtrdr0ZvlhPUIqmm+XB903UwCyDtagdjn9LczjXn2xcvvW0qsDlpstzLTq7TDhppvtJsF/T3UNPw1nZ
X-OriginatorOrg: habana.ai
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAWPR02MB9149.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b349726e-67dd-4110-8c20-08dc941ea728
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Jun 2024 07:24:15.4006 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 0d4d4539-213c-4ed8-a251-dc9766ba127a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: dDBwqueccAHgI79DkoCuITPr//kGTeDTrg3Mh+n6jrfMSKJGRre1cAHIZv6I3soiKtUc/u1jB1Rzj3cUC4gVpw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR02MB6617
X-MailControlDKIMCheck: cGFzcyBoYWJhbmEuYWkgW3Bhc3Nd
X-MailControl-OutInfo: MTcxOTIxMzg4NzpGUEtleTEucHJpdjpjJbfyoDCua6C2TNWrWFaL5KY/D9cMmrrOi4en9abIJ7jRqmGMtsmDBZE3JASvRYg3PHRD+ffNouVjj7Vdx24NBV5Vuklon7LLRUPc0yw7elAwrBMrNAtvEa9HLL5wfPpdFX6Ru8QXoLJcaXBox/z5Q01dbJ8Cn2bTXwks1fKYSJHLE8Uhp7HTb7busG6nrindoShJ+mGJ6A7OrmREUguIUAyRstePGlpFXX57fGMyIj33jzG0mWt5nFnOiOgp1wn67Xg6cAek/btkIzkVprsq6Mm6vi0USfNrQTUI21NK2YdDrZHwsa5fAfgvRR8iWWKkemOGQsW256rKzNllN3gY
X-Scanned-By: MailControl 44278.2145 (www.mailcontrol.com) on 10.66.1.142
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

T24gNi8xOC8yNCAxMjowMCwgTGVvbiBSb21hbm92c2t5IHdyb3RlOg0KPiBPbiBUdWUsIEp1biAx
OCwgMjAyNCBhdCAwNzo1ODo1NUFNICswMDAwLCBPbWVyIFNocGlnZWxtYW4gd3JvdGU6DQo+PiBP
biA2LzE4LzI0IDEwOjA4LCBMZW9uIFJvbWFub3Zza3kgd3JvdGU6DQo+Pj4gT24gVHVlLCBKdW4g
MTgsIDIwMjQgYXQgMDU6NTA6MTVBTSArMDAwMCwgT21lciBTaHBpZ2VsbWFuIHdyb3RlOg0KPj4+
PiBPbiA2LzE3LzI0IDE2OjE4LCBMZW9uIFJvbWFub3Zza3kgd3JvdGU6DQo+Pj4+PiBbU29tZSBw
ZW9wbGUgd2hvIHJlY2VpdmVkIHRoaXMgbWVzc2FnZSBkb24ndCBvZnRlbiBnZXQgZW1haWwgZnJv
bSBsZW9uQGtlcm5lbC5vcmcuIExlYXJuIHdoeSB0aGlzIGlzIGltcG9ydGFudCBhdCBodHRwczov
L2FrYS5tcy9MZWFybkFib3V0U2VuZGVySWRlbnRpZmljYXRpb24gXQ0KPj4+Pj4NCj4+Pj4+IE9u
IFRodSwgSnVuIDEzLCAyMDI0IGF0IDExOjIxOjU3QU0gKzAzMDAsIE9tZXIgU2hwaWdlbG1hbiB3
cm90ZToNCj4+Pj4+PiBBZGQgYSBjb21tb24gUVAgc3RhdGUgbWFjaGluZSB3aGljaCBoYW5kbGVz
IHRoZSBtb3ZpbmcgZm9yIGEgUVAgZnJvbSBvbmUNCj4+Pj4+PiBzdGF0ZSB0byBhbm90aGVyIGlu
Y2x1ZGluZyBwZXJmb3JtaW5nIG5lY2Vzc2FyeSBjaGVja3MsIGRyYWluaW5nDQo+Pj4+Pj4gaW4t
ZmxpZ2h0IHRyYW5zYWN0aW9ucywgaW52YWxpZGF0aW5nIGNhY2hlcyBhbmQgZXJyb3IgcmVwb3J0
aW5nLg0KPj4+Pj4+DQo+Pj4+Pj4gU2lnbmVkLW9mZi1ieTogT21lciBTaHBpZ2VsbWFuIDxvc2hw
aWdlbG1hbkBoYWJhbmEuYWk+DQo+Pj4+Pj4gQ28tZGV2ZWxvcGVkLWJ5OiBBYmhpbGFzaCBLIFYg
PGt2YWJoaWxhc2hAaGFiYW5hLmFpPg0KPj4+Pj4+IFNpZ25lZC1vZmYtYnk6IEFiaGlsYXNoIEsg
ViA8a3ZhYmhpbGFzaEBoYWJhbmEuYWk+DQo+Pj4+Pj4gQ28tZGV2ZWxvcGVkLWJ5OiBBbmRyZXkg
QWdyYW5vdmljaCA8YWFncmFub3ZpY2hAaGFiYW5hLmFpPg0KPj4+Pj4+IFNpZ25lZC1vZmYtYnk6
IEFuZHJleSBBZ3Jhbm92aWNoIDxhYWdyYW5vdmljaEBoYWJhbmEuYWk+DQo+Pj4+Pj4gQ28tZGV2
ZWxvcGVkLWJ5OiBCaGFyYXQgSmF1aGFyaSA8YmphdWhhcmlAaGFiYW5hLmFpPg0KPj4+Pj4+IFNp
Z25lZC1vZmYtYnk6IEJoYXJhdCBKYXVoYXJpIDxiamF1aGFyaUBoYWJhbmEuYWk+DQo+Pj4+Pj4g
Q28tZGV2ZWxvcGVkLWJ5OiBEYXZpZCBNZXJpaW4gPGRtZXJpaW5AaGFiYW5hLmFpPg0KPj4+Pj4+
IFNpZ25lZC1vZmYtYnk6IERhdmlkIE1lcmlpbiA8ZG1lcmlpbkBoYWJhbmEuYWk+DQo+Pj4+Pj4g
Q28tZGV2ZWxvcGVkLWJ5OiBTYWdpdiBPemVyaSA8c296ZXJpQGhhYmFuYS5haT4NCj4+Pj4+PiBT
aWduZWQtb2ZmLWJ5OiBTYWdpdiBPemVyaSA8c296ZXJpQGhhYmFuYS5haT4NCj4+Pj4+PiBDby1k
ZXZlbG9wZWQtYnk6IFp2aWthIFllaHVkYWkgPHp5ZWh1ZGFpQGhhYmFuYS5haT4NCj4+Pj4+PiBT
aWduZWQtb2ZmLWJ5OiBadmlrYSBZZWh1ZGFpIDx6eWVodWRhaUBoYWJhbmEuYWk+DQo+Pj4+Pj4g
LS0tDQo+Pj4+Pj4gIC4uLi9ldGhlcm5ldC9pbnRlbC9oYmxfY24vY29tbW9uL2hibF9jbl9xcC5j
ICB8IDQ4MCArKysrKysrKysrKysrKysrKy0NCj4+Pj4+PiAgMSBmaWxlIGNoYW5nZWQsIDQ3OSBp
bnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pDQo+Pj4+Pj4NCj4+Pj4+PiBkaWZmIC0tZ2l0IGEv
ZHJpdmVycy9uZXQvZXRoZXJuZXQvaW50ZWwvaGJsX2NuL2NvbW1vbi9oYmxfY25fcXAuYyBiL2Ry
aXZlcnMvbmV0L2V0aGVybmV0L2ludGVsL2hibF9jbi9jb21tb24vaGJsX2NuX3FwLmMNCj4+Pj4+
PiBpbmRleCA5ZGRjMjNiZjgxOTQuLjI2ZWJkZjQ0ODE5MyAxMDA2NDQNCj4+Pj4+PiAtLS0gYS9k
cml2ZXJzL25ldC9ldGhlcm5ldC9pbnRlbC9oYmxfY24vY29tbW9uL2hibF9jbl9xcC5jDQo+Pj4+
Pj4gKysrIGIvZHJpdmVycy9uZXQvZXRoZXJuZXQvaW50ZWwvaGJsX2NuL2NvbW1vbi9oYmxfY25f
cXAuYw0KPj4+Pj4+IEBAIC02LDggKzYsNDg2IEBADQo+Pj4+Pg0KPj4+Pj4gPC4uLj4NCj4+Pj4+
DQo+Pj4+Pj4gKy8qIFRoZSBmb2xsb3dpbmcgdGFibGUgcmVwcmVzZW50cyB0aGUgKHZhbGlkKSBv
cGVyYXRpb25zIHRoYXQgY2FuIGJlIHBlcmZvcm1lZCBvbg0KPj4+Pj4+ICsgKiBhIFFQIGluIG9y
ZGVyIHRvIG1vdmUgaXQgZnJvbSBvbmUgc3RhdGUgdG8gYW5vdGhlcg0KPj4+Pj4+ICsgKiBGb3Ig
ZXhhbXBsZTogYSBRUCBpbiBSVFIgc3RhdGUgY2FuIGJlIG1vdmVkIHRvIFJUUyBzdGF0ZSB1c2lu
ZyB0aGUgQ05fUVBfT1BfUlRSXzJSVFMNCj4+Pj4+PiArICogb3BlcmF0aW9uLg0KPj4+Pj4+ICsg
Ki8NCj4+Pj4+PiArc3RhdGljIGNvbnN0IGVudW0gaGJsX2NuX3FwX3N0YXRlX29wIHFwX3ZhbGlk
X3N0YXRlX29wW0NOX1FQX05VTV9TVEFURV1bQ05fUVBfTlVNX1NUQVRFXSA9IHsNCj4+Pj4+PiAr
ICAgICBbQ05fUVBfU1RBVEVfUkVTRVRdID0gew0KPj4+Pj4+ICsgICAgICAgICAgICAgW0NOX1FQ
X1NUQVRFX1JFU0VUXSAgICAgPSBDTl9RUF9PUF8yUkVTRVQsDQo+Pj4+Pj4gKyAgICAgICAgICAg
ICBbQ05fUVBfU1RBVEVfSU5JVF0gICAgICA9IENOX1FQX09QX1JTVF8ySU5JVCwNCj4+Pj4+PiAr
ICAgICAgICAgICAgIFtDTl9RUF9TVEFURV9TUURdICAgICAgID0gQ05fUVBfT1BfTk9QLA0KPj4+
Pj4+ICsgICAgICAgICAgICAgW0NOX1FQX1NUQVRFX1FQRF0gICAgICAgPSBDTl9RUF9PUF9OT1As
DQo+Pj4+Pj4gKyAgICAgfSwNCj4+Pj4+PiArICAgICBbQ05fUVBfU1RBVEVfSU5JVF0gPSB7DQo+
Pj4+Pj4gKyAgICAgICAgICAgICBbQ05fUVBfU1RBVEVfUkVTRVRdICAgICA9IENOX1FQX09QXzJS
RVNFVCwNCj4+Pj4+PiArICAgICAgICAgICAgIFtDTl9RUF9TVEFURV9FUlJdICAgICAgID0gQ05f
UVBfT1BfMkVSUiwNCj4+Pj4+PiArICAgICAgICAgICAgIFtDTl9RUF9TVEFURV9JTklUXSAgICAg
ID0gQ05fUVBfT1BfTk9QLA0KPj4+Pj4+ICsgICAgICAgICAgICAgW0NOX1FQX1NUQVRFX1JUUl0g
ICAgICAgPSBDTl9RUF9PUF9JTklUXzJSVFIsDQo+Pj4+Pj4gKyAgICAgICAgICAgICBbQ05fUVBf
U1RBVEVfU1FEXSAgICAgICA9IENOX1FQX09QX05PUCwNCj4+Pj4+PiArICAgICAgICAgICAgIFtD
Tl9RUF9TVEFURV9RUERdICAgICAgID0gQ05fUVBfT1BfTk9QLA0KPj4+Pj4+ICsgICAgIH0sDQo+
Pj4+Pj4gKyAgICAgW0NOX1FQX1NUQVRFX1JUUl0gPSB7DQo+Pj4+Pj4gKyAgICAgICAgICAgICBb
Q05fUVBfU1RBVEVfUkVTRVRdICAgICA9IENOX1FQX09QXzJSRVNFVCwNCj4+Pj4+PiArICAgICAg
ICAgICAgIFtDTl9RUF9TVEFURV9FUlJdICAgICAgID0gQ05fUVBfT1BfMkVSUiwNCj4+Pj4+PiAr
ICAgICAgICAgICAgIFtDTl9RUF9TVEFURV9SVFJdICAgICAgID0gQ05fUVBfT1BfUlRSXzJSVFIs
DQo+Pj4+Pj4gKyAgICAgICAgICAgICBbQ05fUVBfU1RBVEVfUlRTXSAgICAgICA9IENOX1FQX09Q
X1JUUl8yUlRTLA0KPj4+Pj4+ICsgICAgICAgICAgICAgW0NOX1FQX1NUQVRFX1NRRF0gICAgICAg
PSBDTl9RUF9PUF9OT1AsDQo+Pj4+Pj4gKyAgICAgICAgICAgICBbQ05fUVBfU1RBVEVfUVBEXSAg
ICAgICA9IENOX1FQX09QX1JUUl8yUVBELA0KPj4+Pj4+ICsgICAgIH0sDQo+Pj4+Pj4gKyAgICAg
W0NOX1FQX1NUQVRFX1JUU10gPSB7DQo+Pj4+Pj4gKyAgICAgICAgICAgICBbQ05fUVBfU1RBVEVf
UkVTRVRdICAgICA9IENOX1FQX09QXzJSRVNFVCwNCj4+Pj4+PiArICAgICAgICAgICAgIFtDTl9R
UF9TVEFURV9FUlJdICAgICAgID0gQ05fUVBfT1BfMkVSUiwNCj4+Pj4+PiArICAgICAgICAgICAg
IFtDTl9RUF9TVEFURV9SVFNdICAgICAgID0gQ05fUVBfT1BfUlRTXzJSVFMsDQo+Pj4+Pj4gKyAg
ICAgICAgICAgICBbQ05fUVBfU1RBVEVfU1FEXSAgICAgICA9IENOX1FQX09QX1JUU18yU1FELA0K
Pj4+Pj4+ICsgICAgICAgICAgICAgW0NOX1FQX1NUQVRFX1FQRF0gICAgICAgPSBDTl9RUF9PUF9S
VFNfMlFQRCwNCj4+Pj4+PiArICAgICAgICAgICAgIFtDTl9RUF9TVEFURV9TUUVSUl0gICAgID0g
Q05fUVBfT1BfUlRTXzJTUUVSUiwNCj4+Pj4+PiArICAgICB9LA0KPj4+Pj4+ICsgICAgIFtDTl9R
UF9TVEFURV9TUURdID0gew0KPj4+Pj4+ICsgICAgICAgICAgICAgW0NOX1FQX1NUQVRFX1JFU0VU
XSAgICAgPSBDTl9RUF9PUF8yUkVTRVQsDQo+Pj4+Pj4gKyAgICAgICAgICAgICBbQ05fUVBfU1RB
VEVfRVJSXSAgICAgICA9IENOX1FQX09QXzJFUlIsDQo+Pj4+Pj4gKyAgICAgICAgICAgICBbQ05f
UVBfU1RBVEVfU1FEXSAgICAgICA9IENOX1FQX09QX1NRRF8yU1FELA0KPj4+Pj4+ICsgICAgICAg
ICAgICAgW0NOX1FQX1NUQVRFX1JUU10gICAgICAgPSBDTl9RUF9PUF9TUURfMlJUUywNCj4+Pj4+
PiArICAgICAgICAgICAgIFtDTl9RUF9TVEFURV9RUERdICAgICAgID0gQ05fUVBfT1BfU1FEXzJR
UEQsDQo+Pj4+Pj4gKyAgICAgICAgICAgICBbQ05fUVBfU1RBVEVfU1FFUlJdICAgICA9IENOX1FQ
X09QX1NRRF8yU1FfRVJSLA0KPj4+Pj4+ICsgICAgIH0sDQo+Pj4+Pj4gKyAgICAgW0NOX1FQX1NU
QVRFX1FQRF0gPSB7DQo+Pj4+Pj4gKyAgICAgICAgICAgICBbQ05fUVBfU1RBVEVfUkVTRVRdICAg
ICA9IENOX1FQX09QXzJSRVNFVCwNCj4+Pj4+PiArICAgICAgICAgICAgIFtDTl9RUF9TVEFURV9F
UlJdICAgICAgID0gQ05fUVBfT1BfMkVSUiwNCj4+Pj4+PiArICAgICAgICAgICAgIFtDTl9RUF9T
VEFURV9TUURdICAgICAgID0gQ05fUVBfT1BfTk9QLA0KPj4+Pj4+ICsgICAgICAgICAgICAgW0NO
X1FQX1NUQVRFX1FQRF0gICAgICAgPSBDTl9RUF9PUF9OT1AsDQo+Pj4+Pj4gKyAgICAgICAgICAg
ICBbQ05fUVBfU1RBVEVfUlRSXSAgICAgICA9IENOX1FQX09QX1FQRF8yUlRSLA0KPj4+Pj4+ICsg
ICAgIH0sDQo+Pj4+Pj4gKyAgICAgW0NOX1FQX1NUQVRFX1NRRVJSXSA9IHsNCj4+Pj4+PiArICAg
ICAgICAgICAgIFtDTl9RUF9TVEFURV9SRVNFVF0gICAgID0gQ05fUVBfT1BfMlJFU0VULA0KPj4+
Pj4+ICsgICAgICAgICAgICAgW0NOX1FQX1NUQVRFX0VSUl0gICAgICAgPSBDTl9RUF9PUF8yRVJS
LA0KPj4+Pj4+ICsgICAgICAgICAgICAgW0NOX1FQX1NUQVRFX1NRRF0gICAgICAgPSBDTl9RUF9P
UF9TUV9FUlJfMlNRRCwNCj4+Pj4+PiArICAgICAgICAgICAgIFtDTl9RUF9TVEFURV9TUUVSUl0g
ICAgID0gQ05fUVBfT1BfTk9QLA0KPj4+Pj4+ICsgICAgIH0sDQo+Pj4+Pj4gKyAgICAgW0NOX1FQ
X1NUQVRFX0VSUl0gPSB7DQo+Pj4+Pj4gKyAgICAgICAgICAgICBbQ05fUVBfU1RBVEVfUkVTRVRd
ICAgICA9IENOX1FQX09QXzJSRVNFVCwNCj4+Pj4+PiArICAgICAgICAgICAgIFtDTl9RUF9TVEFU
RV9FUlJdICAgICAgID0gQ05fUVBfT1BfMkVSUiwNCj4+Pj4+PiArICAgICB9DQo+Pj4+Pj4gK307
DQo+Pj4+Pg0KPj4+Pj4gSSBkb24ndCB1bmRlcnN0YW5kIHdoeSBJQlRBIFFQIHN0YXRlIG1hY2hp
bmUgaXMgZGVjbGFyZWQgaW4gRVRIIGRyaXZlcg0KPj4+Pj4gYW5kIG5vdCBpbiBJQiBkcml2ZXIu
DQo+Pj4+Pg0KPj4+Pg0KPj4+PiBJbXBsZW1lbnRpbmcgdGhlIGFjdHVhbCB0cmFuc2l0aW9ucyBi
ZXR3ZWVuIHRoZSBzdGF0ZXMgcmVxdWlyZXMgZnVsbA0KPj4+PiBrbm93bGVkZ2Ugb2YgdGhlIEhX
IGUuZy4gd2hlbiB0byBmbHVzaCwgY2FjaGUgaW52YWxpZGF0aW9uLCB0aW1lb3V0cy4NCj4+Pj4g
T3VyIElCIGRyaXZlciBpcyBhZ25vc3RpYyB0byB0aGUgQVNJQyB0eXBlIGJ5IGRlc2lnbi4gTm90
ZSB0aGF0IG1vcmUgQVNJQw0KPj4+PiBnZW5lcmF0aW9ucyBhcmUgcGxhbm5lZCB0byBiZSBhZGRl
ZCBhbmQgdGhlIElCIGRyaXZlciBzaG91bGQgbm90IGJlIGF3YXJlDQo+Pj4+IG9mIHRoZXNlIGFk
ZGl0aW9uYWwgSFdzLg0KPj4+PiBIZW5jZSB3ZSBpbXBsZW1ldGVkIHRoZSBRUCBzdGF0ZSBtYWNo
aW5lIGluIHRoZSBDTiBkcml2ZXIgd2hpY2ggaXMgYXdhcmUNCj4+Pj4gb2YgdGhlIGFjdHVhbCBI
Vy4NCj4+Pg0KPj4+IFNvbWVob3cgQUxMIG90aGVyIElCIGRyaXZlcnMgYXJlIGFibGUgdG8gaW1w
bGVtZW50IHRoaXMgbG9naWMgaW4gdGhlIElCLA0KPj4+IHdoaWxlIHN1cHBvcnRpbmcgbXVsdGlw
bGUgQVNJQ3MuIEkgZG9uJ3Qgc2VlIGEgcmVhc29uIHdoeSB5b3UgY2FuJ3QgZG8NCj4+PiB0aGUg
c2FtZS4NCj4+Pg0KPj4NCj4+IElmIHdlIGFyZSByZWZlcnJpbmcgdG8gdGhpcyBhY3R1YWwgdGFi
bGUsIHRoZW4gSSBjYW4gbW92ZSBpdCB0byB0aGUgSUINCj4+IGRyaXZlciBhbmQgdGhlIENOIGRy
aXZlciB3aWxsIGZldGNoIHRoZSBuZWVkZWQgb3Bjb2RlIHZpYSBhIGZ1bmN0aW9uDQo+PiBwb2lu
dGVyLg0KPj4gSXMgdGhhdCBvaz8NCj4gDQo+IFRoaXMgdGFibGUgc3BvdHRlZCBteSBhdHRlbnRp
b24sIGJ1dCByaWdodCBzZXBhcmF0aW9uIHNob3VsZG4ndCBiZSBsaW1pdGVkDQo+IHRvIG9ubHkg
dGhpcyB0YWJsZS4gVGhlIG91dGNvbWUgb2YgdGhpcyBjb252ZXJzYXRpb24gc2hvdWxkIGJlOg0K
PiAiSUIgc3BlY2lmaWMgbG9naWMgc2hvdWxkIGJlIGluIElCIGRyaXZlciwgYW5kIENOIGRyaXZl
ciBzaG91bGQgYmUgYWJsZSB0bw0KPiBoYW5kbGUgb25seSBsb3ctbGV2ZWwgb3BlcmF0aW9ucyIu
DQo+IA0KPiBUaGFua3MNCg0KT2ssIEknbGwgY2hlY2sgaG93IHdlIGNhbiBtb3ZlIHRoZSBJQiBz
cGVjaWZpYyBsb2dpYyB0byB0aGUgSUIgZHJpdmVyLg0K
