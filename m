Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 48DE7151C30
	for <lists+dri-devel@lfdr.de>; Tue,  4 Feb 2020 15:27:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 63E6A6F372;
	Tue,  4 Feb 2020 14:27:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2042.outbound.protection.outlook.com [40.107.237.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD6556F372
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Feb 2020 14:27:47 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QVGoKWx2N/ri+cWHGUo7XRT23rvZlZYzrVya7N/9SHQUAi7QPMlRPKOj9tPSsydpRGt5Aryu2FtLc5nMoDMMnfYs9051sTXByZ7T3yoyqEZ0v5yB6tW5AlxdeaDYDno5vRlJc1QB2xJhmooWkm7txUvhQTLwgh/zc3QvQPOUSTRJRyG+QdJkiO6UE8byKLLJ1me0xCDo+EEC10FycrFJf4RYTDpHv67NhG/Ixc6olj/y5+uasyWL0oTsA+//n6ZeaoZpCgcCcJlv+5rZ4bYj4Ko6kXxHrrHkluyk0+2PseB3T2xEEfrekKm5yPhpgkRrsdOk7vvz2ODXWN8Z79yUOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=14XCVcz+27uoORuWciDtxVYu3IA70OHmrAatGX2f/ow=;
 b=MIQkhd0mWrbMkwQT7fLWqzojxxUF2yIUUoLyHPCJWGO1HKVxCB5XQubTBwiLWqtOZb4kzim7UmIqHdLRruSZ5Q3Caiu5E8HvrlA9spDa9es+80zk6ggSqyIIYq6UoIybfcO9gGPlCsmOVr00flgs0oW/xxM/gL0NnGiLyjYfFtQhy1HKE4KXBj4tfeLtudR75kOue+NGc7MFDO5Iraj0p5Anicia0W0rtMmcqJKdp1VlnhMfHrP2oydfw13EE9wynalz8bL7j4ZB6SvuslogUmQ/PMTZ6z7uuQXr1V3HSTn9OFndx1vclEb0TMFo28+zwSHn8JtuHDt9QdSRKLFcEg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=14XCVcz+27uoORuWciDtxVYu3IA70OHmrAatGX2f/ow=;
 b=FzAzIGvP0HB2NJt6GodQAOqWsnaj/4UrL5IYKZXVNz33O4hxBSWDAfWOXvjDT2v8N1iccpiHCVyCJSsqfhOEq/5fRfRT+ivCAuWz4QNt3NpqXA56kQ4SqUpDf4Z3iHHjycX5lIDl+qjl44TQR+jWnx/0V3ELhXMmppw0s0sQ2Mo=
Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Christian.Koenig@amd.com; 
Received: from DM5PR12MB1705.namprd12.prod.outlook.com (10.175.88.22) by
 DM5PR12MB1259.namprd12.prod.outlook.com (10.168.237.138) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2707.21; Tue, 4 Feb 2020 14:27:44 +0000
Received: from DM5PR12MB1705.namprd12.prod.outlook.com
 ([fe80::d40e:7339:8605:bc92]) by DM5PR12MB1705.namprd12.prod.outlook.com
 ([fe80::d40e:7339:8605:bc92%11]) with mapi id 15.20.2686.031; Tue, 4 Feb 2020
 14:27:44 +0000
Subject: Re: [bug report] drm/ttm: fix re-init of global structures
To: Dan Carpenter <dan.carpenter@oracle.com>
References: <20200204125741.lwg526qxwn5gn5ux@kili.mountain>
 <c83eb759-3ca9-64a6-d40c-32786304d82c@amd.com> <20200204142457.GP11068@kadam>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <04f7540f-c14f-12a3-8bf0-692edae4d3ef@amd.com>
Date: Tue, 4 Feb 2020 15:27:39 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
In-Reply-To: <20200204142457.GP11068@kadam>
Content-Language: en-US
X-ClientProxiedBy: ZR0P278CA0043.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:1d::12) To DM5PR12MB1705.namprd12.prod.outlook.com
 (2603:10b6:3:10c::22)
