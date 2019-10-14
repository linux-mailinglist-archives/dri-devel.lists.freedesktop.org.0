Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E29FD6FFE
	for <lists+dri-devel@lfdr.de>; Tue, 15 Oct 2019 09:13:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 12DD36E621;
	Tue, 15 Oct 2019 07:13:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM03-DM3-obe.outbound.protection.outlook.com
 (mail-eopbgr800125.outbound.protection.outlook.com [40.107.80.125])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E49D6E59D;
 Mon, 14 Oct 2019 20:48:54 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MybpUUiGZnWjEdAgd7fYbEXahV/V1rVAgT/guxeLGYP2cD8pwvfnOVy34dBtjwkEaN1OKM7SvRfnKC9R6VJXgzOpN5q5skKL3XeaR9rd6vIJAPvBr9yCMBYeHjxmvahQqspmW3u7gZxhB8DQy7Lx89MqH23qWskMnl2NicRqFcabDx9I0mQGMTPcRX1Ze7acZRmFRChLcUBwfJKER/LeXVqJunXJdRKlX4VrLargZgaRwv7JrTOtuUIxWGpG++1YTMzRdKbIQzu0kxUlGUiR1icHXMIqStK6jsEsIpbNTXWtcoDFmZ6fZWKF3NpbV4Z+LqPR1B8gdg8iBRpn0QpVxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OArEe6nXYnBjam6+kgN/IG+mDckpqt8jB9TcKWjhL+8=;
 b=M/yQ3n/Nxj9iSyV8vv+9D9f9AgwrskSXaqUnK0Z9OpzsTjdC6YLmonKBlyzdPuH8CqPYQBQW9MESoa5t8TfX7KZphcvCjcEbrvnogiGhkQUe4SPLfZWNiL8cc8ddE5GVctRY+b2513j8fNtGNH3vmYebu6HOgMfFfHfGlyputdj5kY5v7oBitnNjo5fcOAkrSGSOa4DP7XP+nqhSaxEZ9H5eOALP4U+XtHNDimCIX9L1KjOetT+jyJCPqCLyGRIyA0tRszYZccZzsf3Sp+FfGYxirrEOwDNEHqpw3FFge0nv6NAhw6ZuX/yFbPH1vbemSgE4Vwk6R092HYukW8o0Gw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 160.33.194.228) smtp.rcpttodomain=linux.intel.com smtp.mailfrom=sony.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=sony.com;
 dkim=none (message not signed); arc=none
