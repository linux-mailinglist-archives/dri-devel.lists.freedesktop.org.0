Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CAC3DC3DA
	for <lists+dri-devel@lfdr.de>; Fri, 18 Oct 2019 13:19:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 81B436EB19;
	Fri, 18 Oct 2019 11:18:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04on060d.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe0e::60d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 897346EB19
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Oct 2019 11:18:56 +0000 (UTC)
Received: from VI1PR0802CA0025.eurprd08.prod.outlook.com
 (2603:10a6:800:a9::11) by VI1PR0801MB1935.eurprd08.prod.outlook.com
 (2603:10a6:800:87::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2347.21; Fri, 18 Oct
 2019 11:18:52 +0000
Received: from AM5EUR03FT046.eop-EUR03.prod.protection.outlook.com
 (2a01:111:f400:7e08::205) by VI1PR0802CA0025.outlook.office365.com
 (2603:10a6:800:a9::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2347.23 via Frontend
 Transport; Fri, 18 Oct 2019 11:18:51 +0000
Received-SPF: TempError (protection.outlook.com: error in processing during
 lookup of arm.com: DNS Timeout)
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT046.mail.protection.outlook.com (10.152.16.164) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2305.15 via Frontend Transport; Fri, 18 Oct 2019 11:18:50 +0000
Received: ("Tessian outbound 927f2cdd66cc:v33");
 Fri, 18 Oct 2019 11:18:42 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 093389d160be563a
X-CR-MTA-TID: 64aa7808
Received: from d30aed036abe.2 (ip-172-16-0-2.eu-west-1.compute.internal
 [104.47.5.53]) by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 FA7FCABF-0A6E-4E1E-97B2-4150FD7E1B85.1; 
 Fri, 18 Oct 2019 11:18:37 +0000
Received: from EUR02-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur02lp2053.outbound.protection.outlook.com [104.47.5.53])
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id d30aed036abe.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 18 Oct 2019 11:18:37 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ec7FMQs4HxwL8G8MMh5rlo6JawH8Hesv946JW9WDJ4feisHkLljNklLOU1Z6G7tSY9hwPjBLBKNQgW5Q0ER7a1JT+0YcQFzEveIyf3w9p986H4MhZN7lbGNcnNBmLOx3Slyv/keAocXiEbeiZLwog1ZUVQPdELlkRdChyugDLPcnAGkSJdgFCGFzlufMIIyM1gh32D9Y7WpAgUd3NfY4ylUYqqllbEyZj32vW5SG4hI9k/QiqMMEABQmIFfBeyrSkyJRhLGHmRARhL/uzuL4/kCnf+he2SwSmv1w0q4/9A7s9XG4AL4mrmImUL0mtk1ae2PlC5ncckUwaJDdkYfNBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=T0HwUS/171CrvA9PxKZFmJDHipTup7/01LdEeCEKdSs=;
 b=K0z94AMA6UeRuO+lBIMvl3EXytOWnkcmcZieyZN3Empbo23Mxah/wkf8mjGT8kKfeotTw9bU6+pu2V4SVznzWEe+KCoNLOYov9OtBo0sojwvrUpeemJXfIgcp9KZpjTsXlq9HhrvO7zvRg4p1S+0UjyPztb6L/KCns+1YxtpTCymZpfM87Hf7DvoJB1DLEm9z6PPgiiYuzQpb40PA3vDn/0mP5nS1dc2gd+5J2j8y9m0yrwwgpQuiWH8IpPON54uPu25dew4S7RQPJKrgpQkdDYiGqo5CLO4RlMprgYXmYXzO1B3KqZ2mWAZPcEgr2oxcv30UlhTb4xvLVp/WlHPwg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
Received: from AM6PR08MB3829.eurprd08.prod.outlook.com (20.178.89.14) by
 AM6PR08MB4231.eurprd08.prod.outlook.com (20.179.18.151) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2347.21; Fri, 18 Oct 2019 11:18:34 +0000
Received: from AM6PR08MB3829.eurprd08.prod.outlook.com
 ([fe80::ce0:f47b:919d:561a]) by AM6PR08MB3829.eurprd08.prod.outlook.com
 ([fe80::ce0:f47b:919d:561a%5]) with mapi id 15.20.2347.023; Fri, 18 Oct 2019
 11:18:34 +0000
From: Brian Starkey <Brian.Starkey@arm.com>
To: John Stultz <john.stultz@linaro.org>
Subject: Re: [PATCH v12 1/5] dma-buf: Add dma-buf heaps framework
Thread-Topic: [PATCH v12 1/5] dma-buf: Add dma-buf heaps framework
Thread-Index: AQHVhXQuL0D7Z4fi0UChemDv0BA9l6dgQKQA
Date: Fri, 18 Oct 2019 11:18:33 +0000
Message-ID: <20191018111832.o7wx3x54jm3ic6cq@DESKTOP-E1NTVVP.localdomain>
References: <20191018052323.21659-1-john.stultz@linaro.org>
 <20191018052323.21659-2-john.stultz@linaro.org>
In-Reply-To: <20191018052323.21659-2-john.stultz@linaro.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: NeoMutt/20180716-849-147d51-dirty
x-originating-ip: [217.140.106.52]
x-clientproxiedby: LO2P265CA0084.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:8::24) To AM6PR08MB3829.eurprd08.prod.outlook.com
 (2603:10a6:20b:85::14)
