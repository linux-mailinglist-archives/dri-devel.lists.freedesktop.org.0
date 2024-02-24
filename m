Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A12BA8626FD
	for <lists+dri-devel@lfdr.de>; Sat, 24 Feb 2024 20:22:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ECA9210E10B;
	Sat, 24 Feb 2024 19:22:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=habana.ai header.i=@habana.ai header.b="n0+Yv6Nq";
	dkim=pass (2048-bit key; unprotected) header.d=habana.ai header.i=@habana.ai header.b="QDgp6dQW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from cluster-b.mailcontrol.com (cluster-b.mailcontrol.com
 [85.115.56.190])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C4E310E10B
 for <dri-devel@lists.freedesktop.org>; Sat, 24 Feb 2024 19:22:14 +0000 (UTC)
Received: (from mailcontrol@localhost)
 by rly09b.srv.mailcontrol.com (MailControl) with ESMTP id 41OJLph6280561;
 Sat, 24 Feb 2024 19:21:51 GMT
Received: from rly09b.srv.mailcontrol.com (localhost [127.0.0.1])
 by localhost (envelope-sender obitton@habana.ai) (MIMEDefang) with ESMTP id
 41OJLoQv280334
 (TLS bits=256 verify=OK); Sat, 24 Feb 2024 19:21:51 +0000 (GMT)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
 by rly09b.srv.mailcontrol.com (MailControl) id 41OJKrcY273439;
 Sat, 24 Feb 2024 19:20:53 GMT
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05lp2104.outbound.protection.outlook.com [104.47.17.104])
 by rly09b-eth0.srv.mailcontrol.com (envelope-sender obitton@habana.ai)
 (MIMEDefang) with ESMTP id 41OJKqPv273390
 (TLS bits=256 verify=OK); Sat, 24 Feb 2024 19:20:53 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HF2QjQCPkJhtejM4aSVjW+XfcEIBTfi8G75ggtDgcXdQ/4f19p/ohqerH02MtafZ6LJjiyvEeln7CoYNgE//F1dFmcIMVqBPI83yGfkmERRArumn6oq+9CO8NJPDlND5TLwZzbELWC/c/HFQe53PoY6eu/VyxCCV38oOXCOIipLiRYXSAV54ApD2F7fXwCWfrk4S5zmHb+qRwG/tHMNccOt2o9GX6ooPPNwMkOAw5tjBhFSy4sLdlBVKMjTPQzRQF9iyIpMMmqXb5zzW+Czilgw92acxUt1DY7mEDZvF7adA555NAhsGQHiaE5HhNXQJ25njPwCy5TwOhgrhmy2aZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6AjghAvJWLUMosxpG+rsdQoNAL7p4ps3h3FvGrQpd6U=;
 b=dBVl7jw/OouqMKnyIDzJNudcVDLeRU9zN8YfJggMWtZ4oC97TamYzTNwXF1nk76Aaj2hFICeYbm2gB4biy0qUTUieCluIBEKnVfuix/CRxZDPI3gvxNweFn0La1SJ4mSFj0R6b1RcVdIU1+bpcSgYY87TjfJ8wMrU6GGFbykWAnJ+b1U5u7JuoZ5vTcHmoh7mJnmTSaVZUrj7DI2LsORHEPLnVuE3CaR60QqOkJQPcz1auyYlK0Rhx3joIU8iiqLxXTmzUf/Mq50q7bEcqim1u2FmMWanPNBNCQkgBGIlTwgHsLaEOhqZv0GERsimQzigL4zC5FzLCNjlrWjyJlLZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=habana.ai; dmarc=pass action=none header.from=habana.ai;
 dkim=pass header.d=habana.ai; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=habana.ai; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6AjghAvJWLUMosxpG+rsdQoNAL7p4ps3h3FvGrQpd6U=;
 b=n0+Yv6NqUXVIyRH+ceAHlofdlt4XmGE6ldk8tyYjLg54pKqCb5t2BIk0v7wAAGwJgN+kF1XhcjrEE2hFHI3QJcqQUoq9LpaQUYqUZbOdA0w2t0tNbZP+Zt6U6aOZg2Dinggdh5GWek3J2VUGBQC6W4rzxMQ0nKOUf7EqIWI3n2sksrE8ZKcIF1DNdQZQMTlaL7Lm/PtJBIN6N3ZbMCps/USsSxHLMwTf3LLEFqJAVZjUbDW1ETtoskoHKBK5ghgfSQCE1T7j1PIGaEN36TIgo6nGzNBvqBYcU7GQmoVl46b0Mn8VjSgfgF1sydrKcrmaYZkVh3iJrlph1jXoljbYmA==
