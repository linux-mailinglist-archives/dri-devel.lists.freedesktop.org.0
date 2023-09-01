Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 38DAA78FA0A
	for <lists+dri-devel@lfdr.de>; Fri,  1 Sep 2023 10:37:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 934C810E1A5;
	Fri,  1 Sep 2023 08:37:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 2174 seconds by postgrey-1.36 at gabe;
 Fri, 01 Sep 2023 08:37:03 UTC
Received: from cluster-b.mailcontrol.com (cluster-b.mailcontrol.com
 [85.115.56.190])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 081D810E1A5
 for <dri-devel@lists.freedesktop.org>; Fri,  1 Sep 2023 08:37:02 +0000 (UTC)
Received: (from mailcontrol@localhost)
 by rly12b.srv.mailcontrol.com (MailControl) with ESMTP id 38180Udx081023;
 Fri, 1 Sep 2023 09:00:30 +0100
Received: from rly12b.srv.mailcontrol.com (localhost [127.0.0.1])
 by localhost (envelope-sender ttayar@habana.ai) (MIMEDefang) with ESMTP id
 38180SAg079976
 (TLS bits=256 verify=OK); Fri, 01 Sep 2023 09:00:30 +0100 (BST)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
 by rly12b.srv.mailcontrol.com (MailControl) id 381808N9071193;
 Fri, 1 Sep 2023 09:00:08 +0100
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur01lp2057.outbound.protection.outlook.com [104.47.1.57])
 by rly12b-eth0.srv.mailcontrol.com (envelope-sender ttayar@habana.ai)
 (MIMEDefang) with ESMTP id 381806PL069786
 (TLS bits=256 verify=OK); Fri, 01 Sep 2023 09:00:08 +0100 (BST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LQKiv6twOWVeFEPG+ABpn455RBIFvf2fW5kLqbJOEgxWaNNms8qWQd2KZpcSReifIDa59EKHOMxy7vbguIFRwBlLvyfssW38yDstHYtOZe7F11znL9FAjixQMi2kEwEGTZgQE9+XBaQ+MpV14zeZhemwR+catVuXZP7xexJ2KHo7s5KRp7/1cezUo8D1a4uBxgxCQMW9c3ArJlTQOXtdbzeJu5ZtS12q6B1j3T8nkVMz0uI6FHaSBmmOOyHC9SLXgWELe8wOpXrB/DxnpdUmd2uHfPD35oeWBXRwcxOosl/aibZU/zhyC79/nTVs/huF3QRcoaUYLeW3IyWUvGeFMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0vARNIdZt8DqNjWasY4Z9GTIEoe4cSVWrPxelGP50GU=;
 b=fKqY+CBTU8mQG3WjX2fMtJGRQdd0OxTf1xLfs854GgAyU8oMXtxlI/x+MeenU3thPe/zzHIrrvtwBicAXTMEUhA11OdOtn691eAwRkYhKUiuK7hPJoDHutrXPnHKY3PtIZ7ZOua5Lfbkn3xPVbDdDhXe98Vi2s9cUB2JpU8nK33mTX8WBqRgHNlgqnjtRUyOFyts9qSSXcUNnis9rR5VsAqg3MGK76Q8UiIDqRTyMmYRWNYF+Ym23gjHT+orCzkNVAsJ0P+2ZIOTNX5O+yFi97yGLTx+csLF0da/lp2gA0OENz69GaBRLD/y8YfXJonAVj1ylfF6YBO2QRLgHg3+YQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=habana.ai; dmarc=pass action=none header.from=habana.ai;
 dkim=pass header.d=habana.ai; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=habana.ai; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0vARNIdZt8DqNjWasY4Z9GTIEoe4cSVWrPxelGP50GU=;
 b=dR01wIz+00VXrWJfVs3pcyFSV8rX5+B+s5n0se/rio6WBo8rJTQQGySf2tFr9+FPbZe2SnLDD6quIFJp1ZFq+kISDu6q4OrWw14/GJcPSe9sVw+VXlj0FRKPS2BZwvaqdTR5hjXIBAR8hQTsWrK5LRC+v+AKovXo2x2sBa7hafLgHoo5p/4uORdgSHEaJ0vUQEKpl5XGjc0Lv67g5Y4DAwGc8n5ya2cySreinAG6dUzE+/RkAJOsn7KyuFDz5glxcJe3Hiks6GmUutKHyFSNKZtZHOMrLIoEG2HzT56YzYhbv73fi3etJM6j1UsBVzx+tNqS0rtzs54d6yXVf4a8Lw==
Received: from DU2PR02MB7573.eurprd02.prod.outlook.com (2603:10a6:10:2d8::6)
 by AS8PR02MB10203.eurprd02.prod.outlook.com (2603:10a6:20b:62a::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.35; Fri, 1 Sep
 2023 08:00:04 +0000
Received: from DU2PR02MB7573.eurprd02.prod.outlook.com
 ([fe80::e610:a990:471c:e356]) by DU2PR02MB7573.eurprd02.prod.outlook.com
 ([fe80::e610:a990:471c:e356%7]) with mapi id 15.20.6745.023; Fri, 1 Sep 2023
 08:00:04 +0000
From: Tomer Tayar <ttayar@habana.ai>
To: =?utf-8?B?Q2hyaXN0aWFuIEvDtm5pZw==?= <ckoenig.leichtzumerken@gmail.com>,
 "ogabbay@kernel.org" <ogabbay@kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH 1/5] drm/debugfs: drop debugfs_init() for the render and
 accel node v2
Thread-Topic: [PATCH 1/5] drm/debugfs: drop debugfs_init() for the render and
 accel node v2
Thread-Index: AQHZ2mglJQJnMy75sUGNP/QaJNjOgrAFn9EA
Date: Fri, 1 Sep 2023 08:00:04 +0000
Message-ID: <3b80d8f0-773c-474c-8558-94aad0881549@habana.ai>
References: <20230829110115.3442-1-christian.koenig@amd.com>
 <20230829110115.3442-2-christian.koenig@amd.com>
In-Reply-To: <20230829110115.3442-2-christian.koenig@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla Thunderbird
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=habana.ai;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DU2PR02MB7573:EE_|AS8PR02MB10203:EE_
x-ms-office365-filtering-correlation-id: 0f319f4b-f028-4f2c-3733-08dbaac17389
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: PL8NIF5tLDjp24bWDT269W8ceTJF+Ejs5uuXiPR1LauqbSVS4IVoQQ3opmx5Pa58XQD75Go18zQ+2R554Ro15cjP7rIiCwg2V5ckMGR/5PWGfCVLp8G+X17QFezEBjWZ6U0yckHjwkcbhFXq04Q/tVBXPgkK+i+4m0JgvEJovT3HKOcXMFUKVAwOmb2VnGLXySnaQqkFM73W7Z8hQuQPm3vRzrGMhqaOC7QOqJcVGdrOz8dBVf+p4RsI8pngSZKSbypwIGc4ToUCSUPX/1pt5hjaNP9WEsYlK4mpb/rFHr3qtHfHgwWi21ciYN+25jSHF4/QPxvIFYBqFxAqyEHtDAzFrA2kzLFlMWLEmR+04SQLISiTN+wmh9IdyAb7p5XKfC3z0So3BJouUdp3gbeDTpLq2yIeccumSP/HNHhT1AuOUZJl1OQ12t65vN1RxBdQIcF+resXU1fXuxG4+W9JYSHi4Ln7L0x8nS5qux4sKM3YEU+CtvycyYiV3kbSkDh/bbYqgqmB9lppFYAFiZxX1CF+0E+pxWYmgjCVdI7HJYEP2euM7hIdjXuM2+5H7rPEkW8mocKTC/JvgvetXhFKgW84fcz2TSt9mzOQq7AGym36oqcSbAibMg1dziBlOOBg+3JjISUARcQPKIG/jiMVg5z1r1m/TCY7+KmxymsrnWZQa3XJM0bUhGg3ryStQhA9
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DU2PR02MB7573.eurprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(396003)(39850400004)(376002)(366004)(136003)(346002)(1800799009)(451199024)(186009)(4744005)(2906002)(82960400001)(64756008)(122000001)(66446008)(71200400001)(66476007)(316002)(66556008)(91956017)(41300700001)(66946007)(76116006)(8936002)(38100700002)(8676002)(36756003)(6506007)(53546011)(26005)(38070700005)(5660300002)(478600001)(110136005)(6512007)(6486002)(31686004)(31696002)(2616005)(86362001)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?OFFUY0ZMUkxrTy9iNEFTdDF4Z3Q5TS9ObzlZQUs2WTdMcXpFS1FhZ2NvOWc3?=
 =?utf-8?B?T2NEYTRIMWMzTWpCZ1puanpMMjYwaGVhWXJaMmNoOHJNYTNEaU9WUGR0RWlq?=
 =?utf-8?B?VmFlZVl5V0JvcUpYZHZocXRja1JqR0VmM0pmdThnT0paQ1k5UU85VFBYTDFw?=
 =?utf-8?B?b2xFaHZ3Rlhnd2FDcHE1WG9jdWRtNHI1M3RSaEVXZHB0b291Sm9mMjFKTDFr?=
 =?utf-8?B?MHV2cWlwL2txSHNKeVhkY1BSMDZjeTlVTUZDRXVKM00zUFZyaVdnSlRsWW0v?=
 =?utf-8?B?cVlVL3NCelNmUmovQWtPVGU0eE5ub1Bpb0x6QXNpVFpadUlxMnpTMTRreWI4?=
 =?utf-8?B?eGpzMFhLdElUTU9QQlNta0kvcDZiMHIrVEJVUG5oSGd0K1BENGRqTUxRTEtJ?=
 =?utf-8?B?LzdsV3JXcmtOZVJ2cStKbDZoZWlFMGJsS3hXbk9ueEN4YlhXL05adktRbGhs?=
 =?utf-8?B?T2VScGhETDM0TEY0MzhYWjhWQUdWVmw2dlFzeDRqTGhGRjVkOXJmVmF3S3VQ?=
 =?utf-8?B?eWZEYjc0aXQxdnFPVG9RcEhMaW5VNis4aFNYZTlNQ2FNWnk1b3Q0MWRVMlBU?=
 =?utf-8?B?eTR5cWNYeW1HQm0waUhYUE5DcUZjMmkvcjFnbjk1ZklENEFaK0NSeWtBZFMx?=
 =?utf-8?B?UlJMZ25kQ3NnYy96NFBzdXB2SW9CaGNpR0srRjFYUFJId0dCVFF1TERWeElG?=
 =?utf-8?B?S1o3NDdXRUFGa2oxRGxFTWtVdnBnUFBMWHE5cjFHMXdwdHd1bWlabThkMHF6?=
 =?utf-8?B?S2JoNDhQT2E2Z2JvMDYreHVwN2daU3FCZitRaGR6Y1BtNHNrNHpSZmdCZlFn?=
 =?utf-8?B?RDk1QnZxcHN5R3V4SGlRRlMyY1QxaHg1V012eUhlOS9IcTJ0cjFyaGlKYjE2?=
 =?utf-8?B?MlJ4VjZyK2xZOFkzL0NtVDU3eXNaQmVERFFQUVplVHMrRXdEdmt3a0NacVFD?=
 =?utf-8?B?bVQ5eWh3U0w1T1hMaVpkM3NRQmhzeUdKR2w3Um1YR3hpSTF4amhPQVA3enJM?=
 =?utf-8?B?RHoreGFDZDRiNjRDOS9uVENtQ3QzNmJKZGVUWFFnV0lTMm1nRU5SN3V3RzNV?=
 =?utf-8?B?OUY1Ujh5NzdhQXIwL3o3NjFJc3VVVDF6NWJwR0VzNjJrM29QR29YZU8reXZE?=
 =?utf-8?B?TVJYdGdTRXQrb2VlalBqVzAzZ09PRU9GaXJYaUlvNnRGQUpEeWJER1RzVitq?=
 =?utf-8?B?SlZLdDRvMDRUVEREQjlJUmcwQ29uY0NEd0t5V3FENFFGWmZCamUrSk5sRGZC?=
 =?utf-8?B?UDhuTHVZVkJBNDBhRjlNcWw4S2FNREt0bEhHdVdIVXlkdW5nTUQ3RFJ3RTRp?=
 =?utf-8?B?V1dDSW56QkZsaGJ4WUg0U0MxNHJBb2RVdFFQaU5xUU5ldjhXMnZYaStvYk02?=
 =?utf-8?B?cXRrS0wrZGx3R2ZzMUd2M2UzaVdJTDFiTThhbFJ2Q1Y4NTNVRytOTGlvN09O?=
 =?utf-8?B?eUphbXNUYWFIa1dMUjBFc3BIdFJ5K1NSbDc5aW9zcXFXdWlacko1MERTUlMx?=
 =?utf-8?B?aU9NcjVFa3pValBnV0Ric3FtVlE4TlBMVzlkVmxrK0RieTVWN1E0RGpOZzd6?=
 =?utf-8?B?R2JmS1E1cWdERFBoNHNNSVI4VnMxRzIvZWw2a1AzS0ZRTWMxZlVwUjVWdXZC?=
 =?utf-8?B?dHNXa0VYeFpOY285OGoveExEOWxaNXpMYVowU0h1Z1NiWkVtdTU3Uk5HUkZy?=
 =?utf-8?B?NUpyZmVkMjZremlYb3ZzWXA0Y3UvK2hqUWlDWldNSEdnZnpyMEtRdG1pUEZ4?=
 =?utf-8?B?eHN6VVJtK0xGK3VBMk1pMFFUaTJhVWxoVnFCd25jc0VZYTNWbUc5anE3MVJr?=
 =?utf-8?B?NHY3YkYwbTd6RE5Fd2w5WFB6aytMcy81aTR5alBBRTFOTnFCS2dPRldTdTBn?=
 =?utf-8?B?WTd4N3A1eEl1SGtPalpRaFV1YlF6ZU94eEtLUXFxa3hvcDlvbXRZYUpwZW11?=
 =?utf-8?B?OVZFM0x5OUExVFBWNmd4R05KTERteHZCU3R2MWJ5djQ4alpFcmVSdEVJMzl4?=
 =?utf-8?B?a1FXcTkvMWpzUFJWTWtIWHNjdkNWQmcwSGQxeUI1amtqb1R1dWl3YzZhNHkw?=
 =?utf-8?B?ajNaMDZHRllieHJhcWNPcTBEd0dNUTdxYzN4dlYyWkxsSG95RERGb3JhMW9L?=
 =?utf-8?Q?fNmM=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <3ADE63ADDC1EEA46B959C681A2080FC3@eurprd02.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: Ek8AU5AUOFtgPhuVdwjj8MIhRAwGY1hgEtgxfxwSHf92qZygTlldzsyWK3+/BNHVWVow2geQhbSGn0lC9einrlFh58ANQpt7u0hx2ZBDk9Eod+Vuq/sULBd9LWPEEAjwf5zPYmq/IR7jTJ+S8RK6xmQ+eqhIngbS4EjIzqS3+FirtTa8ERP6p7HGCo9NTNz6FR5nIrOfabHULgQPktJ/7F1VS+gZ/gF4zatkscXbcndrvHN+DWKrfp23EizoQ46/EXPzJZ8VTrxDRIPAvW+tf/+aqLn5C+K+ACGoamPgBr9NjeVqN0kCYyMgFq4+yB2mebm3x4Pm+Kws2ukcLd/f6rbXSAqvJr5vy2hjfjbGktIZkI0noVWha6+MmqNjBGGhlW4sMQiGTjMUH/2Gq0oqkXSBg0Z/lMTFDAVj/kpQapD9XWLlizl64vDpKDNmM/WEKAeAOVP2ALQbq3Pt5UAZVRYA2bKG99k86rlNFmSC2rWARq5uASS1X8VqJTM1qug3M+zCNihFyJow3c4giLB+BjBQbynsshoh0zG1K6Oxz1qhnMsO+t5VIvro780la+uwaSoMl5aQqsJKE/T7ZHBJwigsrprDIn/EWdXIGsq/6blzxNgsJ3KuxzvOesJrc+zkvKtnPxu93O/+3g4DUjQtzonIbUipOBZsLl9hWy2Ew6vKq3ExETt5CyAOR5Wuc0ijWNGu9HbKi+ScEdw0QoKPgKYBkAiBvqFl2shJ45LsEbaTOUuksZN376KrQVo1RJb0B1wLdt8gLfEJIJ6s21QcSVRYCscUJ1m1l0pZMGRLgIAuLk7SkJQQWpMqsTO3ouI08WPz6bHn5LbJu2c0owtTWYV+iMfGh7PFpnnMzdQexcc=
X-OriginatorOrg: habana.ai
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DU2PR02MB7573.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0f319f4b-f028-4f2c-3733-08dbaac17389
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Sep 2023 08:00:04.6420 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 0d4d4539-213c-4ed8-a251-dc9766ba127a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: bkBq/iFBrpAiJ9Xr3RYk9aSlbC23df/ZZrsEPTq+aafa5uNK/bpHYRJPtzYhfJAht5xpSvEPx4WBoCuxtuQ0aQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR02MB10203
X-MailControlDKIMCheck: cGFzcyBoYWJhbmEuYWkgW3Bhc3Nd
X-MailControl-OutInfo: MTY5MzU1NTIyOTpGUEtleTEucHJpdjqqAnTE+NHJKTESb7Ch8TmqYyz7jkWLyQfKtHvqNSUJR2MJZpRyXeQMjUjtyMX86AHF10/u8yWy1H7xp5nFn+3fkofaPY1SHXcxKLONlLqB8QyTAuB/wQLlrmTKAZMyhWPnCc7saxb5zRnWZZjf+IlXus4rF/QIlTjzYqUTc5a+9gvGbmI/fDZtp9T1KyStyHbTamLO9yWC9Av8CimfjJZnLMVLeimc7dFg5u5fThvFewnsvwmDQncF8dNnODSecuKWqoFxfrHkH+iaPw358V5QbLfSSbmt4AJ3WJCFetPdFmwTxf9D3zAexUpgClN6FLrPSJMe3GLDrdJcUB3dyfl8
X-Scanned-By: MailControl 44278.2141 (www.mailcontrol.com) on 104.47.1.57
X-Mailcontrol-Refers-To: 38180SAg079976
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed; d=habana.ai;
 h=from:to:subject:date:message-id:references:in-reply-to:content-type:content-id:content-transfer-encoding:mime-version;
 s=fpkey81949-1; bh=0vARNIdZt8DqNjWasY4Z9GTIEoe4cSVWrPxelGP50GU=;
 b=lbT/mJoXgENVSvJ6T0BhK/kBEtITXj4chc9hQ7jr0hsbn2ZUphD7Cs58FsgFDZDW3YwM5xTmnMLnryDAaIlWMIJ6sN3I+I8Z/o3B8j3boqJGuPBeawSQjZ8lXtbSjWawhQWovy9XpQXCKOK5FwQbDcF0dY/+TVWiZNCiM0vncy7U+yYAerHgw6hBEp4gNtXMp8wegn+FpW5erZIGMzTlJCwE2wcMeZRXrSxVZP9aoUWAHWjrFcPOvTfLMPTw6nxqTqGM8eyRAPUilVNXX9UMiYd4FXTgWIJmavABbjrxQ0Lh2vcBv1ec8ucFa784+4FZwfISWgCNdDMxUIDfX3k1KA==
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

SGkgQ2hyaXN0aWFuLA0KDQpPbiAyOS8wOC8yMDIzIDE0OjAxLCBDaHJpc3RpYW4gS8O2bmlnIHdy
b3RlOg0KPiBXZSB3YW50IHRvIHJlbW92ZSBwZXIgbWlub3IgZGVidWdmcyBkaXJlY3Rvcmllcy4g
U3RhcnQgYnkgc3RvcHBpbmcNCj4gZHJpdmVycyBmcm9tIGFkZGluZyBhbnl0aGluZyBpbnNpZGUg
b2YgdGhvc2UgaW4gdGhlIG1pZCBsYXllciBjYWxsYmFjay4NCj4NCj4gdjI6IGRyb3AgaXQgZm9y
IHRoZSBhY2NlbCBub2RlIGFzIHdlbGwNCj4NCj4gU2lnbmVkLW9mZi1ieTogQ2hyaXN0aWFuIEvD
tm5pZyA8Y2hyaXN0aWFuLmtvZW5pZ0BhbWQuY29tPg0KPiBUZXN0ZWQtYnk6IFN0YW5pc2xhdyBH
cnVzemthIDxzdGFuaXNsYXcuZ3J1c3prYUBsaW51eC5pbnRlbC5jb20+DQo+IC0tLQ0KDQpGb3Ig
dGhlIHdob2xlIHNlcmllczoNClJldmlld2VkLWJ5OiBUb21lciBUYXlhciA8dHRheWFyQGhhYmFu
YS5haT4NCg0KQW5kIGF0IGxlYXN0ICJhY2NlbC13aXNlIjoNClRlc3RlZC1ieTogVG9tZXIgVGF5
YXIgPHR0YXlhckBoYWJhbmEuYWk+DQoNClRoYW5rcywNClRvbWVyDQo=
