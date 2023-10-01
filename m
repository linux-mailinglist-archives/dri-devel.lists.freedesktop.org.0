Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 16C697B46A0
	for <lists+dri-devel@lfdr.de>; Sun,  1 Oct 2023 11:51:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D811310E0C6;
	Sun,  1 Oct 2023 09:51:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 2184 seconds by postgrey-1.36 at gabe;
 Sun, 01 Oct 2023 09:51:26 UTC
Received: from cluster-e.mailcontrol.com (cluster-e.mailcontrol.com
 [85.115.58.190])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2598F10E0C6
 for <dri-devel@lists.freedesktop.org>; Sun,  1 Oct 2023 09:51:25 +0000 (UTC)
Received: (from mailcontrol@localhost)
 by rly71e.srv.mailcontrol.com (MailControl) with ESMTP id 3919EmkW045753;
 Sun, 1 Oct 2023 10:14:48 +0100
Received: from rly71e.srv.mailcontrol.com (localhost [127.0.0.1])
 by localhost (envelope-sender obitton@habana.ai) (MIMEDefang) with ESMTP id
 3919ElBD045581
 (TLS bits=256 verify=OK); Sun, 01 Oct 2023 10:14:48 +0100 (BST)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
 by rly71e.srv.mailcontrol.com (MailControl) id 3919E2cZ043054;
 Sun, 1 Oct 2023 10:14:02 +0100