Received: from AM9PR02MB6611.eurprd02.prod.outlook.com (2603:10a6:20b:2c9::22)
 by PAXPR02MB7800.eurprd02.prod.outlook.com (2603:10a6:102:223::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7316.31; Sat, 24 Feb
 2024 19:20:51 +0000
Received: from AM9PR02MB6611.eurprd02.prod.outlook.com
 ([fe80::8058:c63c:a678:9ab]) by AM9PR02MB6611.eurprd02.prod.outlook.com
 ([fe80::8058:c63c:a678:9ab%6]) with mapi id 15.20.7316.023; Sat, 24 Feb 2024
 19:20:50 +0000
From: Ofir Bitton <obitton@habana.ai>
To: Carl Vanderlip <quic_carlv@quicinc.com>, Oded Gabbay <ogabbay@kernel.org>, 
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 13/13] accel/habanalabs: modify pci health check
Thread-Topic: [PATCH 13/13] accel/habanalabs: modify pci health check
Thread-Index: AQHaZBYiI8AeNiGTrEuoW5y2aP2B1rEYmNIAgAFMKAA=
Date: Sat, 24 Feb 2024 19:20:50 +0000
Message-ID: <31a0d18c-cea6-4d4e-b153-70f46c523b6e@habana.ai>
References: <20240220160129.909714-1-ogabbay@kernel.org>
 <20240220160129.909714-13-ogabbay@kernel.org>
 <bbf83ad9-825a-0a9f-79df-620067de5c5b@quicinc.com>
