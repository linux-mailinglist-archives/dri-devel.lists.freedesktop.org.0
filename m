Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EB8CF18126D
	for <lists+dri-devel@lfdr.de>; Wed, 11 Mar 2020 08:56:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 210036E86F;
	Wed, 11 Mar 2020 07:56:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr700057.outbound.protection.outlook.com [40.107.70.57])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 706076E86F
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Mar 2020 07:56:20 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nPbw/cHKhdT9hMQ/6N4Krf/gV6B3Ymfa8zPPhiYTzsnEuqBW1M2ePkijVNAsg0uKNnrvpQbu1v57FkZ8m9e+xu5oUcwM5Kzy51K7+RMLFYloqQsejHAo0c84dbOAQ2RLXeT0uX9J7EeSiSpiSOcj1WpCWZY3AkuL/45V9m44gEXx6mSyM5Q0KGmIloGzKFSknJyMujuoFIj0XpQyo0sM3o+t4QujQixIE7vg6UBxbVIB+JREHk2HvPspNAD1aWFcf+olr3XrKvHyS+a1uyy2+Q7bOL/VHqKX4xKHK7GDYoNT8CvfcyThDvkuaKzxnMbL/b55QHhHZ1gJEzcxi9oLQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uoPNemnrlg6bf2ROvcM4L05FGmJ/AfoBjrLaaoa5bq0=;
 b=kBXFu0QRkTA1n0TULbwjbU+IkqF2yox5DD6jPDL4IvRnBp93aB5K+hzoAQPD1g9isoxEpUCLmegzilZIfZGjt8/2p1pjhN618V3hhMaagN5K8ELprOq2aAw94cWNgUqHWsbssKtX74R0pLGo9mxD2wCI1jY0GUtp9kVhB61HmvuNInc3Q3UzdJj8JPd8AEpphu1dXtf9RIe7DDM2ImFjnDw7//6bc3nPFjLgzPddOgP/HGCYoBFH0g2FvlVYV59Gd9AE3VCkTzyyy2iGooqXLTbQXcwuyfmtfrMkiu8aiN2JYxzF6ogm08FYWWvvvfLCk1onr7FYaA5p8dcUc3Kcbg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uoPNemnrlg6bf2ROvcM4L05FGmJ/AfoBjrLaaoa5bq0=;
 b=byZfYofCZ5KyWZeTwPAcXmi043dNaAXcia/BJHSNinHN5aQpugu7JzqNDgEugjanrkqJD1j2QHDoi2JAhiRba7DT1bv3wi37C8J+7XNbiLoMC1a/408XDlMxJmlctcvhu8VeASn1cxY5W20puw5Kwe7a4WceMVIoG0i3H2wnr1M=
Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Christian.Koenig@amd.com; 
Received: from DM5PR12MB1705.namprd12.prod.outlook.com (2603:10b6:3:10c::22)
 by DM5PR12MB2501.namprd12.prod.outlook.com (2603:10b6:4:b4::34) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2793.17; Wed, 11 Mar
 2020 07:56:19 +0000
Received: from DM5PR12MB1705.namprd12.prod.outlook.com
 ([fe80::d40e:7339:8605:bc92]) by DM5PR12MB1705.namprd12.prod.outlook.com
 ([fe80::d40e:7339:8605:bc92%11]) with mapi id 15.20.2793.013; Wed, 11 Mar
 2020 07:56:19 +0000
Subject: Re: [PATCH] drm/ttm: Use scnprintf() for avoiding potential buffer
 overflow
To: Huang Rui <ray.huang@amd.com>, Takashi Iwai <tiwai@suse.de>
References: <20200311073452.7056-1-tiwai@suse.de>
 <20200311075236.GB2835@jenkins-Celadon-RN>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <85766da1-7021-2ea1-990f-813f08d80cd8@amd.com>
Date: Wed, 11 Mar 2020 08:56:11 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
In-Reply-To: <20200311075236.GB2835@jenkins-Celadon-RN>
Content-Language: en-US
X-ClientProxiedBy: AM0PR0202CA0030.eurprd02.prod.outlook.com
 (2603:10a6:208:1::43) To DM5PR12MB1705.namprd12.prod.outlook.com
 (2603:10b6:3:10c::22)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
 (2a02:908:1252:fb60:be8a:bd56:1f94:86e7) by
 AM0PR0202CA0030.eurprd02.prod.outlook.com (2603:10a6:208:1::43) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2814.13 via Frontend
 Transport; Wed, 11 Mar 2020 07:56:18 +0000