Received: from EUR02-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur02lp2113.outbound.protection.outlook.com [104.47.11.113])
 by rly71e-eth0.srv.mailcontrol.com (envelope-sender obitton@habana.ai)
 (MIMEDefang) with ESMTP id 3919E14o042183
 (TLS bits=256 verify=OK); Sun, 01 Oct 2023 10:14:02 +0100 (BST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WLMaW80zV6PFPueiomD5OgcdAncSI4ce/5e2DEZ6JoYqmJODk50Dxd9NCXPaaSHMEREymMUO43cl2W7GCdWjgKzIxjtS/rjL3SCUCxgy/aDLsjZdVlzEimaZbjfKKt84oGfV4xqKS3C3a0jA/QgD5cLp0dbhjJqp8rJ1sH7UNgy8I09FAAj0Z+yIaYbPsYWRPTx/UAOH8HjNjXo7FnxhcVLz1NL9wrOxg3WWcuwa+JVu6hwPZqgAzbYZv/upej1myarJHOCUcqBlaYUvqq6/LZ5qOkf+GXmo+1pVLIXuXzG0vGVRyLdwPfkGA6mkyPBieEJsiw3OpHnPHgeYHDihGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hOwsrGohpLJS08j7ndetFkYLSR8fxxL0VIu/PFvKGEg=;
 b=OvS+gLImzYHyi9yatX9RvI3lFktcU/JYhGg1jHuuGxgsPvLAylal+dGunKk7pAB1NhBkskY+J8+jziecpvQeIOS+tpBkdAZbD/u8wN7bdwFvXRbRq4ZfzPDDlLK64HyerVtAuSz/kRXpUTI9faAf34TUJbBOe4cUKl+tp1RvreiexTsEZeP2GIpWo7+2+OmomPjmQlUoqxfYBRez0UFW0z2oPr1brZwnBe9bD33IqoGt8UOXkOJXNdz4Wq18N5p/QVmStVxfV7wPCflUDo1e7gGrgVQjQeFdZRp3HaWqMILDhH167fV279qQPPNmt3XVzCjM+F0mysRFEzQeu+8cKQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=habana.ai; dmarc=pass action=none header.from=habana.ai;
 dkim=pass header.d=habana.ai; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=habana.ai; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hOwsrGohpLJS08j7ndetFkYLSR8fxxL0VIu/PFvKGEg=;
 b=aZ+qtRctmdnhJVOFSmIna6Xu+LmF9B5JZo9r3FYtnGLQCng98iClHIrXOTt84DPx2ogwf2Rrt1O2bLEjBTYpquuvI7l6YiBednkZNgGXK204ujQzncSazwJLFVvucE3+Mvg9Q4Ev4RqnuqyYpBi4FOIc2TCUkzMYf3zTRynLn/2lns5fYKHuaLKYrjcOHJeGeeaI/lJHli/AlAfUKFil+Mq+7sVdoIvv8GeHVxdaErn3bqknzqWZdywZ31A3JxoN0OHA/ojCsRnZXEhNGYnjlb19PJssJKd6VUV+ThErsD+EqPztTl5J/aabcvsjBe2OFki6VQY7MgCu35HLI5TDuw==
Received: from DB9PR02MB6619.eurprd02.prod.outlook.com (2603:10a6:10:211::10)
 by AM9PR02MB6771.eurprd02.prod.outlook.com (2603:10a6:20b:2c6::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6838.29; Sun, 1 Oct
 2023 09:14:00 +0000
Received: from DB9PR02MB6619.eurprd02.prod.outlook.com
 ([fe80::6623:3577:f97f:22c3]) by DB9PR02MB6619.eurprd02.prod.outlook.com
 ([fe80::6623:3577:f97f:22c3%7]) with mapi id 15.20.6813.027; Sun, 1 Oct 2023
 09:14:00 +0000
From: Ofir Bitton <obitton@habana.ai>
To: Oded Gabbay <ogabbay@kernel.org>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] accel/habanalabs/gaudi2: fix spmu mask creation
Thread-Topic: [PATCH] accel/habanalabs/gaudi2: fix spmu mask creation
Thread-Index: AQHZ8g9F0v9MHSGxWkO6jHPdFRqjPLA0qxsA
Date: Sun, 1 Oct 2023 09:14:00 +0000
Message-ID: <e73b2f24-0a12-c8c6-cbc8-ecea9bfa803a@habana.ai>
References: <20230928132527.89451-1-ogabbay@kernel.org>
In-Reply-To: <20230928132527.89451-1-ogabbay@kernel.org>
Accept-Language: he-IL, en-US
Content-Language: he-IL
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=habana.ai;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB9PR02MB6619:EE_|AM9PR02MB6771:EE_
x-ms-office365-filtering-correlation-id: a09a1292-a95c-4708-c4af-08dbc25ec002
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: mOII9W7eZezxreD0dcrrBDFlGEahfbOzsw8mmeu0U8Gj3q9u80vHSzhUUN8ymTMXP5/a/c9dgySGmEwhSv0DzaYwjOhisqUCDlD4bBR3vMpBkR2dr3fRco4V6O8yrqLT1uQmr4UTsQ/db/puS499Iofn5wPIs7jX1D+xGRda8YVyI88eF62zFGJLPgElnvT8SensJkBwR+9pYCxRZUNslReCpKslU96ks1ViChR3RGmDcOAARu49XDCoddr/OcGpStTSbE0uVKx5hTArsRMxXorq7hNLpryCGLsG5u6xuIqCxd4tciCbs1dNVuoTiB9O6xBPW4KXJOBn8aiAwOw1VTMQ/Bx8Xp4x/Iqurhod+nDpwKyETOxrvwheiTOYKw4funb+oT6nKH0ABzm/HTmHGjYxBB5VZgGsnSmSUl4iWDqolrahSHTVWZTfy02VvwR1xce5fVMmzHEtBk6x7omun1Jci8Qmbx3HH4iJfiXuFUX8VqFU4K2pzUP0O0PL6mM0pLM6blNEtgO/zxQvGnNPvtLv154bPXLJxVcq50WOTv/g8wj4sqzNrp6UolsctmKZEG9kTZDCuJJFJjkIttwlBIlk+1nPoFEZ6hXtGl41J/kK9inOAFfFj3Mrlp/L6DopNsvx9VlQTh2prZUL04xYXZggP1LKeD/VK3JYY5JIzu5MjGSGvMNNTvgZ6e5Mq0Zi
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DB9PR02MB6619.eurprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(396003)(136003)(39850400004)(346002)(366004)(376002)(230922051799003)(64100799003)(1800799009)(451199024)(186009)(2616005)(26005)(38100700002)(82960400001)(38070700005)(122000001)(31696002)(86362001)(36756003)(83380400001)(316002)(64756008)(8676002)(8936002)(5660300002)(41300700001)(66476007)(66446008)(66556008)(66946007)(91956017)(76116006)(110136005)(2906002)(31686004)(6506007)(53546011)(71200400001)(6512007)(6486002)(478600001)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?MGxDQUhTS2JmeXNzbDN2WTh3OUFwYUxlWTVENExCTWVyN3o5NDE4bldoK2Vu?=
 =?utf-8?B?cFAwTHFBTGZKSTVGVFhnVkhzdTFSL1grbThORVVrdVdIUWR0cUw4ZnMzSjRY?=
 =?utf-8?B?ejlXTld1NlI5UG5qNWhFdHZSRURCdXBYemV6Nkhhc1QwUDNWNUxvNmZZaUI1?=
 =?utf-8?B?MzVyY0h6dEFBMXFvK0pWYng5ZzhLYml3M2hCd1VRdFBmajdJcUhxdGVJY1VH?=
 =?utf-8?B?ekVUZmxtaGlreEFFcEZERTRwTFl6YlJtRFdZVVFpRUFZUXRycHByZ3FmY1JK?=
 =?utf-8?B?N2NYcmhidmswdDZVRDhseGJ1RXl5WlVHQkJGQllnZWZGR2IyU2pFeUt6bCtH?=
 =?utf-8?B?MDJIOW1ySUVGUmE5SGU2SDRwenU0bGg1K1BhOWp1alBQbjM0NmppTzgyVDlw?=
 =?utf-8?B?K0cyYTBrOFJibGZNZHhVUVlCck90VjR1NXFLMkY3YmZ4Zlo4cjlRSzE3bENF?=
 =?utf-8?B?ZlllbFg3bWZrMDBaUThzUVk2NGgxTFk0c0pnRG9sbkFqSkt4emo4N0lGcC9r?=
 =?utf-8?B?amNkMU5iakp1Qm1RWWI5WTc0Tmplck45SG03c3NsR1FyZ0FveXBwT3lNeE1U?=
 =?utf-8?B?djdTZ2JQUVJodExEVG4xa0pQY0I2QlVDT25mSGlSRzNPZzJFekF1ajBRaVFu?=
 =?utf-8?B?UStPdlBLbUVnTW1TSzNPWng4TW1JL3FlUzFHOW9TZ01BbU5lYXZwem5pUUlQ?=
 =?utf-8?B?aVowRVcyejFYSFk0b2VXSmxma2VYVERrM21TV2pEMUl4akswSzhaTkd5enpr?=
 =?utf-8?B?V0ltd0o1ODYzVFc3US81R3NpQUg2WGVGREVLK0paSTRYT1JxcjA3K0xJZGtt?=
 =?utf-8?B?Q0VWZllOMzJwNHQvY3k3Z1ZoM2F0UEJIb1ZBcElFQzlwRndDSkRVMXQzbnpW?=
 =?utf-8?B?MUwveG1BMDRxOExnL3UzSzhub1VLQVJQbE1QQUhlaG45cGJmMHdoMGlDdENJ?=
 =?utf-8?B?ZExOREI3QXNtU1VBY3ZGSk41VXFOalhUQngxeU9nMjJZaUZXK2tFYkhCcS9Y?=
 =?utf-8?B?dm4wWEFQZW1JYlFsVE10c3dEbVBIWVZNYWsxcEdseHp0R0FtZmMzZE5qNW1t?=
 =?utf-8?B?L3JSeWZwKzN4bndnVHZZdzlHVFNGNXRtT2UwMSs0dlYzdjNkU1VoQjRScUpP?=
 =?utf-8?B?c21VbERGR3htVktuYW4zclFxNDVwL2g3NHlJODVKd3dvaUt5cjI3dThhOFJL?=
 =?utf-8?B?cWlGZEh1aHp6UjZ5ZzJjMlFuZ1o5bDQ4RE1xdG52MUd5MnlKcWIxNnNHSWdn?=
 =?utf-8?B?RHd0Qk1lMzZ4TTEweW5qenZtMDZ3dnV6MVhpblVnVmpVUkpTeGJhUUtBZUtF?=
 =?utf-8?B?a2Nnb2RIa0c4SjZRWUZXMUp0RHRKY0tQeklzYUFUWjBQR3FlTUxaQWRKSkd2?=
 =?utf-8?B?cUFJYzdTT2JUeW5BZGtoZGZDdUVTWm85QTVmMGoyRHdudVdkcTRXeEx1aHl1?=
 =?utf-8?B?aTZ0TEFucExEekxMZFI0dVYrSVlrRTRrb2dVVzJuck5VL1A0UHZMUm8zNzFo?=
 =?utf-8?B?MldzZit0MlExZ0MvcUg1aC9EWnJRd3YwSmJRM1NLR3RuSVBCd0krN24zRXc3?=
 =?utf-8?B?c0FxZ3VNcXE2K05lNnZIc1ZGS0k1S3pENVZMdTE1ekY3anF5WUpTZEVhMmZu?=
 =?utf-8?B?eE1SUE1hSzJqcWR2Q25nOU5yVXpMZ2dMcE9WeEJRU2tBN0hIM0hzcnl0VWo5?=
 =?utf-8?B?SWwwVlYwWDliQ1JHL3FNTHMydDJZdlJtUWxwRWQ1cVhMMkw5SVNNek8yZGpO?=
 =?utf-8?B?TmRxa2hlVE5xRjBqZTV0cm9CbVRhL3BFZEZvNW9UM1ZEVzl0b2xoeHI1dFhn?=
 =?utf-8?B?eEtWNjZzcWVoNEpMZ2U5cy8xdGVtejZ0bDNzcmdvUTJaMk5ydElWQkRZYjR3?=
 =?utf-8?B?QTNNbUFFdkdYVjdpamlMWXkzTW9KS3IxeklMZHUzQVpxTkdtTDlYb2grOTgx?=
 =?utf-8?B?N2VTSURiK0V2eHA2Wi91WWhmdkpZRjFWYXFZTytmRFJLR0JOd0MzcHJNbnVX?=
 =?utf-8?B?U0xiTDlCWDBVdVhOWHk3RHpHOXhaMTFmdjFrVHlyWVhmRXJJZlN1WlN6TEY3?=
 =?utf-8?B?aFNCMHRQSUs5RzlYRGpvZDhBYkwyMythanV3N3RjVFVReFdSalZnSzNXWldl?=
 =?utf-8?Q?K3mE=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <22AE398367767349883D21C0829D4EF6@eurprd02.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: pm/+i9ZL6RH5CI2OU1k4i8Y5pOmnCl8NeK00fpuJNE8helcczQnRC4c9Jnny8Wj13oaXNIpozIVZvTR5hrMGHSHbDfyAL/fUXFLqTmZMG4s0D9DXVyVvAKWAJI+P3hQ7l41vdP5Bvf8aysnYGQJMshkZ61hZ6F6Ym5hVMc7Kc/OqRPsubD+q/WmLT566y6bCSFWlaiA1ZcF/Fgg9GegSwxmVRUCn+JFbA/Ryn2sgqL8acoGqWN4C3c1MwuFEpbSjNFPrKpxd0I1kRXBUPmYPp9hYqk+RWVO1Jrzqg80UGE3Ruujx7iAJpIwlsuk7nMk8T7IsxI7xOuFeRjfu+9qIZjfcpCY9WeoFj3mjGwnmeezAJM6ByiQjr79aZxTrNY5lkTHyB9/va9WB/UhpTAzwr5AFs/d5l0NENpc/9x00NbLOgTZ6viCjCqQ7pP3S0bFRNUOdeiNeWEf8oZAl7bGVSD8SVmTLzqnfG8sYfYbPp11tcK2QggNdsq0oqB/6KZtV3ORqKOqzV4V7jUjkOBLPpsGLxGqIuYZPcS2ORkJtz9uzfhwZulU34A41h0BXxeJPPob/zQGDVAtoRZS/8wRrscbIFXbCUtkP7zGM57DcvNk2D19jZaodaEo8AHQgE2bE7bm9y/YO+zXDAqOetM8SjDXB1LGWiOBWAwmgfzeOBpXq7FfzU+PwcvtmYTIErL+g/5blg34wmfQeOXQK/JC/Wo5bnI8q4w0vZHE7ztRmmmRgNe16CbifeB0j50TvqyrX2cZ+YGyUEdOYHARdRqMxy8dpDBiP4sVpK0O1/BrpO6Ie6/RzEybkNP+RcQHrgoyqri2bOL13xBoBmPI6/xAze/tF14+gobGExuF0p+K6PfhRp/GQGUHUJ0gDQLsNogcI
X-OriginatorOrg: habana.ai
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB9PR02MB6619.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a09a1292-a95c-4708-c4af-08dbc25ec002
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Oct 2023 09:14:00.6654 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 0d4d4539-213c-4ed8-a251-dc9766ba127a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: GHgxUjjUtM+seEXjvdk5I3Moamo88LQ1+wcr/INSxoQGDsMRNRAKsaJHU+dzGnEUzmWlBwFISiG4ahwOsWA23Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR02MB6771
X-MailControlDKIMCheck: cGFzcyBoYWJhbmEuYWkgW3Bhc3Nd
X-MailControl-OutInfo: MTY5NjE1MTY4ODpGUEtleTEucHJpdjoL+svcUAE07E8wJ+HijtvPMYoq4i5TrQXmCtpGmu+Bc5FWZzV7TxlGZKy8mYkIUcvFvhMa2PqM4uqgC6gjoVGET1/Or/2O49VGw6LKlBePdfXIsZu5PGyqaVmd8xOtt8q43IsvDqZtJ2iytL3eW9BwhyPgQ6Ne9KJvThPd4+vTrhzDCuT0HG9Tuhr/yiSHf2/rtWgbY2FUa2K86Ey8ZZ6u78l2Tpb2MHitRTdgreI1qk2MKioibrOuYwms1CKdOJR+1H5JD6MrS2gLGnRPdcvKwzz1/pwA5pJinuXo++G20MBIHHGzA5+0Tx1svLyPEXBKRabmg1ltKlkbaOmSoY19
X-Scanned-By: MailControl 44278.2141 (www.mailcontrol.com) on 104.47.11.113
X-Mailcontrol-Refers-To: 3919ElBD045581
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed; d=habana.ai;
 h=from:to:subject:date:message-id:references:in-reply-to:content-type:content-id:content-transfer-encoding:mime-version;
 s=fpkey81949-1; bh=hOwsrGohpLJS08j7ndetFkYLSR8fxxL0VIu/PFvKGEg=;
 b=2lix9wjXaQVgVDV959URKVvEXbWkokbR+c2fbUAACAh+7UYXqm1E6l7B/LufnlJwGZoYI9KYrS+5DO6VIJr71v2titSXDyXFoPjnzHBjcbFc0NetF8DbkZ0qOzc3TkfblzKb+J79cqoI1K/FW6dCJhSHPFcxTD3sdG9LRgP7dh2ZFhiS+n5VvAaEN8AE7ILurVBG/rI1byQSKr3KVn6FLN8yB/sji28hYu5Du4fqoHjKealzWHH+SFB//uJ0SstzHmcYaeaDpwS6e69TqZQURiljyDSGq98UAANwayd4ol4bNCXRYKbAX4yKCaiF6OyAEbfILRL7xzrIG7AlycjETw==
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

T24gMjgvMDkvMjAyMyAxNjoyNSwgT2RlZCBHYWJiYXkgd3JvdGU6DQo+IGV2ZW50X3R5cGVzX251
bSByZWNlaXZlZCBmcm9tIHRoZSB1c2VyIGNhbiBiZSAwLiBJbiB0aGF0IGNhc2UsIHRoZQ0KPiBl
dmVudF9tYXNrIHNob3VsZCBiZSAwLg0KPiANCj4gSW4gYWRkaXRpb24sIHRvIGNyZWF0ZSBhIGNv
cnJlY3QgbWFzayB3ZSBuZWVkIHRvIG1hdGNoIHRoZSBudW1iZXINCj4gb2YgZXZlbnQgdHlwZXMg
dG8gdGhlIGJpdCBsb2NhdGlvbiBzdWNoIHRoYXQgYml0IDAgcmVwcmVzZW50cyBhIHNpbmdsZQ0K
PiBldmVudCB0eXBlLCBiaXQgMSByZXByZXNlbnRzIDIgdHlwZXMgYW5kIHNvIG9uLg0KPiANCj4g
U2lnbmVkLW9mZi1ieTogT2RlZCBHYWJiYXkgPG9nYWJiYXlAa2VybmVsLm9yZz4NCj4gLS0tDQo+
ICAgZHJpdmVycy9hY2NlbC9oYWJhbmFsYWJzL2dhdWRpMi9nYXVkaTJfY29yZXNpZ2h0LmMgfCAz
ICsrLQ0KPiAgIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkN
Cj4gDQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2FjY2VsL2hhYmFuYWxhYnMvZ2F1ZGkyL2dhdWRp
Ml9jb3Jlc2lnaHQuYyBiL2RyaXZlcnMvYWNjZWwvaGFiYW5hbGFicy9nYXVkaTIvZ2F1ZGkyX2Nv
cmVzaWdodC5jDQo+IGluZGV4IDE0YTg1NWNkYzk2Yi4uMjQyMzYyMGZmMzU4IDEwMDY0NA0KPiAt
LS0gYS9kcml2ZXJzL2FjY2VsL2hhYmFuYWxhYnMvZ2F1ZGkyL2dhdWRpMl9jb3Jlc2lnaHQuYw0K
PiArKysgYi9kcml2ZXJzL2FjY2VsL2hhYmFuYWxhYnMvZ2F1ZGkyL2dhdWRpMl9jb3Jlc2lnaHQu
Yw0KPiBAQCAtMjUwMCw3ICsyNTAwLDggQEAgc3RhdGljIGludCBnYXVkaTJfY29uZmlnX3NwbXUo
c3RydWN0IGhsX2RldmljZSAqaGRldiwgc3RydWN0IGhsX2RlYnVnX3BhcmFtcyAqcGENCj4gICAJ
CSAqIHNldCBlbmFibGVkIGV2ZW50cyBtYXNrIGJhc2VkIG9uIGlucHV0LT5ldmVudF90eXBlc19u
dW0NCj4gICAJCSAqLw0KPiAgIAkJZXZlbnRfbWFzayA9IDB4ODAwMDAwMDA7DQo+IC0JCWV2ZW50
X21hc2sgfD0gR0VOTUFTSyhpbnB1dC0+ZXZlbnRfdHlwZXNfbnVtLCAwKTsNCj4gKwkJaWYgKGlu
cHV0LT5ldmVudF90eXBlc19udW0pDQo+ICsJCQlldmVudF9tYXNrIHw9IEdFTk1BU0soaW5wdXQt
PmV2ZW50X3R5cGVzX251bSAtIDEsIDApOw0KPiAgIA0KPiAgIAkJV1JFRzMyKGJhc2VfcmVnICsg
bW1TUE1VX1BNQ05URU5TRVRfRUwwX09GRlNFVCwgZXZlbnRfbWFzayk7DQo+ICAgCX0gZWxzZSB7
DQoNClJldmlld2VkLWJ5OiBPZmlyIEJpdHRvbiA8b2JpdHRvbkBoYWJhbmEuYWk+DQo=