In-Reply-To: <bbf83ad9-825a-0a9f-79df-620067de5c5b@quicinc.com>
Accept-Language: he-IL, en-US
Content-Language: he-IL
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla Thunderbird
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=habana.ai;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AM9PR02MB6611:EE_|PAXPR02MB7800:EE_
x-ms-office365-filtering-correlation-id: ba48ba94-ff8d-4b77-60b8-08dc356db680
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: bvniA3LCtSAYBGPk6yTO5ySX9jpR8GOXPlOMr02wnWGzO4xyTekOqpiE4SWwbgAv8P4gxJEGj0+0ccJGbvsmemfNUd1tLV0eFyv3uKE+QSu4sXpg0LWM21eDeoVrCfNrqkMZWuVga9c2a1cq5tXPd4MoWI6PuPzzhNJxFnOUZaBL4lI7LKnirvF+W0gKrpnKVBH5tmNc3e6KyQ+IUwr2R6aGJT+WOGgOyJawKW0HqDW6GOoF8ZZPnKeS3Xqc3+yq7NQ287iGxDvUmWkIytoemPOHofUS7GUWaq6+l1yh/SpJBLGlYLQva7+JsKRQfyac9pE2TJr5+VcNMTO6gGXY8LvIplNOr02yELtIQ/Xqzl7LxCT1yFlFfioY6kOV3VssvbTjEb1yk+B8qdHCHV6aPk4wa365j7PiSaUApWCFuYcG0Bx0OAeIFM9P/17jmkh5W8eMw5NPCLKN76WGJkkL4PFYRbXR/JLqBY5IPL31f8imWstdDdbYdhQFI55JLS+mr8nsDdNv97Sq57iISB8cOdJdcxCSI+DNMWN44+QrbyJ4HKvau4nmHDuYzHgI9xFKY/UjtL8Z8WHfXwTs/2bnjpIcgQRyDRjH/qeljZpIUXL9ZOPbU8pOkrzAs82f4fOk
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM9PR02MB6611.eurprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(38070700009); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?WGo2OXNLRkN4VDlEUHk5Y2ZVaStWNys0bm9zVkhqa21PZDlCZTB3Y2Vqbnlq?=
 =?utf-8?B?ZUlXQm90ZUcrcm9hZ2hwL3k1c283TmtNMDh0THVDWTdybW9zQ0lqNVVSOTg3?=
 =?utf-8?B?RzFPUGptMXBNSldRbXdtdmUyQWZPWWU5OXQvSnRONzRFdjVpalRlbnBHNmJP?=
 =?utf-8?B?ejVuV29lWmh6ZUdCME5GaFpJUXNKOHpsUGtCWFVNUGN6VGlROVZGTzdvdUJn?=
 =?utf-8?B?TTZ6dHV4SXRJUEN1Yzg0T1NQUkVtTGg1bnRtaEpSUnIrZ3Foc2ExSjd6TFRj?=
 =?utf-8?B?WTJXanJEV2lGMTlMSCtqaVVSc1BEQ2w1NVZPQk9JQXZhaWlkZkhXUmk5Qkhu?=
 =?utf-8?B?cFdnZFp0UlFFbXRRUFFqN21IRnBmUEg3UmpOWTFMeDRUOVFSM2x4Y3Fqdzc3?=
 =?utf-8?B?SFdhbms5Tm9UWk1zUWszbS9IenRjM0NBMlNodHVlY0QwMnM4bUFKWE1INTZS?=
 =?utf-8?B?MzdHWkQ4K21hSTJpNDFJcUI1cmFJWWlvemJ4cVdLZ3M3WU1QeUlSbk9nS25w?=
 =?utf-8?B?OFFyMjVZVlQyL1hYYi9zSnhlekF1ZzV2cWVuMXE5dE1JTU1BQUhZS0k0TjZ2?=
 =?utf-8?B?SjR0S1JON1FkNFRJdlZOZW5UZ2Y1d1lWOTJwWmxMWHpOS1A4bUpVNU0wQ0Zx?=
 =?utf-8?B?cUFVSVoxOFFpZ2FTdE5VRXhCQnJHTGpkYXl0bW0rR1YwYlN0VUlGbko3a29v?=
 =?utf-8?B?Q0xpWUxvSmVodFVTNGw5QXBQQzZqWnlheWx0aXk4R0lDalp5SzBuS2JScHVy?=
 =?utf-8?B?MHNnWWEvd1kwMGxRcTFJakp2M01Yd01uZXpFTm5KY1MwSTY5QVlXU29kUDZW?=
 =?utf-8?B?YU90bjJPK28vc3RQdDgyQ0JKZVlOQkM3czBweWNoSkhaUHRNbERsNEg1SmRX?=
 =?utf-8?B?QnU3bGtLZGx3Q25wR2t5MkgvaTBYbitJS0dGL2FLM2ZXdnlKRE03eUpiQTNl?=
 =?utf-8?B?bUNQQVM1Z2VzYzJwY241Z2V4WUpiR251S2dVVkttdUNHUXJhZm56YVlrQTBv?=
 =?utf-8?B?K1lLRjNmUzlUNjZBM2hwSEZNNzNNS09NdWJZM1lhZ1QzU3J2U25jK3RCb1FZ?=
 =?utf-8?B?cHNKbVN5dk4xL2tVMTRRdjF2UEtPVGJuYlVzUXpiWmhUb0VtbGY0S2VtazY4?=
 =?utf-8?B?OVVSRFB3Q1ZHcjk0Q3JjOG14VlFUSUNpc2J4TEhHbGExSW1yeFBMc3d0VWdi?=
 =?utf-8?B?S2FOdVU2SnpYNTUrRkIwY3dhdlpwS3NTUFg2dlI0b2Nzd2xvakhJeE1kZUpu?=
 =?utf-8?B?VGhsZVVOWGhKVHVmd05OZ0tWRHZkdlQ1QUd0Y2tKVGlhek9hMVJPSThmMzE5?=
 =?utf-8?B?WEkrSFNOc0lybTluY0pvamRUeTNJN1UxdVBmZktFSnRvVVQ1N0hTMlprMWky?=
 =?utf-8?B?RWtFcnVyY2VZclRQT3pyeGU1VVNyNURHcjBhS01LdndpTUdnYVZGcy81VEEy?=
 =?utf-8?B?V1g1V3FZeFV2MzBEUDJkaVhHbC91LzdOaWZncllQTlplRkV6YVArSExWTU5K?=
 =?utf-8?B?dEZkVHZ3eWlHb3FRa1YvUVpiTXl6UXdlK25JempYZmx1VUR1Mm5VdU42dE1D?=
 =?utf-8?B?ZmgxK2tzZFd5aGRDWnIvUlF3aFJzekxHQVN1V1lRRmtjQUZrWXpqV0V5Ylc0?=
 =?utf-8?B?UUdPc1NvcHBtVFNDMGZhek5LbHU2YmN2cUlpQ3pBOTZ4TDIwTkJlWkgzeExV?=
 =?utf-8?B?M3BOQm1YbDFKRm5JRWhrS2dUak44TkNub3VFREdpaEtRSDdqb3FYUHY5RVg1?=
 =?utf-8?B?SmplYytVVWtYNVM2dUlCZHpjMDRORVZvRFVINTM1Q2FQbnd5Qi9OZ3RKNXVO?=
 =?utf-8?B?NnBBNkQ2YnhzdU9KcUd5QWE1eXFkWXhXTEZXU1JsWEF0ZnRLQUlCRUNzRVNo?=
 =?utf-8?B?azBRdGQvQmc1NDNJZlozSWRGUUhhSTVYN3ZBZldRWGx4cjZIbXRRYzBMRGJC?=
 =?utf-8?B?QVdzWHozSE45bGJIV3JmVDgzMzcrWEt1VTVjcUU1YnRQZkh0bllsUFFEN3pC?=
 =?utf-8?B?blFsMHlYUU56MzdNVkgyM1RjY3lGTEZWN3hTSno3bkhyOUhuVk40VHpQMGNl?=
 =?utf-8?B?YjNXbC9GMERuK1NGU2lEU05MTU9obDlUZkhXQWdlYTJublRYOERuQUF6ZVBt?=
 =?utf-8?B?N2I1Q3laT2hSYUpia3M4aitzR0c1aVFKNmJBM2JwK0xVd29oQWNVaXFreVhk?=
 =?utf-8?Q?6S9QFRkKh+tOdltZetwI2Jc=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <71FC922715FDD94192E58FF5BE0323BB@eurprd02.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 1KeNYbdsfvd3LfjSsSAHwxp/AhnTSDOQxeWwTXTZM36F/H+qWaGRZApViNIuefolLzaR+Q0fDF4N4qX5UAVRh2Fia8USm6KtILRC2inzPK/iMdXaZmkhCj1vOFfzSIgkMpwBIZYskBMT6Y0t56Xlgbr5rDQYUQj1ukb1DjuSf1zJSApjBIhdiNbxuBiNvWsZ4kb1MRRGPjG4ifZye4SSaUfFJoFjnl1w25yveX/emAkHz5qMHNzSnG0gkNhQbxd49OzKM66CkwJR8ef6shvOwKQNJ4XfVTPrzWpcGG+0+chC2yi0ZlLvgCUwttTvXdOKkvUJWIlcqzSIHXGRlRxmRushvNw+B5y9liGtrwognxBvEqXkPHom9dU8ZVdLm79yvA1Jablp5+iAk/bjhUXz5U7hzeZwFp3EK1EH63M/4JBIfFiJTDeOKUJljJ0t+nSZPUC1WlVFjTuelfg1MVL5WI9r+mW+5RFNC+iYb5+8Oh3wXO48X59jpAOhJBJC/GwyGAh+lKbUUNcQkiURrDzlvEPyRW0Gr1LTTDntJ7f1KGGaw/SP5IvXvApGdzTE/7F2rWn+V7qCirbXumR8oU6Ma7WJQO/vE0q+KA+ZRkj1ZiTh2cPnBefsILH+hnR3NkSn