MIME-Version: 1.0
Received: from [IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
 (2a02:908:1252:fb60:be8a:bd56:1f94:86e7) by
 ZR0P278CA0043.CHEP278.PROD.OUTLOOK.COM (2603:10a6:910:1d::12) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2686.29 via Frontend Transport; Tue, 4 Feb 2020 14:27:43 +0000
X-Originating-IP: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 8bb81a02-3d38-4247-bb9a-08d7a97e6609
X-MS-TrafficTypeDiagnostic: DM5PR12MB1259:
X-Microsoft-Antispam-PRVS: <DM5PR12MB1259B81906F4BBE047BCB27883030@DM5PR12MB1259.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:519;
X-Forefront-PRVS: 03030B9493
X-Forefront-Antispam-Report: SFV:NSPM;
 SFS:(10009020)(4636009)(346002)(396003)(366004)(136003)(39860400002)(376002)(189003)(199004)(4326008)(86362001)(31696002)(2616005)(66574012)(66946007)(6916009)(66556008)(66476007)(316002)(31686004)(8676002)(8936002)(81156014)(81166006)(6486002)(478600001)(5660300002)(52116002)(36756003)(16526019)(186003)(6666004)(2906002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR12MB1259;
 H:DM5PR12MB1705.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: k+BiHNw1r/X1wukXKmpsHIV4C8e5e800SziIwWIu/b+qNbaaajf5hX6cuDdU2VXYe8bZsbrQQVQU0BOCj0SIkCtIBGMH4lzkvXG7/gAKbzt9RcmRz+P/JDrKY3qqj2mzdP46CQ2zN1erKCqukPI2KFu+2bjNUSuX60T18qX2hoX2qYQVWHx5UPTCc4TBb51DwwJvexlhCgY4GSZ+AhJju5oA6r11C35eH3uWn0YXzwKx4N6PTVZRmmn9m9Jq/F8a6leDVl1V7dKJd0xrK2R3pox1O7CuMnYc8fY1DZSfNO2oGTJOjRa2le77N6FtHO34qNWtL82ofDUfwNudaCWIOOazbM/lgZJb5j9sTLkWmCdF1Ms+YT7Mf8TOJIexUdoxDAcewACTLkxn+ujmSLIcf+uGr3zcEMITSU8bGf3/VZY9fx/r0pVS8acrVCesB7kc
X-MS-Exchange-AntiSpam-MessageData: LUoaXMH632pLpPp99FoHQFMoE0Yn/U0bfi0ngDzT9TFbW5WuSRR0q3tNxEoMrlttJ9BBNHjmAWGp1owKGaepb8RSAst8rtdMCZ1sSJ/IIBh9fsGiophCt0B1c9BeMLItFo4UY9W5lAqriIIiDcDHpSUCVSpG+sUlY9jxRs59FV6ISO+BpZjc1L5HitNcBtFkWmo2NlPwA0h+XwR6qg0FrA==
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8bb81a02-3d38-4247-bb9a-08d7a97e6609
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Feb 2020 14:27:44.1030 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yZOyTfGmexMFYsk6NK+Ibcucnc3MqIs+Qv4Gb/vrkBe4JzrW5A2vuaBw2brarK7R
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1259
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
Cc: dri-devel@lists.freedesktop.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QW0gMDQuMDIuMjAgdW0gMTU6MjQgc2NocmllYiBEYW4gQ2FycGVudGVyOgo+IE9uIFR1ZSwgRmVi
IDA0LCAyMDIwIGF0IDAzOjAzOjQzUE0gKzAxMDAsIENocmlzdGlhbiBLw7ZuaWcgd3JvdGU6Cj4+
IEFtIDA0LjAyLjIwIHVtIDEzOjU3IHNjaHJpZWIgRGFuIENhcnBlbnRlcjoKPj4+IEhlbGxvIENo
cmlzdGlhbiBLw7ZuaWcsCj4+Pgo+Pj4gVGhlIHBhdGNoIGJkNDI2NDExMmY5MzogImRybS90dG06
IGZpeCByZS1pbml0IG9mIGdsb2JhbCBzdHJ1Y3R1cmVzIgo+Pj4gZnJvbSBBcHIgMTYsIDIwMTks
IGxlYWRzIHRvIHRoZSBmb2xsb3dpbmcgc3RhdGljIGNoZWNrZXIgd2FybmluZzoKPj4+Cj4+PiAJ
ZHJpdmVycy9ncHUvZHJtL3R0bS90dG1fYm8uYzoxNjEwIHR0bV9ib19nbG9iYWxfcmVsZWFzZSgp
Cj4+PiAJd2FybjogcGFzc2luZyBmcmVlZCBtZW1vcnkgJ2dsb2InCj4+Pgo+Pj4gZHJpdmVycy9n
cHUvZHJtL3R0bS90dG1fYm8uYwo+Pj4gICAgIDE1OTEgIHN0YXRpYyB2b2lkIHR0bV9ib19nbG9i
YWxfa29ial9yZWxlYXNlKHN0cnVjdCBrb2JqZWN0ICprb2JqKQo+Pj4gICAgIDE1OTIgIHsKPj4+
ICAgICAxNTkzICAgICAgICAgIHN0cnVjdCB0dG1fYm9fZ2xvYmFsICpnbG9iID0KPj4+ICAgICAx
NTk0ICAgICAgICAgICAgICAgICAgY29udGFpbmVyX29mKGtvYmosIHN0cnVjdCB0dG1fYm9fZ2xv
YmFsLCBrb2JqKTsKPj4+ICAgICAxNTk1Cj4+PiAgICAgMTU5NiAgICAgICAgICBfX2ZyZWVfcGFn
ZShnbG9iLT5kdW1teV9yZWFkX3BhZ2UpOwo+Pj4gICAgIDE1OTcgIH0KPj4+ICAgICAxNTk4Cj4+
PiAgICAgMTU5OSAgc3RhdGljIHZvaWQgdHRtX2JvX2dsb2JhbF9yZWxlYXNlKHZvaWQpCj4+PiAg
ICAgMTYwMCAgewo+Pj4gICAgIDE2MDEgICAgICAgICAgc3RydWN0IHR0bV9ib19nbG9iYWwgKmds
b2IgPSAmdHRtX2JvX2dsb2I7Cj4+PiAgICAgMTYwMgo+Pj4gICAgIDE2MDMgICAgICAgICAgbXV0
ZXhfbG9jaygmdHRtX2dsb2JhbF9tdXRleCk7Cj4+PiAgICAgMTYwNCAgICAgICAgICBpZiAoLS10
dG1fYm9fZ2xvYl91c2VfY291bnQgPiAwKQo+Pj4gICAgIDE2MDUgICAgICAgICAgICAgICAgICBn
b3RvIG91dDsKPj4+ICAgICAxNjA2Cj4+PiAgICAgMTYwNyAgICAgICAgICBrb2JqZWN0X2RlbCgm
Z2xvYi0+a29iaik7Cj4+PiAgICAgMTYwOCAgICAgICAgICBrb2JqZWN0X3B1dCgmZ2xvYi0+a29i
aik7Cj4+PiAgICAgMTYwOSAgICAgICAgICB0dG1fbWVtX2dsb2JhbF9yZWxlYXNlKCZ0dG1fbWVt
X2dsb2IpOwo+Pj4gICAgIDE2MTAgICAgICAgICAgbWVtc2V0KGdsb2IsIDAsIHNpemVvZigqZ2xv
YikpOwo+Pj4gICAgICAgICAgICAgICAgICAgICAgICAgIF5eXl5eXl5eXl5eXl5eXl5eXl5eXl4K
Pj4+IERlcGVuZGluZyBvbiB0aGUgY29uZmlnIGtvYmplY3RfcmVsZWFzZSgpIG1pZ2h0IGNhbGwg
dHRtX2JvX2dsb2JhbF9rb2JqX3JlbGVhc2UoKQo+Pj4gYSBmZXcgc2Vjb25kcyBhZnRlciB0aGlz
IG1lbXNldC4gIE1heWJlIHB1dCB0aGUgbWVtc2V0IGludG8KPj4+IHR0bV9ib19nbG9iYWxfa29i
al9yZWxlYXNlKCk/Cj4+IFRoYXQncyBub3QgcG9zc2libGUuIFRoZSBvYmplY3QgbWlnaHQgYmUg
cmUtdXNlZCBkaXJlY3RseSBhZnRlciB3ZSBkcm9wIHRoZQo+PiB0dG1fZ2xvYmFsX211dGV4Lgo+
Pgo+IEhtLi4uICBUaGF0IHN1Y2tzLiAgSWYgd2UgcmVhbGxvY2F0ZSBnbG9iLT5kdW1teV9yZWFk
X3BhZ2UgYmVmb3JlIHRoZQo+IHR0bV9ib19nbG9iYWxfa29ial9yZWxlYXNlKCkgZ2V0cyBjYWxs
ZWQgdGhlbiB3ZSdyZSB0b2FzdGVkLgo+Cj4+IEhvdyBjYW4gd2Ugd2FpdCBmb3IgdGhlIHR0bV9t
ZW1fZ2xvYmFsX3JlbGVhc2UoKSB0byBoYXZlIGZpbmlzaGVkPwo+Pgo+IEEgYnVuY2ggb2YgdGhl
c2UgcmVsZWFzZSBmdW5jdGlvbnMgdXNlIGEgY29tcGxldGlvbi4gIEJ1dCB5b3UgcHJvYmFibHkK
PiBkb24ndCB3YW50IGEgZm91ciBzZWNvbmQgZGVsYXkgYmVmb3JlIHdlIGNhbiByZS11c2UgdGhl
IHN0cnVjdC4KCkFjdHVhbGx5IHRoYXQgc2hvdWxkIGJlIGZpbmUuCgpJIG1lYW4gdGhlIGZ1bmN0
aW9uIGlzIHVzdWFsbHkgY2FsbGVkIG9uIG1vZHVsZSB1bmxvYWQsIGlmIHRoYXQgcmVhbGx5IAp3
YWl0cyBmb3IgNCBzZWNvbmRzIHVudGlsIGl0IGNhbGxzIHR0bV9ib19nbG9iYWxfa29ial9yZWxl
YXNlKCkgdGhlbiAKdGhhdCB3b3VsZCBtb3N0IGxpa2VseSByZXN1bHQgaW4gYSBjcmFzaCBhbnl3
YXkgYmVjYXVzZSB0aGUgY29kZSBzZWdtZW50IAppcyBhbHJlYWR5IHVubG9hZGVkLgoKUmVnYXJk
cywKQ2hyaXN0aWFuLgoKPgo+IHJlZ2FyZHMsCj4gZGFuIGNhcnBlbnRlcgoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlz
dApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0
b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