Authentication-Results-Original: spf=none (sender IP is )
 smtp.mailfrom=Brian.Starkey@arm.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: 7b040040-74be-42c7-c50e-08d753bcf3a8
X-MS-Office365-Filtering-HT: Tenant
X-MS-TrafficTypeDiagnostic: AM6PR08MB4231:|AM6PR08MB4231:|VI1PR0801MB1935:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS: <VI1PR0801MB1935E67E512A0F2DAB2013CFF06C0@VI1PR0801MB1935.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
x-ms-oob-tlc-oobclassifiers: OLM:3631;OLM:3631;
x-forefront-prvs: 01949FE337
X-Forefront-Antispam-Report-Untrusted: SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(366004)(39860400002)(396003)(376002)(346002)(189003)(199004)(71190400001)(476003)(6512007)(71200400001)(6246003)(81156014)(8676002)(102836004)(9686003)(86362001)(81166006)(1076003)(14454004)(11346002)(229853002)(446003)(186003)(99286004)(6116002)(3846002)(2906002)(4326008)(66556008)(64756008)(66446008)(8936002)(305945005)(66476007)(7736002)(66946007)(6916009)(316002)(26005)(6436002)(58126008)(25786009)(76176011)(256004)(7416002)(486006)(44832011)(52116002)(66066001)(478600001)(6506007)(6486002)(54906003)(5660300002)(386003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:AM6PR08MB4231;
 H:AM6PR08MB3829.eurprd08.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: YsmxL4WUAfrS3xWv26Vd2pz0ahldXNeUNYAck9Z5XXsuaPyWmFcIn6jp/35WB7LF1gq3nSf+HCTmjpFkIhV7fCE6ckdxWYyW/yFxjgICw4UI52CveT22xcG1Tch3eeRXuw6OzkI3YJbZGNI2IezJA+2r6ZShlHJ71uvR3MBpMYmZvvdFU0hkyL+DqT5SbtohxkoV+dMYC0J/HBsbRF+WHCtLiijl8WEk9FAf1f1TqFWI+tf7xiOIOFKyGo5hCrw7Ra5c/jFIP/eNI8l8zmy4DjsRsEZcxh/GuzaNvIlTVbZO3X5x7zpTDTpBP9SE8T4SGVaZEWqUjRdXohKAWXDcRdA1TERPUmTG1qKTXjh9N8IZ8ffi8g8rR+Gd8Q2gF+o5RpJZSYMEtJIzgMgxgKLAdZoskIatKMWedk1gUvnaxpw=
Content-ID: <E50E73799F579541AA924FB0B9D97D68@eurprd08.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4231
Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Brian.Starkey@arm.com; 
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AM5EUR03FT046.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: CIP:63.35.35.123; IPV:CAL; SCL:-1; CTRY:IE;
 EFV:NLI; SFV:NSPM;
 SFS:(10009020)(4636009)(346002)(376002)(39860400002)(396003)(136003)(199004)(189003)(22756006)(5660300002)(316002)(6246003)(486006)(25786009)(9686003)(76176011)(6512007)(126002)(66066001)(58126008)(99286004)(76130400001)(36906005)(70206006)(81166006)(476003)(47776003)(70586007)(8676002)(14454004)(81156014)(305945005)(3846002)(2906002)(7736002)(6116002)(86362001)(229853002)(8936002)(386003)(46406003)(8746002)(6862004)(11346002)(23726003)(97756001)(4326008)(26005)(186003)(336012)(6506007)(6486002)(50466002)(1076003)(54906003)(26826003)(63350400001)(102836004)(478600001)(356004)(446003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VI1PR0801MB1935;
 H:64aa7808-outbound-1.mta.getcheckrecipient.com; FPR:; SPF:TempError; LANG:en;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; A:1; MX:1; 
X-MS-Office365-Filtering-Correlation-Id-Prvs: 94550478-fdf6-441e-d4cc-08d753bce9d1
NoDisclaimer: True
X-Forefront-PRVS: 01949FE337
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: jOP04Bza0LD51de+KoMW1SIUtGhiMkzWd9zN7cX1LHHtH7KOrZDlCZ0H4TRE38TwfdtC5qBwI/pGkqcdC1w+c4to4PtQ7PKRfRTzlVro5NuwE2WTxdBa3+Atwa3ahcvY0pPzz5L++lBSsNyK5MOrOeltgMGkqeXBciFnVksEsY2LIGfWikd3wPmK6T4brpixjdL9YFCVxkHSMb4Esq36gqSnOhRlMVmJHWc5hRhPBBxdXkzf63hw8jEiF2ZVZv6KkfTkqJl87YlhG1KWjd9iiZFIFkFWCIEOkxkInBRv1mP2TGOMMp44omWqqET36hW7AmI7M8zlu7xHZvL2DyncK//9OjrpqfWPpEnptqzbNtApdkwItKQ3EyDMtWLOpqqL0mNhNAf4p/VmW/VDZPcG0dkbF6vwT6iSPDsLh+achbQ=
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Oct 2019 11:18:50.2515 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7b040040-74be-42c7-c50e-08d753bcf3a8
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0801MB1935
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=T0HwUS/171CrvA9PxKZFmJDHipTup7/01LdEeCEKdSs=;
 b=mncWvdLfwLCUejqfTCgrQMPFpnfHzFjnln+tIMRlELJZvBoqxh3iWrFSqEzimVnJJIbRZF4KZ2wNNSVnSTChDJsq367XrCiFc+8KBcN7blGwnG7ye0WIHXT1Y2Q9pU3NVabzoTCgh/dI2Yd4Tg0BQQHmnA9zZEkRY8kSb6hPFX4=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=T0HwUS/171CrvA9PxKZFmJDHipTup7/01LdEeCEKdSs=;
 b=mncWvdLfwLCUejqfTCgrQMPFpnfHzFjnln+tIMRlELJZvBoqxh3iWrFSqEzimVnJJIbRZF4KZ2wNNSVnSTChDJsq367XrCiFc+8KBcN7blGwnG7ye0WIHXT1Y2Q9pU3NVabzoTCgh/dI2Yd4Tg0BQQHmnA9zZEkRY8kSb6hPFX4=
X-Mailman-Original-Authentication-Results: spf=temperror (sender IP is
 63.35.35.123)
 smtp.mailfrom=arm.com; lists.freedesktop.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.freedesktop.org; dmarc=none
 action=none header.from=arm.com;
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.23
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
Cc: Hillf Danton <hdanton@sina.com>, Sudipto Paul <Sudipto.Paul@arm.com>,
 Vincent Donnefort <Vincent.Donnefort@arm.com>, Chenbo Feng <fengc@google.com>,
 lkml <linux-kernel@vger.kernel.org>, Liam Mark <lmark@codeaurora.org>,
 "Andrew F. Davis" <afd@ti.com>, Christoph Hellwig <hch@infradead.org>,
 nd <nd@arm.com>, Alistair Strachan <astrachan@google.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Hridya Valsaraju <hridya@google.com>, Pratik Patel <pratikp@codeaurora.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgSm9obiwKCk9uIEZyaSwgT2N0IDE4LCAyMDE5IGF0IDA1OjIzOjE5QU0gKzAwMDAsIEpvaG4g
U3R1bHR6IHdyb3RlOgo+IEZyb206ICJBbmRyZXcgRi4gRGF2aXMiIDxhZmRAdGkuY29tPgo+IAo+
IFRoaXMgZnJhbWV3b3JrIGFsbG93cyBhIHVuaWZpZWQgdXNlcnNwYWNlIGludGVyZmFjZSBmb3Ig
ZG1hLWJ1Zgo+IGV4cG9ydGVycywgYWxsb3dpbmcgdXNlcmxhbmQgdG8gYWxsb2NhdGUgc3BlY2lm
aWMgdHlwZXMgb2YgbWVtb3J5Cj4gZm9yIHVzZSBpbiBkbWEtYnVmIHNoYXJpbmcuCj4gCj4gRWFj
aCBoZWFwIGlzIGdpdmVuIGl0cyBvd24gZGV2aWNlIG5vZGUsIHdoaWNoIGEgdXNlciBjYW4gYWxs
b2NhdGUKPiBhIGRtYS1idWYgZmQgZnJvbSB1c2luZyB0aGUgRE1BX0hFQVBfSU9DX0FMTE9DLgo+
IAo+IFRoaXMgY29kZSBpcyBhbiBldm9sdWl0b24gb2YgdGhlIEFuZHJvaWQgSU9OIGltcGxlbWVu
dGF0aW9uLAo+IGFuZCBhIGJpZyB0aGFua3MgaXMgZHVlIHRvIGl0cyBhdXRob3JzL21haW50YWlu
ZXJzIG92ZXIgdGltZQo+IGZvciB0aGVpciBlZmZvcnQ6Cj4gICBSZWJlY2NhIFNjaHVsdHogWmF2
aW4sIENvbGluIENyb3NzLCBCZW5qYW1pbiBHYWlnbmFyZCwKPiAgIExhdXJhIEFiYm90dCwgYW5k
IG1hbnkgb3RoZXIgY29udHJpYnV0b3JzIQo+IAo+IENjOiBMYXVyYSBBYmJvdHQgPGxhYmJvdHRA
cmVkaGF0LmNvbT4KPiBDYzogQmVuamFtaW4gR2FpZ25hcmQgPGJlbmphbWluLmdhaWduYXJkQGxp
bmFyby5vcmc+Cj4gQ2M6IFN1bWl0IFNlbXdhbCA8c3VtaXQuc2Vtd2FsQGxpbmFyby5vcmc+Cj4g
Q2M6IExpYW0gTWFyayA8bG1hcmtAY29kZWF1cm9yYS5vcmc+Cj4gQ2M6IFByYXRpayBQYXRlbCA8
cHJhdGlrcEBjb2RlYXVyb3JhLm9yZz4KPiBDYzogQnJpYW4gU3RhcmtleSA8QnJpYW4uU3Rhcmtl
eUBhcm0uY29tPgo+IENjOiBWaW5jZW50IERvbm5lZm9ydCA8VmluY2VudC5Eb25uZWZvcnRAYXJt
LmNvbT4KPiBDYzogU3VkaXB0byBQYXVsIDxTdWRpcHRvLlBhdWxAYXJtLmNvbT4KPiBDYzogQW5k
cmV3IEYuIERhdmlzIDxhZmRAdGkuY29tPgo+IENjOiBDaHJpc3RvcGggSGVsbHdpZyA8aGNoQGlu
ZnJhZGVhZC5vcmc+Cj4gQ2M6IENoZW5ibyBGZW5nIDxmZW5nY0Bnb29nbGUuY29tPgo+IENjOiBB
bGlzdGFpciBTdHJhY2hhbiA8YXN0cmFjaGFuQGdvb2dsZS5jb20+Cj4gQ2M6IEhyaWR5YSBWYWxz
YXJhanUgPGhyaWR5YUBnb29nbGUuY29tPgo+IENjOiBIaWxsZiBEYW50b24gPGhkYW50b25Ac2lu
YS5jb20+Cj4gQ2M6IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKPiBSZXZpZXdlZC1i
eTogQmVuamFtaW4gR2FpZ25hcmQgPGJlbmphbWluLmdhaWduYXJkQGxpbmFyby5vcmc+Cj4gUmV2
aWV3ZWQtYnk6IEJyaWFuIFN0YXJrZXkgPGJyaWFuLnN0YXJrZXlAYXJtLmNvbT4KPiBBY2tlZC1i
eTogTGF1cmEgQWJib3R0IDxsYWJib3R0QHJlZGhhdC5jb20+Cj4gVGVzdGVkLWJ5OiBBeWFuIEt1
bWFyIEhhbGRlciA8YXlhbi5oYWxkZXJAYXJtLmNvbT4KPiBTaWduZWQtb2ZmLWJ5OiBBbmRyZXcg
Ri4gRGF2aXMgPGFmZEB0aS5jb20+Cj4gU2lnbmVkLW9mZi1ieTogSm9obiBTdHVsdHogPGpvaG4u
c3R1bHR6QGxpbmFyby5vcmc+Cj4gLS0tCj4gdjI6Cj4gKiBGb2xkZWQgZG93biBmaXhlcyBJIGhh
ZCBwcmV2aW91c2x5IHNoYXJlZCBpbiBpbXBsZW1lbnRpbmcKPiAgIGhlYXBzCj4gKiBNYWtlIGZs
YWdzIGEgdTY0IChTdWdnZXN0ZWQgYnkgTGF1cmEpCj4gKiBBZGQgUEFHRV9BTElHTigpIGZpeCB0
byB0aGUgY29yZSBhbGxvYyBmdW5jaXRvbgo+ICogSU9DVEwgZml4dXBzIHN1Z2dlc3RlZCBieSBC
cmlhbgo+ICogQWRkZWQgZml4ZXMgc3VnZ2VzdGVkIGJ5IEJlbmphbWluCj4gKiBSZW1vdmVkIGNv
cmUgc3RhdHMgbWdtdCwgYXMgdGhhdCBzaG91bGQgYmUgaW1wbGVtZW50ZWQgYnkKPiAgIHBlci1o
ZWFwIGNvZGUKPiAqIENoYW5nZWQgYWxsb2MgdG8gcmV0dXJuIGEgZG1hLWJ1ZiBmZCwgcmF0aGVy
IHRoYW4gYSBidWZmZXIKPiAgIChhcyBpdCBzaW1wbGlmaWVzIGVycm9yIGhhbmRsaW5nKQo+IHYz
Ogo+ICogUmVtb3ZlZCBzY2FyZS1xdW90ZXMgaW4gTUFJTlRBSU5FUlMgZW1haWwgYWRkcmVzcwo+
ICogR2V0IHJpZCBvZiAucmVsZWFzZSBmdW5jdGlvbiBhcyBpdCBkaWRuJ3QgZG8gYW55dGhpbmcg
KGZyb20KPiAgIENocmlzdG9waCkKPiAqIFJlbmFtZWQgZmlscCB0byBmaWxlIChzdWdnZXN0ZWQg
YnkgQ2hyaXN0b3BoKQo+ICogU3BsaXQgb3V0IGlvY3RsIGhhbmRsaW5nIHRvIHNlcGFyYXRlIGZ1
bmN0aW9uIChzdWdnZXN0ZWQgYnkKPiAgIENocmlzdG9waCkKPiAqIEFkZCBjb21tZW50IGRvY3Vt
ZW50aW5nIFBBR0VfQUxJR04gdXNhZ2UgKHN1Z2dlc3RlZCBieSBCcmlhbikKPiAqIFN3aXRjaCBm
cm9tIGlkciB0byBYYXJyYXkgKHN1Z2dlc3RlZCBieSBCcmlhbikKPiAqIEZpeHVwIGNkZXYgY3Jl
YXRpb24gKHN1Z2dlc3RlZCBieSBCcmlhbikKPiAqIEF2b2lkIEVYUE9SVF9TWU1CT0wgdW50aWwg
d2UgZmluYWxpemUgbW9kdWxlcyAoc3VnZ2VzdGVkIGJ5Cj4gICBCcmlhbikKPiAqIE1ha2Ugc3Ry
dWN0IGRtYV9oZWFwIGludGVybmFsIG9ubHkgKGZvbGRlZCBpbiBmcm9tIEFuZHJldykKPiAqIFNt
YWxsIGNsZWFudXBzIHN1Z2dlc3RlZCBieSBHcmVnS0gKPiAqIFByb3ZpZGUgY2xhc3MtPmRldm5v
ZGUgY2FsbGJhY2sgdG8gZ2V0IGNvbnNpc3RlbnQgL2Rldi8KPiAgIHN1YmRpcmVjdG9yeSBuYW1p
bmcgKFN1Z2dlc3RlZCBieSBCam9ybikKPiB2NDoKPiAqIEZvbGRlZCBkb3duIGRtYS1oZWFwLmgg
Y2hhbmdlIHRoYXQgd2FzIGluIGEgZm9sbG93aW5nIHBhdGNoCj4gKiBBZGRlZCBmZF9mbGFncyBl
bnRyeSB0byBhbGxvY2F0aW9uIHN0cnVjdHVyZSBhbmQgcGFzcyBpdAo+ICAgdGhyb3VnaCB0byBo
ZWFwIGNvZGUgZm9yIHVzZSBvbiBkbWEtYnVmIGZkIGNyZWF0aW9uIChzdWdnZXN0ZWQKPiAgIGJ5
IEJlbmphbWluKQo+IHY1Ogo+ICogTWlub3IgY2xlYW51cHMKPiB2NjoKPiAqIEltcHJvdmVkIGVy
cm9yIHBhdGggaGFuZGxpbmcsIG1pbm9yIHdoaXRlc3BhY2UgZml4ZXMsIGJvdGgKPiAgIHN1Z2dl
c3RlZCBieSBCcmlhbgo+IHY3Ogo+ICogTG9uZ2VyIEtjb25maWcgZGVzY3JpcHRpb24gdG8gcXVp
ZXQgY2hlY2twYXRjaCB3YXJuaW5ncwo+ICogUmUtYWRkIGNvbXBhdF9pb2N0bCBiaXRzIChIcmlk
eWEgbm90aWNlZCAzMmJpdCB1c2VybGFuZCB3YXNuJ3QKPiAgIHdvcmtpbmcpCj4gdjg6Cj4gKiBN
YWtlIHN0cnVjdCBkbWFfaGVhcF9vcHMgY29uc3RzIChTdWdnZXN0ZWQgYnkgQ2hyaXN0b3BoKQo+
ICogQ2hlY2twYXRjaCB3aGl0ZXNwYWNlIGZpeHVwcwo+IHY5Ogo+ICogTWlub3IgY2xlYW51cHMg
c3VnZ2VzdGVkIGJ5IEJyaWFuIFN0YXJrZXkKPiAqIFJlbmFtZSBkbWFfaGVhcF9nZXRfZGF0YS0+
ZG1hX2hlYXBfZ2V0X2RydmRhdGEgc3VnZ2VzdGVkCj4gICBieSBIaWxmIERhbnRvbgo+IHYxMToK
PiAqIEtjb25maWcgdGV4dCBpbXByb3ZlbWVudHMgc3VnZ2VzdGVkIGJ5IFJhbmR5IER1bmxhcAo+
IHYxMjoKPiAqIEFkZCBsb2dpYyB0byBwcmV2ZW50IGR1cGxpY2F0ZWx5IG5hbWVkIGhlYXBzIGJl
aW5nIGFkZGVkCj4gKiBBZGQgc3ltYm9sIGV4cG9ydHMgZm9yIGhlYXBzIGFzIG1vZHVsZXMKCkFz
IGluIHYzOgoKICogQXZvaWQgRVhQT1JUX1NZTUJPTCB1bnRpbCB3ZSBmaW5hbGl6ZSBtb2R1bGVz
IChzdWdnZXN0ZWQgYnkKICAgQnJpYW4pCgpEaWQgc29tZXRoaW5nIGNoYW5nZSBpbiB0aGF0IHJl
Z2FyZD8gSSBzdGlsbCB0aGluayBsZXR0aW5nIG1vZHVsZXMKcmVnaXN0ZXIgaGVhcHMgd2l0aG91
dCBhIHdheSB0byByZW1vdmUgdGhlbSBpcyBhIHJlY2lwZSBmb3IgaXNzdWVzLgoKVGhhbmtzLAot
QnJpYW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRy
aS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRw
czovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