X-OriginatorOrg: habana.ai
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM9PR02MB6611.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ba48ba94-ff8d-4b77-60b8-08dc356db680
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Feb 2024 19:20:50.8991 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 0d4d4539-213c-4ed8-a251-dc9766ba127a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Y6Ze7y+rhSlSodbyHE23VsuUoypLoDpKxFhj8wDmKmI/l01arDlO1p5AUUkZLIj3vCvqCObPIw6btUTRMgj/dw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR02MB7800
X-MailControlDKIMCheck: cGFzcyBoYWJhbmEuYWkgW3Bhc3Nd
X-MailControl-OutInfo: MTcwODgwMjUxMTpGUEtleTEucHJpdjp2I80IN7Ez4qKbfu8dIp4q3yNMq/x9kyTDrdC3TFataoMCndY0Lm8/qu7Z0n7oV1AyOIbAbFv9ScYeQywrRrnZL+qcCJFev7OsOJRPWksHWlyjHX27cF5Qer38VUBxg3bmbZwt1cmk1FLiOgOMItWEjzla+LI6xE5xZfrLxH7k9wlEgfVO5miGFCmil/eIectJv8PBbWeFrnK4zInD2LUH/ddI0Z5fvwMfn/F9iuqcIM0yxum37OCETGpaOMdQ1yv3dvB+Gkl4LskhRYRVMGe/Wgqyc+8xNzSTu+amOhO/V6vwH3u2fJLExKjNqwOA9J2y25/O/XmLbU/ZY05orObs
X-Scanned-By: MailControl 44278.2143 (www.mailcontrol.com) on 104.47.17.104
X-Mailcontrol-Refers-To: 41OJLoQv280334
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed; d=habana.ai;
 h=from:to:subject:date:message-id:references:in-reply-to:content-type:content-id:content-transfer-encoding:mime-version;
 s=fpkey81949-2; bh=6AjghAvJWLUMosxpG+rsdQoNAL7p4ps3h3FvGrQpd6U=;
 b=QDgp6dQWsq498B3E0HacnYybByJ9Fu/3urVlDIS4UYU3uhf/0y+PB+1wz5YeaUwwyLJS3zhtozhqBG98zfEjv8Nx0+i9iyOM30TsPpsqY0c1LaHE9xx6ggfsqHGp6r99CXu/TZ2KeoSdn121oDbpTKDqkC2J/rY1NQlVyAw0E2KT+xAwufohG/VN1yNxfLcJjRtNxWeF3yFOGBhnPxJCV3yGrglvFd/eChC/Z6dd1kXTVwaQgYso7AgxU54VahHthdPDDr+0McenNa0uUF1gGfdeWw5Y+0lAcaFOVMdAIV8SbPvkGyxbmOCbT2q2Gxe7b+jReyYgdtn4XTITjDRWmw==
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

