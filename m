Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1029190E71F
	for <lists+dri-devel@lfdr.de>; Wed, 19 Jun 2024 11:35:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6C32910EB60;
	Wed, 19 Jun 2024 09:35:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=habana.ai header.i=@habana.ai header.b="DzUn03Vy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from cluster-d.mailcontrol.com (cluster-d.mailcontrol.com
 [85.115.60.190])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 784E110EB60
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Jun 2024 09:35:45 +0000 (UTC)
Received: from rly09d.srv.mailcontrol.com (localhost [127.0.0.1])
 by rly09d.srv.mailcontrol.com (MailControl) with ESMTP id 45J9ZbaI293010;
 Wed, 19 Jun 2024 10:35:37 +0100
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
 by rly09d.srv.mailcontrol.com (MailControl) id 45J9Ymkq271764;
 Wed, 19 Jun 2024 10:34:48 +0100
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04lp2045.outbound.protection.outlook.com [104.47.13.45])
 by rly09d-eth0.srv.mailcontrol.com (envelope-sender oshpigelman@habana.ai)
 (MIMEDefang) with ESMTP id 45J9Yg0m270353
 (TLS bits=256 verify=OK); Wed, 19 Jun 2024 10:34:48 +0100 (BST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aD9Ac/nzADo7omCBmMsT/n/xXe9uwWIop09CS06EPX4HKK5ZYEUmhA3ylbiYRG+Lnw8rHo1aCegGkTgPeGRgtidBjMJ0yZB4mmDF7b43U6cms1nQ/m7ikatE116LJaN3qBA8Ws6oQhDjOmk0/3Gb4XDvykT639dX5Fl47SLM9BqXPcVdwXPv2e2kqYL1f/M9uGSpl+xYSZg3Bij8Rar49D5GWgFBItBt/2JL3T+JcepB1P9E0Sl0Uu2Y9/yoIYiGD4yRWWObq6+6vU52Dke8TWyBVNf3PsZFQUiAvrQG+wUNgasdWR9/em4WuD7TPNynk+P5LyJGyLzbrvegR86LvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hx3pkQ7RdAOkSAbHAEQJScRstufyaL0q8jhuLxXT3jw=;
 b=nGAfP+HyxX3xICVRuXF5d/ymfuCZsWOZXa8VjOBPncOq0qiDBxmwrf33UatSRN19mJ7wuZeDkXWmSriOEM1eDEMPUQV3HbpOJS2ZjKWck8P8TuLqe97kwp+C9kw6ntbdxpRqOAWVOdK7o8uk0MoF5/7fApBIobcFu/iCJzDPf0A4bC0paaLvT7GKVuUtQKCJHCXOZQvpCZ5s2f1c8H/pGZBxwy2v7aHsmbFczR6lFjdM2l8ON/HgZjf+XVM2snWznSZKsbxHWDQq/YYSsCAgJ0Kl4abFnsmihoKBhTGxIjIArDdTiNv9Qy+YJPJRlda42H6N4CXVVmoHBhSk5KyBQA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=habana.ai; dmarc=pass action=none header.from=habana.ai;
 dkim=pass header.d=habana.ai; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=habana.ai; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hx3pkQ7RdAOkSAbHAEQJScRstufyaL0q8jhuLxXT3jw=;
 b=DzUn03VyKXeOHjWmkqjMrpaZSf9SnDvFAV4O5DrrbKvVvvuq454xvUDUEfe9+IhpuSCz1ML8Qxq3uQc9RyzHuYXjJi7l3KTHfGxgv2WsazkgMqX/ftd7vWT+QSMpKK5CwIqlWH5va1puGHlJHWbkEeRFwkhOjVtJLMCNx9ULfmOgdUrKnM9pXkmmdfLLpCncWe/10IciGbEUtLVkjdMSU99n4dEHVI/VW8G5Ca9pRqDvLBT4CAwHUjB3aw8Zy9xy9xau7sVqGvLS6IWnpAWHW63adsuhU6h+RQ1kltpd4Z539SfY2FY+hn1SBxcYlpo2QKE14md9oIz5Oc+G5lHwXg==
Received: from PAWPR02MB9149.eurprd02.prod.outlook.com (2603:10a6:102:33d::18)
 by AS2PR02MB9464.eurprd02.prod.outlook.com (2603:10a6:20b:59b::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7677.29; Wed, 19 Jun
 2024 09:34:40 +0000
Received: from PAWPR02MB9149.eurprd02.prod.outlook.com
 ([fe80::90a0:a4f0:72e9:58b9]) by PAWPR02MB9149.eurprd02.prod.outlook.com
 ([fe80::90a0:a4f0:72e9:58b9%3]) with mapi id 15.20.7677.030; Wed, 19 Jun 2024
 09:34:40 +0000
From: Omer Shpigelman <oshpigelman@habana.ai>
To: Przemek Kitszel <przemyslaw.kitszel@intel.com>, Leon Romanovsky
 <leon@kernel.org>
CC: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-rdma@vger.kernel.org" <linux-rdma@vger.kernel.org>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "ogabbay@kernel.org" <ogabbay@kernel.org>,
 Zvika Yehudai <zyehudai@habana.ai>
Subject: Re: [PATCH 11/15] RDMA/hbl: add habanalabs RDMA driver
Thread-Topic: [PATCH 11/15] RDMA/hbl: add habanalabs RDMA driver
Thread-Index: AQHavWrR8RRCkLe4k0COm3YO57oxm7HGEhoAgAYu4QCAABaLgIABDVwAgABRwoCAASZWgA==
Date: Wed, 19 Jun 2024 09:34:40 +0000
Message-ID: <7e648659-cf81-4b06-9015-8a5345e34ed9@habana.ai>
References: <20240613082208.1439968-1-oshpigelman@habana.ai>
 <20240613082208.1439968-12-oshpigelman@habana.ai>
 <20240613191828.GJ4966@unreal>
 <fbb34afa-8a38-4124-9384-9b858ce2c4e5@habana.ai>
 <20240617190429.GB4025@unreal>
 <461bf44e-fd2f-4c8b-bc41-48d48e5a7fcb@habana.ai>
 <c6df0934-df09-42e1-b6d7-74ea02428d3b@intel.com>
In-Reply-To: <c6df0934-df09-42e1-b6d7-74ea02428d3b@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla Thunderbird
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=habana.ai;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAWPR02MB9149:EE_|AS2PR02MB9464:EE_
x-ms-office365-filtering-correlation-id: ef350e35-af68-4313-a48f-08dc90430b1b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230037|41320700010|366013|1800799021|38070700015; 
x-microsoft-antispam-message-info: =?utf-8?B?cHRoMnA5N3B2R251SDlnS1hsbVJ0bTVHWnV3NElrRzFmcTB5MVJtL1V1YzRn?=
 =?utf-8?B?MUc4R0IrVEhhcFVwTXN5cmZ1UFVFSWl5T0Fxa1FKb01PdFNvSTJlUk5HLzFT?=
 =?utf-8?B?NnVZQ0V0dXEvMGdaN1MrUGhSKzdCV3RrQmxJTkJlcnYvRUxHcithUDBhTVlL?=
 =?utf-8?B?d1RpeVJRaWNmTXgrLzgvRzBYMGRUOWhNc3NGamRxU1FHOGl4UWc4a2FlSEtQ?=
 =?utf-8?B?aGloeGkzMTU5MGVSOWlDS0FoNFhyTzZ6MTR6cGZJQjlEYUVUQWxEUDByWkY4?=
 =?utf-8?B?VUEzQXhPZTJURitTWFBjRStPRUVjWHM1Nlc1RnlTcllCUU1LM0tSa1FJQWY2?=
 =?utf-8?B?a20rVUMzQmkrek9RSHAwNDdyUEpPVDFsSXpFNjdUMEJvMHZKckltSHFub0Uy?=
 =?utf-8?B?akxaVFcyRnlvcjd4QjNCOVpJbjJQQzZndW9KQkpuL3dIOVlqRTZvdTA1aVFP?=
 =?utf-8?B?YUNBanc5d0hUUHdlTWRNNE9mMndPbnkreGRlQ2ZTYWhhNFcvRCsvd3JxU0F5?=
 =?utf-8?B?bzROcTFzbHlwbC8rdnNpbkdPVTZXaEd1cHJKSlZBY2xGTTVOd0lPUE9xa3VR?=
 =?utf-8?B?emkwYUJ0dEwrV21wMGxYUmZwc3JhSm5WdWZzOGpyRHZ0bmk3MzVsVU5YczlV?=
 =?utf-8?B?V0R3UzVBazh5Sy9lUlFoejUxTWZJSjJDTWRlUFp4dG55YlA1elVzN2RCR0Iv?=
 =?utf-8?B?MzdhTXAyMWdFcnBmT0JDM3c1cFlMMEJkQ01iakh2SVlwYlUybFhJeTI4ek9q?=
 =?utf-8?B?TmNLQm4vSzBYQlUvM3ZZa3lpU1F6REJJbkRjT3Q2d1Fmd0R2aTM1T3B3QWMr?=
 =?utf-8?B?QWN1MHhpRjgzaWs5QUJXMmkwSUozRzg1VFhvT3QyZzhRWDF6ZSs5YkhFNE9l?=
 =?utf-8?B?amd1R0I1VlFGNGE4MFFRVllLR3RJMTl0UDd3VXhONDJnZjByNUhkOGhoVVJz?=
 =?utf-8?B?ZHdMckdnZHA3RG11QytwdTE5VVdGdkljU3pEUHh5Rlltc3Z5S2svS09UQWpy?=
 =?utf-8?B?blBlMDlpNkt3SzJiRXhjSEd1RytzUlBPT2RSQTRWZUtsYjQ2aVV3bTk2ZU5X?=
 =?utf-8?B?L3hBdU9idDljcGxvUnplR3c3VXZZNTZUQktiMnRTbkN6SmRScEt1cDlQU0JO?=
 =?utf-8?B?VkpiZVZZWGhabW5HMUx2SC95ckltNzM2V2N1cFJMREtWWURZVkNFcmpTVVkv?=
 =?utf-8?B?S2d0YWt1RlN6U1N1RWNXR0hKZkxycGpyQVJUZFNMdkVuekZEOERXZWREbzhG?=
 =?utf-8?B?blVIT3B3VWpCN1U3TGtLRmtlc25GMnk0NVJZWG9ML2NhRHJtUkRaa1RqaUJh?=
 =?utf-8?B?Q1dPcTFUdDVqNjFtdUMyR2NkbVhPdkZLZTFEd3NtMU1mZjhBeW9JM0FsNkZF?=
 =?utf-8?B?ZUN0Q0k4TUZkYlRsVVVPSG9jRGlxb3Y0cVc3czQzUExZK1FiNkxsTEs1a3Fu?=
 =?utf-8?B?N21xd3lEVFVINFZpaHQ1SGpkdU9reHd4b1p5STA5VGN6RVRmSXVwVU1YQ05G?=
 =?utf-8?B?UThER0NkbC9hNXFrL0ZvdGlTZjBQcDJwQTcranVBYWYvdGhKL0FUQU5JTGh5?=
 =?utf-8?B?K1dzNXJRZmFmSEhrODRYbFhFVkJGdkdnOWhnWXVieWlobnppbjdvN3FDek5z?=
 =?utf-8?B?NDdkYkxNeTZkNU9GSDNza2ZydU5aQkxTSXFBdDNranFFc2tRSGF1Unc2R2tV?=
 =?utf-8?B?T1FWVkJXNUI5QTRoVk4vUXcrNE5TVUtkUkFDUGhseXZQNTRKdVQwR3IzcEts?=
 =?utf-8?B?VDQ4SmVIcUtubmZzY05WYU9Ia1l1dGEwT0ExLzJqSmR5ZzdBZy9RTTliWCs3?=
 =?utf-8?Q?6grMjYibxR6Iu8yfD64OPPJV4Dzbr51/ARmNc=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PAWPR02MB9149.eurprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230037)(41320700010)(366013)(1800799021)(38070700015); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?K05jSE1hUFQxN0NLdFJDRUhNQ3d0cy8zZnVlNmJWOU9iS0FKN0ltaUJsaTM5?=
 =?utf-8?B?Q09BODNtR2tJaWdHN01uZGtEaFFNWGdmNXRZbENUVllGYldpclk4SzVTbTdI?=
 =?utf-8?B?N1paSGVtVU9jY0E4em1Xeld3NGpvSzNDaW1aZWVoc0RwaVBOZisyYWZXbm9E?=
 =?utf-8?B?bDNrNUlrUDlVaUhTamk3NHVKRTdsdkhhbDJ6UDF0bkg3bXEvYkxVSVdzNTI3?=
 =?utf-8?B?TnZKZDJZekVmWmhmanRnVE03WFlXQzFtaDY4Z0tZaFBsai9xZ2szYU1OelZh?=
 =?utf-8?B?VVVuOFZpSHA1NVNtMXVhWUZYNkNzMlI0VVZra2dCQi9LNzAzb2J5YW8xY3Bk?=
 =?utf-8?B?bS83V2VyaXp1eVNWYjhnc1cyWi9ZOHBubGlJS2kzOExWK1FmMVhjc0hxZlFU?=
 =?utf-8?B?THRhc0dCUFFRbW1pbndNZWlveWxDR2h3WE9kVkg5YXZiNGhpVlc0bkcrNGdj?=
 =?utf-8?B?OGorK1laRXMrdnlrWUxmNmQrRTh1UURpbXpEWXJLSkNoOFk2WnRCTEN2UUVv?=
 =?utf-8?B?TlBSNzV0aVZuNWplb1BFcXhlNllrVlZKSFBFdno3alc0KzA2TkxCNHJwQ1R4?=
 =?utf-8?B?bUhKOGd1WitJTDFoTG8vc3VUdTN1WFltY2NFVldHZ0QyUjVOeXBqU2xmQUNE?=
 =?utf-8?B?M3RYejErTzhRKytHS2EzN3dHZG1aMExuMkthUEttYmorTlp1UDJ4Yk5EM01B?=
 =?utf-8?B?SzNkalZDN1hlbERMbzYxS2NFTHE0V1ZZNHFUTEdRa3JvL2tOTW51Z1kwQ3Z5?=
 =?utf-8?B?NEJGNjBEbXNCYVpPU1MvT1poN1R5c2p2bzZZcWxvaEI0ZUYrc3J6QjdPblJ5?=
 =?utf-8?B?WVlCMzFjTXZYWlJUS2hvRE9qT3FnZmNmend5U0toeW1mR1hhSEM5M2ZTZGdT?=
 =?utf-8?B?U2xCM2dJYjF2VkhYeEQrb2pZWXBTbk9NcE4vSUI4bnFVdEo2ZkhLNURjSW9k?=
 =?utf-8?B?ekpodVJPS1E1RkdDYWYrdE9uemcxd2ZzTlZyMnIrWFk3Z1NRYXcwSVBNVG1M?=
 =?utf-8?B?b2UwY1lWM1NwUDYxV05YTTJrWTlIWXpHbWNXT0ZTSDN0UmoxUy9QanJiNzBk?=
 =?utf-8?B?Tng5eWRla0I0aG1XMjBQMXo0eEhlVjBjenZxT0FwZUhHQ2djdVYwNlhVYnQ4?=
 =?utf-8?B?ZkhqR0FuUEFFd3RwNS8rYndCa0pJWkhSUWlCdXFoUkxxSjZmRVZEYXNza0l3?=
 =?utf-8?B?d29uc2tWejRhZ3cxMnlhNXpRU0xtTkM1NWtIeTgrWDE4TnZxSnRyWGtoZ3V0?=
 =?utf-8?B?dnhzTzZxa3hxMzlqNW12cGpTQXBhaGxhZXBDQ1VCcTJoaUxvbWkxbHpxRThT?=
 =?utf-8?B?aFB0QmdwVWtTSzNRM1RlRVJGNHpGa3hFRUpmMWFOa2cyU0N1VFdPdU1SQWZn?=
 =?utf-8?B?WkdGTk9FSndQK2ViWWRDc1g4OFBBSStzMlNsdkxra2p1NEpZTTQ5Q2xQQi9S?=
 =?utf-8?B?QzN1ZkFFRkc1T0IwS1k5NDgvQzdIT2dMTjlqMjZJODk1dEFzKzVxd3k2WXJJ?=
 =?utf-8?B?QTZyWk90cFI0R09PeVg3RXF6eG9CTEtvTWxCVzdmWXNISnFOMVFNbklneHdz?=
 =?utf-8?B?Y1BkQ1JTM21LenQwL1gzbjVoR3kwbHQ2QVdrT1lvUEpSd3ljcjFLY2FJQnVM?=
 =?utf-8?B?b2hwbU9KZ1BsQ1Zka0tWZEtKUDNzOExna0lsbVZ2L2JKVG9nQ3pVRkluWDZw?=
 =?utf-8?B?Y00rT1FLQzk0REZUQWhkWVJmYkhicThWd0JpTGlhOFlQbEFaa2VMMVhwcnEx?=
 =?utf-8?B?T1dJd2VodHVkVVg4b1NxYjZxeVc4YXI2VW03OVAwQXRNOGxvVTNscVJSWUdL?=
 =?utf-8?B?dVE3NGF0cXhySDFtSGZjZCtIN3llZm1WZVIzT0hBVFhUcStpMGxvWHhWbDhL?=
 =?utf-8?B?TUs0cEtRVm83QnU1U1pVY1F4VGNNSUZDdjJzNkNlSXRGRVNMNnhsWlJTT3pE?=
 =?utf-8?B?cGszd2FhbFJDbDBsM0ROYThreGl3OExSc1RlKzlsTWdqcXFiSituZmd6YVRv?=
 =?utf-8?B?dTdYWURFamdEWGdOd3JxZG4ydVVUbnN6WXBIeE9KZi9JT2FIMVJ4bDNtUHJY?=
 =?utf-8?B?SjI0cVlYUWhWbjY1Q0hlRHhuc2pwK0lMajFLbUNCUlJwT3ZpQUM5WGlOMEtx?=
 =?utf-8?Q?57v7VJ8ozzyfMDEXHi1t4/5qA?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <6C1F75A169AA0C4385A4CE59E5FCC9A9@eurprd02.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: /skUNxWCjPa7NxRd1R+9CMIG7iYeIn4j9xA5j0vaWtcIqwZ+Vfwknw3ge3Re0uXNlhzImuotKzBM8A9yw+ku0Kb0ciiwLQDuadOwiUkDoPhy7BKJ9G7mxPaCKnIp4yz0PFN8RRv1fHeDsAQmZzrBa1VyRYaPgPnDfi0CMCG4jmNoQ7WS0QKggZGd3qkPvg0HcOB/ak8UMxzNeO5H6a83nwtS4702ne1cj+Zsryb02d3FcefOU2ltScB9+NQootF/7UJnHAj3h0pSDXnDH553qWszzkP/sHYhvVL4DjE2mEIcO2gpb235RLMiZ+rob/09MWO9b06dTUadSj4CQV8lkiveg1HDTVQeGG/2k27NaGTcYpqhnCFgCMN/mcx48sTiy4UX6V/D+k7fvE/ej3GY5yIWR5n/eSQ6Jt3Kn24aFXunAW/aEyl40INFkhT3tl2Av1dMzXsm23HBY3cJqRRD/CAWpEYbHZpmT+aty8GcI77DpHtjhWf8hjatnqlGvq6aF23Jxl2ApxwZ64YtCDGiTvtHNjvlROmOYYgkFBPuSUnOVo8zgSDgnifDTLO/fs3mVMzXk+A5TKzuqutK2Q5er+Q5yCye/CmDoFBDftqVFdhn3GMjVrlkqJjYRKbzyk8d
X-OriginatorOrg: habana.ai
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAWPR02MB9149.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ef350e35-af68-4313-a48f-08dc90430b1b
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Jun 2024 09:34:40.2952 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 0d4d4539-213c-4ed8-a251-dc9766ba127a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: F9ZgnsO1SQOqQ/UJIU8WSs4ZjfpY94Tgt0jHEOzIdnLB46fVVf3ENALilZpG5viBPnvlNJb+G/eiQd2mUDPXKA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR02MB9464
X-MailControlDKIMCheck: cGFzcyBoYWJhbmEuYWkgW3Bhc3Nd
X-MailControl-OutInfo: MTcxODc4OTczOTpGUEtleTEucHJpdjq0UKwRrDRjwj60MuWjMzgZcsfaAEUqOPq2I6nY/q11RnY/EbhESZqu3K/c/DAwwlWeLrCZeAKpkNry+xnTJA86JLapd5PWafZGQR4sZH94dzXc65JVT5mhti2Q6KM/EnHvRZhUrADsDcHnpWFu4+vhqgquczqHwteb9ftC0ZwOWPnmsJvPZEgxQpeLE7/uEKx5ixb9YZGbfloD3VBxNMK1N+jJFWN73MujuKS0qtOcoOXJJdPUQTImwMvn2LTa67nvUHXbDS1l5MHKwqOnnOjnRwJyhh4qOU6981Objm/D9RnCpKXbT0x+bRVsWsUj2fGkI1uzHWqml/DJO2trTCB+
X-Scanned-By: MailControl 44278.2145 (www.mailcontrol.com) on 10.68.1.119
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

T24gNi8xOC8yNCAxOTowMSwgUHJ6ZW1layBLaXRzemVsIHdyb3RlOg0KPiBPbiA2LzE4LzI0IDEz
OjA4LCBPbWVyIFNocGlnZWxtYW4gd3JvdGU6DQo+PiBPbiA2LzE3LzI0IDIyOjA0LCBMZW9uIFJv
bWFub3Zza3kgd3JvdGU6DQo+Pj4gW1NvbWUgcGVvcGxlIHdobyByZWNlaXZlZCB0aGlzIG1lc3Nh
Z2UgZG9uJ3Qgb2Z0ZW4gZ2V0IGVtYWlsIGZyb20gbGVvbkBrZXJuZWwub3JnLiBMZWFybiB3aHkg
dGhpcyBpcyBpbXBvcnRhbnQgYXQgaHR0cHM6Ly9ha2EubXMvTGVhcm5BYm91dFNlbmRlcklkZW50
aWZpY2F0aW9uIF0NCj4+Pg0KPj4+IE9uIE1vbiwgSnVuIDE3LCAyMDI0IGF0IDA1OjQzOjQ5UE0g
KzAwMDAsIE9tZXIgU2hwaWdlbG1hbiB3cm90ZToNCj4+Pj4gT24gNi8xMy8yNCAyMjoxOCwgTGVv
biBSb21hbm92c2t5IHdyb3RlOg0KPj4+Pj4gW1NvbWUgcGVvcGxlIHdobyByZWNlaXZlZCB0aGlz
IG1lc3NhZ2UgZG9uJ3Qgb2Z0ZW4gZ2V0IGVtYWlsIGZyb20gbGVvbkBrZXJuZWwub3JnLiBMZWFy
biB3aHkgdGhpcyBpcyBpbXBvcnRhbnQgYXQgaHR0cHM6Ly9ha2EubXMvTGVhcm5BYm91dFNlbmRl
cklkZW50aWZpY2F0aW9uIF0NCj4+Pj4+DQo+Pj4+PiBPbiBUaHUsIEp1biAxMywgMjAyNCBhdCAx
MToyMjowNEFNICswMzAwLCBPbWVyIFNocGlnZWxtYW4gd3JvdGU6DQo+Pj4+Pj4gQWRkIGFuIFJE
TUEgZHJpdmVyIG9mIEdhdWRpIEFTSUNzIGZhbWlseSBmb3IgQUkgc2NhbGluZy4NCj4+Pj4+PiBU
aGUgZHJpdmVyIGl0c2VsZiBpcyBhZ25vc3RpYyB0byB0aGUgQVNJQyBpbiBhY3Rpb24sIGl0IG9w
ZXJhdGVzIGFjY29yZGluZw0KPj4+Pj4+IHRvIHRoZSBjYXBhYmlsaXRpZXMgdGhhdCB3ZXJlIHBh
c3NlZCBvbiBkZXZpY2UgaW5pdGlhbGl6YXRpb24uDQo+Pj4+Pj4gVGhlIGRldmljZSBpcyBpbml0
aWFsaXplZCBieSB0aGUgaGJsX2NuIGRyaXZlciB2aWEgYXV4aWxpYXJ5IGJ1cy4NCj4+Pj4+PiBU
aGUgZHJpdmVyIGFsc28gc3VwcG9ydHMgUVAgcmVzb3VyY2UgdHJhY2tpbmcgYW5kIHBvcnQvZGV2
aWNlIEhXIGNvdW50ZXJzLg0KPj4+Pj4+DQo+Pj4+Pj4gU2lnbmVkLW9mZi1ieTogT21lciBTaHBp
Z2VsbWFuIDxvc2hwaWdlbG1hbkBoYWJhbmEuYWk+DQo+Pj4+Pj4gQ28tZGV2ZWxvcGVkLWJ5OiBB
YmhpbGFzaCBLIFYgPGt2YWJoaWxhc2hAaGFiYW5hLmFpPg0KPj4+Pj4+IFNpZ25lZC1vZmYtYnk6
IEFiaGlsYXNoIEsgViA8a3ZhYmhpbGFzaEBoYWJhbmEuYWk+DQo+Pj4+Pj4gQ28tZGV2ZWxvcGVk
LWJ5OiBBbmRyZXkgQWdyYW5vdmljaCA8YWFncmFub3ZpY2hAaGFiYW5hLmFpPg0KPj4+Pj4+IFNp
Z25lZC1vZmYtYnk6IEFuZHJleSBBZ3Jhbm92aWNoIDxhYWdyYW5vdmljaEBoYWJhbmEuYWk+DQo+
Pj4+Pj4gQ28tZGV2ZWxvcGVkLWJ5OiBCaGFyYXQgSmF1aGFyaSA8YmphdWhhcmlAaGFiYW5hLmFp
Pg0KPj4+Pj4+IFNpZ25lZC1vZmYtYnk6IEJoYXJhdCBKYXVoYXJpIDxiamF1aGFyaUBoYWJhbmEu
YWk+DQo+Pj4+Pj4gQ28tZGV2ZWxvcGVkLWJ5OiBEYXZpZCBNZXJpaW4gPGRtZXJpaW5AaGFiYW5h
LmFpPg0KPj4+Pj4+IFNpZ25lZC1vZmYtYnk6IERhdmlkIE1lcmlpbiA8ZG1lcmlpbkBoYWJhbmEu
YWk+DQo+Pj4+Pj4gQ28tZGV2ZWxvcGVkLWJ5OiBTYWdpdiBPemVyaSA8c296ZXJpQGhhYmFuYS5h
aT4NCj4+Pj4+PiBTaWduZWQtb2ZmLWJ5OiBTYWdpdiBPemVyaSA8c296ZXJpQGhhYmFuYS5haT4N
Cj4+Pj4+PiBDby1kZXZlbG9wZWQtYnk6IFp2aWthIFllaHVkYWkgPHp5ZWh1ZGFpQGhhYmFuYS5h
aT4NCj4+Pj4+PiBTaWduZWQtb2ZmLWJ5OiBadmlrYSBZZWh1ZGFpIDx6eWVodWRhaUBoYWJhbmEu
YWk+DQo+Pj4+Pg0KPj4+Pj4gSSBhZnJhaWQgdGhhdCB5b3UgbWlzaW50ZXJwcmV0ZWQgdGhlICJD
by1kZXZlbG9wZWQtYnkiIHRhZy4gQWxsIHRoZXNlDQo+Pj4+PiBwZW9wbGUgYXJlIHByb2JhYmx5
IHRvdWNoIHRoZSBjb2RlIGFuZCBub3QgYWN0dWFsbHkgc2l0IHRvZ2V0aGVyIGF0DQo+Pj4+PiB0
aGUgc2FtZSByb29tIGFuZCB3cml0ZSB0aGUgY29kZSB0b2dldGhlci4gU28sIHBsZWFzZSByZW1v
dmUgdGhlDQo+Pj4+PiBleHRlbnNpdmUgIkNvLWRldmVsb3BlZC1ieSIgdGFncy4NCj4+Pj4+DQo+
Pj4+PiBJdCBpcyBub3QgZnVsbCByZXZpZXcgeWV0LCBidXQgc2ltcGxlIHBhc3MtYnktY29tbWVu
dHMuDQo+Pj4+Pg0KPj4+Pg0KPj4+PiBBY3R1YWxseSBleGNlcHQgb2YgdHdvLCBhbGwgb2YgdGhl
IG1lbnRpb25lZCBwZXJzb25zIHNhdCBpbiB0aGUgc2FtZSByb29tDQo+Pj4+IGFuZCBkZXZlbG9w
ZWQgdGhlIGNvZGUgdG9nZXRoZXIuDQo+Pj4+IFRoZSByZW1haW5pbmcgdHdvIGFyZSBsb2NhdGVk
IG9uIGEgZGlmZmVyZW50IHNpdGUgKGJ1dCBhbHNvIHRvZ2V0aGVyKS4NCj4+Pj4gSXNuJ3QgdGhh
dCB3aGF0ICJDby1kZXZlbG9wZWQtYnkiIHRhZyBmb3I/DQo+Pj4+IEkgd2FudGVkIHRvIGdpdmUg
dGhlbSBjcmVkaXQgZm9yIHdyaXRpbmcgdGhlIGNvZGUgYnV0IEkgY2FuIHJlbW92ZSBpZiBpdCdz
DQo+Pj4+IG5vdCBjb21tb24uDQo+Pj4NCj4+PiBTaWduZWQtb2ZmLWJ5IHdpbGwgYmUgZW5vdWdo
IHRvIGdpdmUgdGhlbSBjcmVkaXQuDQo+Pj4NCj4+DQo+PiBPaywgZ29vZCBlbm91Z2guDQo+Pg0K
PiANCj4gSSB3b3VsZCBzYXkgdGhhdCBhIGxvbmUgc2lnbi1vZmYgZ2l2ZSBhIGxpdHRsZSBvZiBj
cmVkaXQgY29tcGFyZWQgdG8gdGhlDQo+IGNvLWRldmVsb3BlZC1ieSB0YWcuIE9UT0ggdGhlIGxp
c3QgaGVyZSBpcyB1bnVzdWFsbHkgbG9uZy4gV2hhdCBtYWtlcyBpdA0KPiBldmVuIG1vcmUgdHJp
Y2t5IHRvIGV2YWx1YXRlIGlzIHRoZSBmYWN0IHRoYXQgdGhlcmUgaXMgYSBsb3Qgb2YgY29kZSA7
KQ0KPiANCj4gU28sIEkgd291bGQgc3VnZ2VzdCB0byByZS1ldmFsdWF0ZSB0aGlzIG9uIHlvdXIg
bmV4dCAodHJpbW1lZCBkb3duKQ0KPiByZXZpc2lvbnMuDQoNCllvdSBhcmUgcmlnaHQgYWJvdXQg
dGhlIHNtYWxsZXIgY3JlZGl0IFNpZ25lZC1vZmYtYnkgZ2l2ZXMgY29tcGFyZWQgdG8NCkNvLWRl
dmVsb3BlZC1ieSwgYnV0IHllYWgsIHRoZSBsaXN0IGlzIHVudXN1YWxseSBsb25nLg0KSSdsbCB0
cnkgdG8gc3BsaXQgaXQgdG8gc21hbGxlciBwYXRjaGVzIGFuZCBnaXZlIGNyZWRpdCBvbmx5IHRv
IHRoZQ0Kc3BlY2lmaWMgcGVyc29ucyBpbnZvbHZlZC4NCg==
