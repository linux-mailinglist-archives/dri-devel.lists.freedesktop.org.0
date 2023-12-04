Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C545280425D
	for <lists+dri-devel@lfdr.de>; Tue,  5 Dec 2023 00:06:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8190110E433;
	Mon,  4 Dec 2023 23:06:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam02on2059.outbound.protection.outlook.com [40.107.95.59])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 824EF10E430;
 Mon,  4 Dec 2023 23:06:35 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Xd5bQyKpTCaXd/72DCMQq8uX3+UzS8IpfE3kFLMP2f5VWyEzarBj4tiwn3/XuNvIoTSIsW/ypcXLzIAcw/oDyCBjD0G2Yn/VLnFur5T1orW3p902u+UeFrcpH40cC4QdPPe0Sbdqne9bP8I7j6OzCR4GT/XVmtq9mBdpRG6pXF0/Pqsohvdq8kG9wGrEIWnTM2txIlV2rpRWo5pH9UM/e8wAXDH+HYYKuEs/QtRlmUT8UgFGuh20wspRB+uVrtNMyHiNvBFchpAskNXmHQ2DdkwUePNA7a4roWK+zhyCtV6WBICzOnsDUjWXvYcSHj+Qu0EH6N/vVib19i6IPaQ8EA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YXUN9ekSauEQ2/tk1vt7BEIYxFwoHxaRuNKcuui3QFc=;
 b=JGos136ynIeYZWguGLctzn8G98otH8f9iNIeRXb8mIXUhIZU6oQTGCL7+/QPnoyBgONBUL6fDhz+E1+9jL5YzBOfDNKyM7y6jAmJNJo37sKTnACeg4mM7AyTsNWBG25bLYi5cW6jrP6xm/9NXcx1AqLFEVVHuP1kR10JiJo430so5IaAvfG7N96PIy3ViPCzTKRN2PpNL3W8f9ct52FLq8hjroFBD24DZTB3HRRE6m86HpmjDBwiN2jnKBJyxvf4vNJVODuON+ReIGWU1z8U9qcCWyD6LHaWyp5xal2KeBiKJxPUjdZJf5jQW3JpOw/d4jYmMXDpaKi61ySVwTQ7HQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YXUN9ekSauEQ2/tk1vt7BEIYxFwoHxaRuNKcuui3QFc=;
 b=h0OOvg3glnBxaPDVGupUWqxEaYOLxZ19kFeLLamdVDR6rpN/Gf1N73uEAfr/WRkUec++H5WYFVXpp//ohXoMaltEda46oxvQ8xldwYPE/LcyNGOgVSGBPvJwAhcPMYWXnf1ntZ0sOkfk/salVs55yMeMlvDFMUk+qDI8F+mjB99eqc6yf0yfGb4hHzQQEOvvfBXASVyRI5WwjN16PjTE/Mu3FQjQ8Gqcvyl0AgBOW6DGrjOVKUMSe56xmOsDJICjpMTugenfcElpZ3l1slZJTDGB9zt4w9SkxbvBXV5PSwEOdFBkALNqjHZMMnlrvOHi2SA4C3VH6prx/HbNd8PYcw==