T24gMjQvMDIvMjAyNCAxOjMyLCBDYXJsIFZhbmRlcmxpcCB3cm90ZToNCj4gDQo+IE9uIDIvMjAv
MjAyNCA4OjAxIEFNLCBPZGVkIEdhYmJheSB3cm90ZToNCj4+IEZyb206IE9maXIgQml0dG9uIDxv
Yml0dG9uQGhhYmFuYS5haT4NCj4+DQo+PiBUb2RheSB3ZSByZWFkIFBDSSBWRU5ET1ItSUQgaW4g
b3JkZXIgdG8gbWFrZSBzdXJlIFBDSSBsaW5rIGlzDQo+PiBoZWFsdGh5LiBBcHBhcmVudGx5IHRo
ZSBWRU5ET1ItSUQgbWlnaHQgYmUgc3RvcmVkIG9uIGhvc3QgYW5kDQo+PiBoZW5jZSwgd2hlbiB3
ZSByZWFkIGl0IHdlIG1pZ2h0IG5vdCBhY2Nlc3MgdGhlIFBDSSBidXMuDQo+PiBJbiBvcmRlciB0
byBtYWtlIHN1cmUgUENJIGhlYWx0aCBjaGVjayBpcyByZWxpYWJsZSwgd2Ugd2lsbCBzdGFydA0K
Pj4gY2hlY2tpbmcgdGhlIERFVklDRS1JRCBpbnN0ZWFkLg0KPiANCj4gV2hhdCdzIGtlZXBpbmcg
c29tZSBzeXN0ZW0gZnJvbSBjYWNoaW5nIHRoYXQgYXMgd2VsbD8NCg0KVGhlIFBDSSBDb250cm9s
bGVycy9zd2l0Y2hlcyB3ZSB1c2UgaW4gR2F1ZGkgZmFtaWx5IHByb2R1Y3RzIG1pZ2h0IGNhY2hl
IA0Kb25seSB0aGUgVkVORE9SLUlEIGFuZCBub3QgdGhlIERFVklDRS1JRC4NCg0KPiANCj4gU2lu
Y2UgdGhpcyBpcyBjaGVja2luZyBmb3IgUENJZSBsaW5rIGhlYWx0aCwgaXQgd2lsbCBiZSAweEZG
IHdoZW4gYmFkLg0KPiBDaGVja2luZyBzb21lIHBhcnQgb2YgQ29uZmlnIFNwYWNlIHRoYXQgaXMg
d3JpdGFibGUgd291bGQgYmUgbW9yZSByZWxpYWJsZS4NCg0KR2VuZXJhbGx5IHNwZWFraW5nIEkg
YWdyZWUgYnV0IHRoZXJlIGlzIG5vIHByb2R1Y3QgaW4gdGhlIEdhdWRpIGZhbWlseSANCndpdGgg
YSAweEZGIERFVklDRS1JRCAobm9yIHRoZXJlIHdpbGwgYmUpLCBzbyBJIHRoaW5rIHRoaXMgYXBw
cm9hY2ggaXMgDQpnb29kIGVub3VnaCBmb3Igb3VyIHVzZS1jYXNlLg0KDQotLQ0KT2Zpcg0KDQo+
IA0KPiAtQ2FybCBWLg0KDQo=