X-Originating-IP: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: fe9fbda5-2de9-4aa5-cea1-08d7c591aefa
X-MS-TrafficTypeDiagnostic: DM5PR12MB2501:|DM5PR12MB2501:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM5PR12MB2501E13D6316C300B6A09BAD83FC0@DM5PR12MB2501.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-Forefront-PRVS: 0339F89554
X-Forefront-Antispam-Report: SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(376002)(39860400002)(366004)(136003)(346002)(199004)(2906002)(66556008)(66946007)(2616005)(52116002)(66476007)(5660300002)(186003)(31686004)(6486002)(16526019)(8936002)(110136005)(478600001)(86362001)(8676002)(31696002)(36756003)(81166006)(4326008)(66574012)(81156014)(316002)(6666004);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR12MB2501;
 H:DM5PR12MB1705.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; 
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: OWz6XkMR5/VWmkUSYN3fZqU+xGmeGJHfbIkdbTLiAnpW0wkGouvHp91mpvQ7un1eGvV52BsIPR+iIKfq2x6uIRVhPC3yxX5VSIn6xIixlayzxoJZYUYpCt302me9BAUE2QJxiRGkgWMTTdKsZhqiZGHSo+PU/mxSdKuojnusChOZirp2g7kNwAAmQloIlXt5ICbrMwpGd4nmAiygtvPvlkddRzUBo62zMAXz+2OA6UOKXRC/MjMPejsut0zrtLBoF434meGPYGED+dh/PxfNUOS3B+K48D6qP3m1aw0E/y56M7z9pUcumB4cI63qp/M8tpgYUYRhpNsxZs1NsVNd5CzHz/f7wk8u4dOxaJzT0VTPbsBvAT/stMbkWiGYH5vdZs/+x/SlAZCY2Goxg89kkXE8d+zhRwmsVIlPDibCVlbcb1v0OPSktDxhh9SJ55xo
X-MS-Exchange-AntiSpam-MessageData: vTjVFGviKP35IcKOstm97LdpljD8qRoBBLsotVPcXr0EjvxuVy2l1wkTCRqqj/S85gNd69hqkwOmINAvG7EuHdPS1+9Eklc11uYBsXtE/wq6T1MYDQALK/zoCBqkRjC7s4m4H/91HZf5KxythUvQZpi/lVgo7j3DC2WsLH29kyKkeOK7mH5qYBnkl0pCDjzAzYHftKw+w8pIK1xQ8vB+eA==
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fe9fbda5-2de9-4aa5-cea1-08d7c591aefa
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Mar 2020 07:56:19.3906 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: T2LE4rhNmcdOBfEPpFfRir+r2dA2ZdNZ0SIkqDz4JB5ImIv/nteyZX8D7gid//9T
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB2501
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
Cc: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QW0gMTEuMDMuMjAgdW0gMDg6NTIgc2NocmllYiBIdWFuZyBSdWk6Cj4gT24gV2VkLCBNYXIgMTEs
IDIwMjAgYXQgMDM6MzQ6NTJQTSArMDgwMCwgVGFrYXNoaSBJd2FpIHdyb3RlOgo+PiBTaW5jZSBz
bnByaW50ZigpIHJldHVybnMgdGhlIHdvdWxkLWJlLW91dHB1dCBzaXplIGluc3RlYWQgb2YgdGhl
Cj4+IGFjdHVhbCBvdXRwdXQgc2l6ZSwgdGhlIHN1Y2NlZWRpbmcgY2FsbHMgbWF5IGdvIGJleW9u
ZCB0aGUgZ2l2ZW4KPj4gYnVmZmVyIGxpbWl0LiAgRml4IGl0IGJ5IHJlcGxhY2luZyB3aXRoIHNj
bnByaW50ZigpLgo+Pgo+PiBTaWduZWQtb2ZmLWJ5OiBUYWthc2hpIEl3YWkgPHRpd2FpQHN1c2Uu
ZGU+Cj4gUmV2aWV3ZWQtYnk6IEh1YW5nIFJ1aSA8cmF5Lmh1YW5nQGFtZC5jb20+CgpSZXZpZXdl
ZC1ieTogQ2hyaXN0aWFuIEvDtm5pZyA8Y2hyaXN0aWFuLmtvZW5pZ0BhbWQuY29tPgoKVGFrYXNo
aSwgc2hvdWxkIEkgcHVzaCB0aGlzIHRvIGRybS1taXNjLW5leHQgb3IgZG8geW91IHdhbnQgdG8g
bWVyZ2UgCnRoYXQgc29tZWhvdyBlbHNlPwoKVGhhbmtzLApDaHJpc3RpYW4uCgo+Cj4+IC0tLQo+
PiAgIGRyaXZlcnMvZ3B1L2RybS90dG0vdHRtX3BhZ2VfYWxsb2NfZG1hLmMgfCAyICstCj4+ICAg
MSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCj4+Cj4+IGRpZmYg
LS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vdHRtL3R0bV9wYWdlX2FsbG9jX2RtYS5jIGIvZHJpdmVy
cy9ncHUvZHJtL3R0bS90dG1fcGFnZV9hbGxvY19kbWEuYwo+PiBpbmRleCBiZjg3NmZhZWE1OTIu
LmZhZWZhYWVmNzkwOSAxMDA2NDQKPj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3R0bS90dG1fcGFn
ZV9hbGxvY19kbWEuYwo+PiArKysgYi9kcml2ZXJzL2dwdS9kcm0vdHRtL3R0bV9wYWdlX2FsbG9j
X2RtYS5jCj4+IEBAIC02MDQsNyArNjA0LDcgQEAgc3RhdGljIHN0cnVjdCBkbWFfcG9vbCAqdHRt
X2RtYV9wb29sX2luaXQoc3RydWN0IGRldmljZSAqZGV2LCBnZnBfdCBmbGFncywKPj4gICAJcCA9
IHBvb2wtPm5hbWU7Cj4+ICAgCWZvciAoaSA9IDA7IGkgPCBBUlJBWV9TSVpFKHQpOyBpKyspIHsK
Pj4gICAJCWlmICh0eXBlICYgdFtpXSkgewo+PiAtCQkJcCArPSBzbnByaW50ZihwLCBzaXplb2Yo
cG9vbC0+bmFtZSkgLSAocCAtIHBvb2wtPm5hbWUpLAo+PiArCQkJcCArPSBzY25wcmludGYocCwg
c2l6ZW9mKHBvb2wtPm5hbWUpIC0gKHAgLSBwb29sLT5uYW1lKSwKPj4gICAJCQkJICAgICAgIiVz
IiwgbltpXSk7Cj4+ICAgCQl9Cj4+ICAgCX0KPj4gLS0gCj4+IDIuMTYuNAo+PgoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcg
bGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRl
c2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