Received: from SN7PR12MB8769.namprd12.prod.outlook.com (2603:10b6:806:34b::12)
 by LV2PR12MB5846.namprd12.prod.outlook.com (2603:10b6:408:175::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7046.33; Mon, 4 Dec
 2023 23:06:32 +0000
Received: from SN7PR12MB8769.namprd12.prod.outlook.com
 ([fe80::6799:dc7a:e121:1af6]) by SN7PR12MB8769.namprd12.prod.outlook.com
 ([fe80::6799:dc7a:e121:1af6%7]) with mapi id 15.20.7046.033; Mon, 4 Dec 2023
 23:06:32 +0000
From: Timur Tabi <ttabi@nvidia.com>
To: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "airlied@gmail.com" <airlied@gmail.com>
Subject: Re: [Nouveau] [PATCH] nouveau/gsp: add three notifier callbacks that
 we see in normal operation
Thread-Topic: [Nouveau] [PATCH] nouveau/gsp: add three notifier callbacks that
 we see in normal operation
Thread-Index: AQHaJwT955NYBg3wsU+Lpx9E0tOTLbCZvv+A
Date: Mon, 4 Dec 2023 23:06:32 +0000
Message-ID: <30f51ed33c24b531649f876722a52f6628c194fb.camel@nvidia.com>
References: <20231204225519.358885-1-airlied@gmail.com>
In-Reply-To: <20231204225519.358885-1-airlied@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.44.4-0ubuntu2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SN7PR12MB8769:EE_|LV2PR12MB5846:EE_
x-ms-office365-filtering-correlation-id: b494c777-518f-404b-3830-08dbf51da7cd
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: zlCv8QCLVys0IB4DrLDBqGekVkBbs9ET5Wt5EnVffrxVYP8vXqMqb36S01u823WL5+dDd6UulQUdazUhZt+unAjJ/ZNl5UDy7v/4VkvKkxYjwaNzYbJ8QtfArH9qiDlt7IPNyaXCYRNGMCoeI5UAnMUbQEF4zTc/WR30yFk59p+9xsAj+vD7JrDKZT8ZfLDRUHRaTw3Y5/qlTcQVyUdWEalqhg/PCWCrZ3Bh3GY4xhQ3AQwUk2DVeyOA/PB2DNsBwhjd1E37KgV4hS3+dzxupGaBA4R6PxN8wjpyU5PS8bOpVkWo7Ay2nID18R0YNdylnmkEY35NNAjI6H0Wt2sENjrOXNZdPcVJw2iKhx1mOEgr3SRhHtK8Aw7HjK4MaH4ETS/6GC+TJK08Oz/bWr7HPogOcuuStRmp2oCGLSaxDsXXQ1daL4uisLOENyS6KhLp+NKBQ9Z7HJDhIIMF1WkHPmSRAQVHKgPCAGs2kVjEklo7G+Iu1MBPGY8mq2D7xsiQYK5+B/42RsOJ5iOgjOOq5XtDs6Wc9P+6QJk1mYqXgW8khAI/BAoyYgq3m1zP/DFA7F7abmTsHVS5Lm0ehfArlK+/75wX35Wgq/cikP2vh/y25ku3ab2I4LXW8wJOA6kk
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR12MB8769.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376002)(366004)(396003)(136003)(39860400002)(346002)(230922051799003)(186009)(451199024)(64100799003)(1800799012)(66556008)(316002)(71200400001)(66446008)(76116006)(66476007)(64756008)(66946007)(110136005)(6486002)(478600001)(36756003)(5660300002)(38070700009)(41300700001)(2906002)(4744005)(8676002)(8936002)(4326008)(86362001)(2616005)(26005)(122000001)(6512007)(6506007)(38100700002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?NDRodkdOQ3ZrMHNnSkZDWFp3Q09EKzlxaHNIN0xOTWVGVDFxbU9tOXJIa2dL?=
 =?utf-8?B?dmh1QWFTL3V1dEVybkcxeHBlT0FVRWZ0VTBzVUg2Zldpb2NwSk5VbUhibjhr?=
 =?utf-8?B?ak80R1VjVXdOYkF4M2ROMStNOU5HUVFpa0g0UzIyYS9XVlJ2eUZLVHp4SUZ6?=
 =?utf-8?B?eW9wOG8rUEJ6cmpwb1FTRTE4NHkycVRzU3ZEcUR1YXByTWQ0WTdsekQxYU9I?=
 =?utf-8?B?VzFSM0xPRXJtdFdXSEZta3hkR0dFc3RsOVczWWx3TTNSbk1jWkVZS1h1a3N0?=
 =?utf-8?B?V0QxVGhYa0U5T3pPbGdmdWtTSGp3RDhCUEZKd25LY3hyUG92UzRKTDc1RTVk?=
 =?utf-8?B?VWZFeHRCclp2K3JKSnd4a2Nubk44bVh3WGdueTlaYTVJU203UjZvYm55Ujcw?=
 =?utf-8?B?ZG8vb2R3R2dlU05NN1Y2TDAwSDNZWXJhaWl3TU5PRldLeWxYejNPSElxUWtE?=
 =?utf-8?B?bTFiU2VOMHA1VHJkTFBtOGkxZXJ6WHk3NjZ3MnJrQnZkdmxWcEhZTHFvME1T?=
 =?utf-8?B?Qjk5Q0dwd0lOaE9BR2kzZDJiMjA0TWhRdzRCVmFROUkrM1lJTGplQzh0eFU3?=
 =?utf-8?B?NWhQaC9raHZ1Nis2Vlk2VWRXdFNlUlhUUUxpTTB6MVNOcDFOVFNzZHlUR3Fp?=
 =?utf-8?B?NmZmcS9PTlhnMVdGVkprMTBSZFkvM0xnZEhhbGRTVGdSQndRcnU2d1hnKzAy?=
 =?utf-8?B?WnNUL29sK3pkQVlEVWhadTNFOTZUY1oweW1TblptdVNrOGZLa2NNZ21UM0xD?=
 =?utf-8?B?M0NOVkJPblJwaE1nRE5IemhKZDdXYWRPcC9EaWhIc1FkYlF1WWhKc2NRaWtQ?=
 =?utf-8?B?emhUeEtQV3BqTjloRS9SZVVkelBkWEk4Rk1NZG4zS25KaVp6OUhMcUdjbXVt?=
 =?utf-8?B?ZHNNd1VpejB5SHcwYWYvakcvZHpvSnRaaGdHSnhqYnduWS9HQ0pUVS9kREdx?=
 =?utf-8?B?YlpuaHVTajhxWXV5bStNd0FxZVk5QUJoNUczemdMY25Cbk16ZXVyeUFCb05G?=
 =?utf-8?B?MVVTTWdOL1VSUmd1cnFYOUFnK09XbUFWZUJiZ0hqM0pDNEFSaDFiS0hmRE5u?=
 =?utf-8?B?Z01DUXpTMTZ1SndwNGR4U0Q1Q3JVRUNvM2hlTEhHcXZ5c3p2S2tWMmVnUks2?=
 =?utf-8?B?bWxHV2ZZZy8rRW9yeCttSmdoV1ltY1o5VkZOVTdOTWFEaldXVnM4dThnbWhZ?=
 =?utf-8?B?djlnWXlCMlRwdVlmek10RmJEL3VMenFNRnNZN0VzcHU4ZUFKQTFISFBTTllw?=
 =?utf-8?B?L3NSTWl2bjAxUW5FRnh3aVNiUXVHVDV4WjMzK1NmbFFlU1hDTjhHRnczRjVV?=
 =?utf-8?B?OXhsUUxmQ21KdDdvQms3ZHBicHNCZlB1aFhWa1BHNE1zYVJ6U1p3VWFEajNz?=
 =?utf-8?B?elEvWHpvcnVwZ09VWWlFN3UwRmx1VlROT25ZY25FZXI5UmEvbHg3RVBFL1FR?=
 =?utf-8?B?aGwxNG1sL3hldXQxbG1IckNQZGE2UFlaMGh5VUI2am5aRzFkMzFWdXBTUE9B?=
 =?utf-8?B?T2M5Sk52VEo2MTA1Wk1jL2M1NWg5S2NabFBYREdiZU9Od2pNdk9mM2tKSldi?=
 =?utf-8?B?Mmk0Y3g4aHNsenU4cFU5R0pna1NqVGRFZXhyTzBweHB6dHlzZ0pQZ200VzFU?=
 =?utf-8?B?NVU1UGpaZ1VBMkEveDNGVW0zM0FVVUtKM0tORmJnTk55bmZ2NFE0NFpMRDNF?=
 =?utf-8?B?N1ppQ055MVdMbW03czZMWjR6d2xHMGtPYkNwMXBITnhibWttTFFoaFkrbUg1?=
 =?utf-8?B?WnoxdFlwaEhMRTNjUzhHUExnWGYxeXpxR0JqYmxSN2d4bmZ5TVRoYlBJemRH?=
 =?utf-8?B?ZncwSlZLYWxPMEV6cXcyVlNPMDdoQnJ5Wm9VUUt5a0dFcFlpTzhyL3BRRzV2?=
 =?utf-8?B?bkV3QzdUbGZYMno0SHBxL2tVTThuU0dUYjZGRWJTUjZzdGRWb1pOSG5INVdZ?=
 =?utf-8?B?c1I3OEVscll1M21FYXhvRnNVUTRrVU16c3BpVFdidkNVb1B1UmFoaXo4VTgy?=
 =?utf-8?B?eDZUL0JoWDgxRTh2U1hzWmxYei9CVG9CdjUrWHpDbHZMNENHNkR6Sm91MjB0?=
 =?utf-8?B?eXY5ZWRVY0tQYmluT3JFc0h4WjQ4UlNuV21jZUIvQkFneXRFeFRnaVNLTmdX?=
 =?utf-8?Q?WfgqBmmDqHYb84jXaheR8F2Mn?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <071ECA419B5D5F4CA07B2E58DD6941AD@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN7PR12MB8769.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b494c777-518f-404b-3830-08dbf51da7cd
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Dec 2023 23:06:32.1068 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 0I9w5zLWBgLOqAKeMl97YwX15tt2GHmRDM2AiS9TuVYhObwaRwDs9gWgUd1OkPLhWpBJv9wVVHNeR54SQg5sFQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR12MB5846
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
Cc: "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCAyMDIzLTEyLTA1IGF0IDA4OjU1ICsxMDAwLCBEYXZlIEFpcmxpZSB3cm90ZToNCj4g
K3N0YXRpYyBpbnQNCj4gK3I1MzVfZ3NwX21zZ191Y29kZV9saWJvc19wcmludCh2b2lkICpwcml2
LCB1MzIgZm4sIHZvaWQgKnJlcHYsIHUzMiByZXBjKQ0KPiArew0KPiArwqDCoMKgwqDCoMKgwqAv
KiB3b3JrIG91dCB3aGF0IHdlIHNob3VsZCBkbyBoZXJlLiAqLw0KPiArwqDCoMKgwqDCoMKgwqBy
ZXR1cm4gMDsNCj4gK30NCg0KVGhpcyBpcyBwYXJ0IG9mIG15IGxvZ3JtIGRlYnVnZnMgcGF0Y2gu
IMKgSXQgY29udGFpbnMgdGhlIHByaW50ZiBsb2cgZnJvbSBhDQpQTVUgZXhjZXB0aW9uLg0KDQpE
byB5b3Ugd2FudCBtZSB0byByZXNlYXJjaCB0aGUgb3RoZXIgdHdvIFJQQ3MgYW5kIHRlbGwgeW91
IGV4YWN0bHkgd2hhdCB0aGV5DQpkbz8NCg0KQnV0IGlmIHlvdSdyZSBub3QgcGxhbm5pbmcgb24g
YWN0dWFsbHkgZG9pbmcgYW55dGhpbmcgd2l0aCB0aGVzZSBSUENzLCB3aHkNCmFkZCBjYWxsYmFj
a3M/IMKgRG9lc24ndCB0aGUgZHJpdmVyIGFscmVhZHkgaWdub3JlIFJQQ3MgaXQgZG9lc24ndCBy
ZWNvZ25pemU/DQoNCg0KDQo=
