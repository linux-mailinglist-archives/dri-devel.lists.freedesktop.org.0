Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CBB032663E5
	for <lists+dri-devel@lfdr.de>; Fri, 11 Sep 2020 18:27:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 929C16EAAA;
	Fri, 11 Sep 2020 16:27:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2073.outbound.protection.outlook.com [40.107.223.73])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 163776EAAA
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Sep 2020 16:27:12 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XrmBVfRU7ICRR15m7BipluRyQoEJ8tlN8sSyq/UEBrWJGkXwD7gEaSomoXBpA2Xjk1k0Cp0xgQlwTq0eyPTrI7wg3NGen4qem2aY040KI0nujlkELQVVNYWBwFkMn4MPmTVMt9NC/KyLTj+qkQ6rlNKR4QecD+yZuW3+5esPz+ipLDCZus8ndJhCIJZGZXvdjt1bqisUna7yH7Hk0DEef3X43ry9FnKRExBCHCqCObMZ+ZKReAkwdUzFjKfmMc4dKc/JGXj20MiKl/l5aUOiD/dqWKflsZPiIQNyQKq+hL8gK7M8+uKnciO9zZ3gTauxV75L825mc6VQEjoI1nKmeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+x3V/Nd53xRa2BqytRenQV19ktcCzWqzFhB9zwKa4hw=;
 b=N674SzA8pv9uWKfTQdeednRRXfwB6wxRQsKbG7LnMCrNounNVn1XIZS3vkx/YjTGr8qCckxGJW9byCpBiih1PVBqRtU2/YVDzCne1W7ksf6D+96Kpzg+Mf8dNyBcT7v8HFbiDPTBEzU/tuBsxMiR8CdPxSXRui8R24sxR9EtVqnSmlSJpHvLO4vhDXj5UNXO949Wwc0SS0qEU0+aqVkujzeW5CGr2mIO2YVesSsd/vBaMcCh9KsbH2RcBrTuXHxCMvUGD6xJ17m7GmY0i3c7pDZjSiiroaK/oE6IRhld7liuPxnpKE3DjUdQ6Vf7Hy/OJ7hqzrKrtTDJ58+CIpQrxw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.60.83) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=xilinx.com;
 dmarc=bestguesspass action=none header.from=xilinx.com; dkim=none (message
 not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+x3V/Nd53xRa2BqytRenQV19ktcCzWqzFhB9zwKa4hw=;
 b=OSFxQjXExon5oyZebtbUrs2zwLS4AO58vwaHnkiUksGHGulqyY3vHvhcIXl+gDIytAk8CVkh9nl/nIpjLU2igFNkM8SuS5qba8C/zIArg0Km4nOmLXBPJOIlIgnLfez1atKdzijbje4V+z/t2aRTyf6MnWj+T5rKSQA9J5027i0=
Received: from CY4PR08CA0039.namprd08.prod.outlook.com (2603:10b6:903:151::25)
 by MN2PR02MB6110.namprd02.prod.outlook.com (2603:10b6:208:1bf::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3370.16; Fri, 11 Sep
 2020 16:27:11 +0000
Received: from CY1NAM02FT040.eop-nam02.prod.protection.outlook.com
 (2603:10b6:903:151:cafe::1d) by CY4PR08CA0039.outlook.office365.com
 (2603:10b6:903:151::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3370.16 via Frontend
 Transport; Fri, 11 Sep 2020 16:27:10 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.60.83)
 smtp.mailfrom=xilinx.com; vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=bestguesspass action=none
 header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.60.83 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.60.83; helo=xsj-pvapsmtpgw01;
Received: from xsj-pvapsmtpgw01 (149.199.60.83) by
 CY1NAM02FT040.mail.protection.outlook.com (10.152.75.135) with Microsoft SMTP
 Server id 15.20.3370.16 via Frontend Transport; Fri, 11 Sep 2020 16:27:10
 +0000
Received: from [149.199.38.66] (port=51300 helo=smtp.xilinx.com)
 by xsj-pvapsmtpgw01 with esmtp (Exim 4.90)
 (envelope-from <hyun.kwon@xilinx.com>)
 id 1kGltF-0006Dv-Ou; Fri, 11 Sep 2020 09:27:09 -0700
Received: from [127.0.0.1] (helo=localhost)
 by smtp.xilinx.com with smtp (Exim 4.63)
 (envelope-from <hyun.kwon@xilinx.com>)
 id 1kGltG-0001nh-ID; Fri, 11 Sep 2020 09:27:10 -0700
Received: from xsj-pvapsmtp01 (xsj-pvapsmtp01.xilinx.com [149.199.38.66])
 by xsj-smtp-dlp2.xlnx.xilinx.com (8.13.8/8.13.1) with ESMTP id 08BGR8pT002592; 
 Fri, 11 Sep 2020 09:27:08 -0700
Received: from [172.19.75.82] (helo=xsjsycl40.xilinx.com)
 by xsj-pvapsmtp01 with esmtp (Exim 4.63)
 (envelope-from <hyun.kwon@xilinx.com>)
 id 1kGltE-0001mg-CE; Fri, 11 Sep 2020 09:27:08 -0700
Received: by xsjsycl40.xilinx.com (Postfix, from userid 13638)
 id 51345352C02; Fri, 11 Sep 2020 09:27:08 -0700 (PDT)
Date: Fri, 11 Sep 2020 09:27:08 -0700
From: Hyun Kwon <hyun.kwon@xilinx.com>
To: Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH] drm: xlnx: remove defined but not used
 'scaling_factors_666'
Message-ID: <20200911162708.GA3715173@xilinx.com>
References: <20200910140630.1191782-1-yanaijie@huawei.com>
 <20200910181418.GA3187626@xilinx.com>
 <20200911081519.GM438822@phenom.ffwll.local>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200911081519.GM438822@phenom.ffwll.local>
X-RCIS-Action: ALLOW
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.2.0.1013-23620.005
X-TM-AS-User-Approved-Sender: Yes;Yes
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 81d8a328-5ba8-450e-6ffc-08d8566f88ba
X-MS-TrafficTypeDiagnostic: MN2PR02MB6110:
X-Microsoft-Antispam-PRVS: <MN2PR02MB61103328AD69393F857C0AE5D6240@MN2PR02MB6110.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:1923;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: bWb2wHcGfg6z5Cw9SGfh2/D86tb/WjWOwdsGnlu1V+R1pJQS/syW392Q5FCoJLH/wrSng2xuWlUOOKGaT+IstnORmbjNyNlWVRt5ui3w2sBoYdUu66B6F4SMQpiu/614/BlI2CwDhgSz91l9KOG/Trn5paRaQy7t8vKC3Nh1p37udlKdInROVnj1DIVsemwZnWxRmBPi517zpQjmj2khNCY/n+w3je3+m/pe7Wn7tYb3VVGE5R3JSVenaa+yfsEGTjHp/5KDMYBbtOJW1rD6LuiHLW25diO2uLdY8IjNmJH2tTfO3qXSLgvVriB0IeVxd7fL8t2LQJ7i4rmMo9eeiX1121TCmeb8Z3/C2eGOCFN6+2cUV69J2Z/yX/e7j4B6oOyxilj20Y8kWIORvWXvCOXKEyfvPNFlJxw5rCGL9hIIn0s5s8V84OraeB1hIun76hfgB8I41lzn+h9WjsqyeqNbgmSGhnq3mtSYFbHTONY=
X-Forefront-Antispam-Report: CIP:149.199.60.83; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:xsj-pvapsmtpgw01; PTR:unknown-60-83.xilinx.com; CAT:NONE;
 SFS:(39860400002)(376002)(136003)(346002)(396003)(46966005)(70206006)(83380400001)(33656002)(82310400003)(336012)(70586007)(1076003)(316002)(5660300002)(42186006)(6916009)(81166007)(36756003)(83080400001)(478600001)(82740400003)(54906003)(426003)(47076004)(4326008)(966005)(8936002)(6266002)(356005)(2616005)(8676002)(186003)(2906002)(26005)(44832011);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Sep 2020 16:27:10.8113 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 81d8a328-5ba8-450e-6ffc-08d8566f88ba
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c; Ip=[149.199.60.83];
 Helo=[xsj-pvapsmtpgw01]
X-MS-Exchange-CrossTenant-AuthSource: CY1NAM02FT040.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR02MB6110
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
Cc: Jason Yan <yanaijie@huawei.com>, "airlied@linux.ie" <airlied@linux.ie>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Hulk Robot <hulkci@huawei.com>, Michal Simek <michals@xilinx.com>,
 "laurent.pinchart@ideasonboard.com" <laurent.pinchart@ideasonboard.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgRGFuaWVsLAoKT24gRnJpLCBTZXAgMTEsIDIwMjAgYXQgMDE6MTU6MTlBTSAtMDcwMCwgRGFu
aWVsIFZldHRlciB3cm90ZToKPiBPbiBUaHUsIFNlcCAxMCwgMjAyMCBhdCAxMToxNDoxOEFNIC0w
NzAwLCBIeXVuIEt3b24gd3JvdGU6Cj4gPiBIaSBKYXNvbiwKPiA+IAo+ID4gT24gVGh1LCBTZXAg
MTAsIDIwMjAgYXQgMDc6MDY6MzBBTSAtMDcwMCwgSmFzb24gWWFuIHdyb3RlOgo+ID4gPiBUaGlz
IGFkZHJlc3NlcyB0aGUgZm9sbG93aW5nIGdjYyB3YXJuaW5nIHdpdGggIm1ha2UgVz0xIjoKPiA+
ID4gCj4gPiA+IGRyaXZlcnMvZ3B1L2RybS94bG54L3p5bnFtcF9kaXNwLmM6MjQ1OjE4OiB3YXJu
aW5nOgo+ID4gPiDigJhzY2FsaW5nX2ZhY3RvcnNfNjY24oCZIGRlZmluZWQgYnV0IG5vdCB1c2Vk
IFstV3VudXNlZC1jb25zdC12YXJpYWJsZT1dCj4gPiA+ICAgMjQ1IHwgc3RhdGljIGNvbnN0IHUz
MiBzY2FsaW5nX2ZhY3RvcnNfNjY2W10gPSB7Cj4gPiA+ICAgICAgIHwgICAgICAgICAgICAgICAg
ICBefn5+fn5+fn5+fn5+fn5+fn5+Cj4gPiA+IAo+ID4gPiBSZXBvcnRlZC1ieTogSHVsayBSb2Jv
dCA8aHVsa2NpQGh1YXdlaS5jb20+Cj4gPiA+IFNpZ25lZC1vZmYtYnk6IEphc29uIFlhbiA8eWFu
YWlqaWVAaHVhd2VpLmNvbT4KPiA+IAo+ID4gUmV2aWV3ZWQtYnk6IEh5dW4gS3dvbiA8aHl1bi5r
d29uQHhpbGlueC5jb20+Cj4gCj4gSSB0aGluayB5b3UncmUgdGhlIG1haW50YWluZXIsIHNvIHBs
ZWFzZSBhbHNvIHB1c2ggcGF0Y2hlcyB0bwo+IGRybS1taXNjLW5leHQuIE90aGVyd2lzZSB0aGV5
J2xsIGp1c3QgZ2V0IGxvc3QsIG9yIGF0IGxlYXN0IGl0J3MgdmVyeQo+IGNvbmZ1c2luZyB3aGVu
IGEgbWFpbnRhaW5lciByZXZpZXdzIGEgcGF0Y2ggYnV0IHRoZXJlJ3Mgbm8gaW5kaWNhdGlvbiB3
aGF0Cj4gd2lsbCBoYXBwZW4gd2l0aCB0aGUgcGF0Y2guCgpSaWdodC4gSSB3YW50ZWQgdG8gZ2l2
ZSBpdCBzb21lIHRpbWUgYmVmb3JlIHB1c2hpbmcuIEknbGwgY2xlYXJseSBzdGF0ZSBnb2luZwpm
b3J3YXJkLgoKVGhhbmtzLAotaHl1bgoKPiAtRGFuaWVsCj4gCj4gPiAKPiA+IFRoYW5rcyEKPiA+
IAo+ID4gLWh5dW4KPiA+IAo+ID4gPiAtLS0KPiA+ID4gIGRyaXZlcnMvZ3B1L2RybS94bG54L3p5
bnFtcF9kaXNwLmMgfCA2IC0tLS0tLQo+ID4gPiAgMSBmaWxlIGNoYW5nZWQsIDYgZGVsZXRpb25z
KC0pCj4gPiA+IAo+ID4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3hsbngvenlucW1w
X2Rpc3AuYyBiL2RyaXZlcnMvZ3B1L2RybS94bG54L3p5bnFtcF9kaXNwLmMKPiA+ID4gaW5kZXgg
YTQ1NWNmYzFiZWU1Li45OGJkNDhmMTNmZDEgMTAwNjQ0Cj4gPiA+IC0tLSBhL2RyaXZlcnMvZ3B1
L2RybS94bG54L3p5bnFtcF9kaXNwLmMKPiA+ID4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3hsbngv
enlucW1wX2Rpc3AuYwo+ID4gPiBAQCAtMjQyLDEyICsyNDIsNiBAQCBzdGF0aWMgY29uc3QgdTMy
IHNjYWxpbmdfZmFjdG9yc181NjVbXSA9IHsKPiA+ID4gIAlaWU5RTVBfRElTUF9BVl9CVUZfNUJJ
VF9TRiwKPiA+ID4gIH07Cj4gPiA+ICAKPiA+ID4gLXN0YXRpYyBjb25zdCB1MzIgc2NhbGluZ19m
YWN0b3JzXzY2NltdID0gewo+ID4gPiAtCVpZTlFNUF9ESVNQX0FWX0JVRl82QklUX1NGLAo+ID4g
PiAtCVpZTlFNUF9ESVNQX0FWX0JVRl82QklUX1NGLAo+ID4gPiAtCVpZTlFNUF9ESVNQX0FWX0JV
Rl82QklUX1NGLAo+ID4gPiAtfTsKPiA+ID4gLQo+ID4gPiAgc3RhdGljIGNvbnN0IHUzMiBzY2Fs
aW5nX2ZhY3RvcnNfODg4W10gPSB7Cj4gPiA+ICAJWllOUU1QX0RJU1BfQVZfQlVGXzhCSVRfU0Ys
Cj4gPiA+ICAJWllOUU1QX0RJU1BfQVZfQlVGXzhCSVRfU0YsCj4gPiA+IC0tIAo+ID4gPiAyLjI1
LjQKPiA+ID4gCj4gCj4gLS0gCj4gRGFuaWVsIFZldHRlcgo+IFNvZnR3YXJlIEVuZ2luZWVyLCBJ
bnRlbCBDb3Jwb3JhdGlvbgo+IGh0dHA6Ly9ibG9nLmZmd2xsLmNoCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJp
LWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