Received: from MWHPR13CA0003.namprd13.prod.outlook.com (2603:10b6:300:16::13)
 by BN6PR13MB1507.namprd13.prod.outlook.com (2603:10b6:404:10f::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2347.15; Mon, 14 Oct
 2019 20:48:51 +0000
Received: from CY1NAM02FT017.eop-nam02.prod.protection.outlook.com
 (2a01:111:f400:7e45::208) by MWHPR13CA0003.outlook.office365.com
 (2603:10b6:300:16::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2367.6 via Frontend
 Transport; Mon, 14 Oct 2019 20:48:51 +0000
Received-SPF: Pass (protection.outlook.com: domain of sony.com designates
 160.33.194.228 as permitted sender) receiver=protection.outlook.com;
 client-ip=160.33.194.228; helo=usculsndmail01v.am.sony.com;
Received: from usculsndmail01v.am.sony.com (160.33.194.228) by
 CY1NAM02FT017.mail.protection.outlook.com (10.152.75.181) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2347.16 via Frontend Transport; Mon, 14 Oct 2019 20:48:51 +0000
Received: from usculsndmail12v.am.sony.com (usculsndmail12v.am.sony.com
 [146.215.230.103])
 by usculsndmail01v.am.sony.com (Sentrion-MTA-4.3.2/Sentrion-MTA-4.3.2) with
 ESMTP id x9EKmn8J020884; Mon, 14 Oct 2019 20:48:50 GMT
Received: from USCULXHUB04V.am.sony.com (hubs.sonyusa.com [146.215.231.18])
 by usculsndmail12v.am.sony.com (Sentrion-MTA-4.3.2/Sentrion-MTA-4.3.2) with
 ESMTP id x9EKmnIf008425; Mon, 14 Oct 2019 20:48:49 GMT
Received: from USCULXMSG01.am.sony.com ([fe80::b09d:6cb6:665e:d1b5]) by
 USCULXHUB04V.am.sony.com ([146.215.231.18]) with mapi id 14.03.0439.000; Mon,
 14 Oct 2019 16:48:48 -0400
From: <Tim.Bird@sony.com>
To: <jani.nikula@linux.intel.com>, <changbin.du@gmail.com>, <corbet@lwn.net>
Subject: RE: [PATCH] kernel-doc: rename the kernel-doc directive 'functions'
 to 'specific'
Thread-Topic: [PATCH] kernel-doc: rename the kernel-doc directive
 'functions' to 'specific'
Thread-Index: AQHVgYrHjoG0ILu0Lk6IAGRKrE96jadaG2GAgACB3oA=
Date: Mon, 14 Oct 2019 20:48:48 +0000
Message-ID: <ECADFF3FD767C149AD96A924E7EA6EAF977CAF09@USCULXMSG01.am.sony.com>
References: <20191013055359.23312-1-changbin.du@gmail.com>
 <875zkrd7nq.fsf@intel.com>
In-Reply-To: <875zkrd7nq.fsf@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [146.215.228.6]
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:160.33.194.228; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10019020)(376002)(396003)(136003)(39860400002)(346002)(199004)(189003)(13464003)(8676002)(37786003)(23726003)(102836004)(6246003)(97756001)(7696005)(76176011)(5660300002)(3846002)(55016002)(6116002)(86362001)(55846006)(486006)(2876002)(33656002)(476003)(126002)(46406003)(246002)(2906002)(336012)(54906003)(356004)(11346002)(186003)(26005)(14444005)(478600001)(426003)(50466002)(4326008)(47776003)(66066001)(446003)(70206006)(110136005)(7416002)(8746002)(70586007)(8936002)(106002)(305945005)(229853002)(316002)(2201001)(7736002)(2101003)(5001870100001);
 DIR:OUT; SFP:1102; SCL:1; SRVR:BN6PR13MB1507; H:usculsndmail01v.am.sony.com;
 FPR:; SPF:Pass; LANG:en; PTR:mail.sonyusa.com,mail01.sonyusa.com; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3e15f9ef-1f4b-49bd-255a-08d750e7eb79
X-MS-TrafficTypeDiagnostic: BN6PR13MB1507:
X-Microsoft-Antispam-PRVS: <BN6PR13MB1507003AF9F82B961C9751ABFD900@BN6PR13MB1507.namprd13.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-Forefront-PRVS: 01901B3451
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ODSsHBKcgRD7wEsIwdsafZ04SyHtvm6qy2uPMrfx8nrVkiaJV82xR/OwG5okb99i7iEG7CUt+pn2KbJBPyp187ND0/kHxYb/7tP22z69BUTj6Wlx1EQoDSV+ElAIjXpN8C9DoU+jBgY6W7C27KRfwheVky55hswuncioRmZtMFK1kJEUyeM7Ng2QRXmSWjvzg5eD+pBeRIFTbw41R2yDlXxOkRNAOFdLDaUSiTsIqTqloaCmX36kXCqIpoFg0YZbKxmOMYBMBSA57f5ntoG9D4U+oJ5tHYpM7vs19N0ZrD/WMS6Dq2UYzCeQFl/EdGjVR1G99/WzNKsZfKa0Eg7uBmjCbjLFkVBs7/de3Fw5Ts373lbBgIV94u9kGMfIy4vxMe2QQWX45Oe9neLBGoV3iJYAf/TXPsVgSHA6TIoC3fA=
X-OriginatorOrg: sony.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2019 20:48:51.3386 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3e15f9ef-1f4b-49bd-255a-08d750e7eb79
X-MS-Exchange-CrossTenant-Id: 66c65d8a-9158-4521-a2d8-664963db48e4
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=66c65d8a-9158-4521-a2d8-664963db48e4; Ip=[160.33.194.228];
 Helo=[usculsndmail01v.am.sony.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR13MB1507
X-Mailman-Approved-At: Tue, 15 Oct 2019 07:12:31 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=Sony.onmicrosoft.com; 
 s=selector2-Sony-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OArEe6nXYnBjam6+kgN/IG+mDckpqt8jB9TcKWjhL+8=;
 b=GW8ap/OtxWR7IboWJaCeN4ARVfmxmyY4CC3bxYgfZsVEI+/lz29dimTIgVXYOi+8wBLwn5egEbRa69BC5KS5XjTtJSaofKp/iRMl8n9HrssY0KACQ/AKYeMVlXBdiZCsBpZbM7+KPKFXBlKAXn3YYUbI9GDUDq0a48gogH+gj5c=
X-Mailman-Original-Authentication-Results: spf=pass (sender IP is
 160.33.194.228)
 smtp.mailfrom=sony.com; linux.intel.com; dkim=none (message not signed)
 header.d=none;linux.intel.com; dmarc=pass action=none header.from=sony.com;
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
Cc: linux-doc@vger.kernel.org, linux-pci@vger.kernel.org,
 linux-fpga@vger.kernel.org, linux-usb@vger.kernel.org,
 linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-mm@kvack.org,
 linux-crypto@vger.kernel.org, linux-kselftest@vger.kernel.org,
 intel-gfx@lists.freedesktop.org, changbin.du@gmail.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Cgo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tCj4gRnJvbTogSmFuaSBOaWt1bGEgb24gT2N0
b2JlciAxMywgMjAxOSAxMTowMCBQTQo+IE9uIFN1biwgMTMgT2N0IDIwMTksIENoYW5nYmluIER1
IDxjaGFuZ2Jpbi5kdUBnbWFpbC5jb20+IHdyb3RlOgo+ID4gVGhlICdmdW5jdGlvbnMnIGRpcmVj
dGl2ZSBpcyBub3Qgb25seSBmb3IgZnVuY3Rpb25zLCBidXQgYWxzbyB3b3JrcyBmb3IKPiA+IHN0
cnVjdHMvdW5pb25zLiBTbyB0aGUgbmFtZSBpcyBtaXNsZWFkaW5nLiBUaGlzIHBhdGNoIHJlbmFt
ZXMgaXQgdG8KPiA+ICdzcGVjaWZpYycsIHNvIG5vdyB3ZSBoYXZlIGV4cG9ydC9pbnRlcm5hbC9z
cGVjaWZpYyBkaXJlY3RpdmVzIHRvIGxpbWl0Cj4gPiB0aGUgZnVuY3Rpb25zL3R5cGVzIHRvIGJl
IGluY2x1ZGVkIGluIGRvY3VtZW50YXRpb24uIE1lYW53aGlsZSB3ZQo+IGltcHJvdmVkCj4gPiB0
aGUgd2FybmluZyBtZXNzYWdlLgo+IAo+IEFncmVlZCBvbiAiZnVuY3Rpb25zIiBiZWluZyBsZXNz
IHRoYW4gcGVyZmVjdC4gSXQgZGlyZWN0bHkgZXhwb3NlcyB0aGUKPiBpZGlvc3luY3Jhc2llcyBv
ZiBzY3JpcHRzL2tlcm5lbC1kb2MuIEknbSBub3Qgc3VyZSAic3BlY2lmaWMiIGlzIGFueQo+IGJl
dHRlciwgdGhvdWdoLgoKSSBzdHJvbmdseSBhZ3JlZSB3aXRoIHRoaXMuICAnc3BlY2lmaWMnIElN
SE8sIGhhcyBubyBzZW1hbnRpYyB2YWx1ZSBhbmQKSSdkIHJhdGhlciBqdXN0IGxlYXZlIHRoZSBv
bmx5LXNvbWV0aW1lcy13cm9uZyAnZnVuY3Rpb25zJyB0aGFuIGNvbnZlcnQKdG8gc29tZXRoaW5n
IHRoYXQgb2JzY3VyZXMgdGhlIG1lYW5pbmcgYWx3YXlzLgoKPiAKPiBQZXJoYXBzICJzeW1ib2xz
IiB3b3VsZCBiZSBtb3JlIHNlbGYtZXhwbGFuYXRvcnkuIE9yLCBhY3R1YWxseSBtYWtlCj4gImZ1
bmN0aW9ucyIgb25seSB3b3JrIG9uIGZ1bmN0aW9ucywgYW5kIGFkZCBhIHNlcGFyYXRlIGtleXdv
cmQgZm9yIG90aGVyCj4gc3R1ZmYuICpzaHJ1ZyoKTXkgcHJlZmVyZW5jZSB3b3VsZCBiZSB0byB1
c2UgJ3N5bWJvbHMnLiAgSSB0cmllZCB0byBjb21lIHVwIHdpdGggc29tZXRoaW5nCmJ1dCAnc3lt
Ym9scycgaXMgYmV0dGVyIHRoYW4gYW55dGhpbmcgSSBjYW1lIHVwIHdpdGguCgo+IAo+IFNlZW1z
IGxpa2UgdGhlIHBhdGNoIGlzIHdheSB0b28gYmlnLiBJJ2QgcHJvYmFibHkgYWRkICJzeW1ib2xz
IiAob3IKPiB3aGF0ZXZlcikgYXMgYSBzeW5vbnltIGZvciAiZnVuY3Rpb25zIiBmb3Igc3RhcnRl
cnMsIGFuZCBjb252ZXJ0Cj4gZG9jdW1lbnRzIHBpZWNlbWVhbCwgYW5kIGZpbmFsbHkgZHJvcCB0
aGUgb2xkIG9uZS4KPiAKPiBUaGUgc2NyaXB0cy9rZXJuZWwtZG9jIGNoYW5nZSBzaG91bGQgYmUg
YSBwYXRjaCBvZiBpdHMgb3duLgpBZ3JlZWQgb24gdGhlc2UgdHdvIHBvaW50cyBhcyB3ZWxsLgoK
SnVzdCBhZGRpbmcgbXkgMiBjZW50cy4KIC0tIFRpbQpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBs
aXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1h
bi9saXN0aW5mby9kcmktZGV2ZWw=
