Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 169A015D919
	for <lists+dri-devel@lfdr.de>; Fri, 14 Feb 2020 15:12:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A11906F932;
	Fri, 14 Feb 2020 14:12:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2071.outbound.protection.outlook.com [40.107.237.71])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 018866F932
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Feb 2020 14:12:47 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=k7xy5wnGJu20onRegJKojackHuC5xDU/4OQXyGk98W1QXQp5voT/GXMkTFv23+jLZ88wC/oTqP/sQoHRE3WNLJmszmwoVFBF0mK2Yxl43Re78iXQL27cxj21zBcewEmlHBuSbVffuSFM2pyMmInHp1bozilcsOnEYB0VWHHiqmzsdcS/+yDf9Vtjq4wDZQInhKdeYiPbwwWF1SrM6+FFgSatp5ccPpiZmqhhDJ0RbXatXrXWnHpRxFMjE249ybxEin233coOBLPLWGY6Qsyz/aFaMjbHxSxDpGurdbCgheVucLpA1HF3uclXOioVlNpokb0A7lZPar5Du0EYY05dcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9/Qcm41HNP0vtKxS9FSviLKUH1R9bSysHfCd45p4KfQ=;
 b=NRGtl1do7zBp5v9CJQ6jH0mgyQgRvB3sWNayTOP+93xPdrq65tG9FYMSgDacHboNZo+73OBAcFL/cQYE2lKJUc8ATCe41NwFGPh0ON4l3F1MqXtZGgCHsc7KP/pjwXHy0kc8HrpdEoK5PtEwzNHT3JDFQIQMvNsM8Yf4TdjJDK3C9MXqwVJfuvzShIK4pw7yEZP9zentdxLFwuJAQ08LjGcZ+whIWTUwArWTs2EJC2qyz9Dcv8sW/QjWw86fHIwqe2YgPzunyXVhJFLAf3QOkj4zh/3blsBqCLQbEmqREkooPbu17QxJa/c/YgeOj6lBjxaLW9UrJAn0/96hCmcEag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9/Qcm41HNP0vtKxS9FSviLKUH1R9bSysHfCd45p4KfQ=;
 b=q9eNIGR3CJJ76dNTAdaCIAMwRS9Iu8Z0DoCC/9gsfLW9g739CLPVoOsryN7m+mXWTvJJTiZC+Jn0Dnx1V8fQmSi2o+i1M1tBbWHYVLscruRmj2Otnrmj4Zk3dlyWOuoVN4A3gRF1dOYCbsy8EdY5sTFpBVW+blr8eWkj7FUJUCs=
Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Christian.Koenig@amd.com; 
Received: from DM5PR12MB1705.namprd12.prod.outlook.com (10.175.88.22) by
 DM5PR12MB2549.namprd12.prod.outlook.com (52.132.208.150) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2729.25; Fri, 14 Feb 2020 14:12:46 +0000
Received: from DM5PR12MB1705.namprd12.prod.outlook.com
 ([fe80::d40e:7339:8605:bc92]) by DM5PR12MB1705.namprd12.prod.outlook.com
 ([fe80::d40e:7339:8605:bc92%11]) with mapi id 15.20.2729.025; Fri, 14 Feb
 2020 14:12:46 +0000
Subject: Re: [RFC PATCH 2/6] drm/radeon: don't use ttm bo->offset
To: Nirmoy <nirmodas@amd.com>
References: <20200213120203.29368-1-nirmoy.das@amd.com>
 <20200213120203.29368-3-nirmoy.das@amd.com>
 <21dc2b96-fd7d-19e4-bda6-ebdae2051435@amd.com>
 <bacde18d-3db6-8752-a4ba-2fddf0e406a0@amd.com>
 <10d62138-bb51-155e-ac57-0f23c9c2943e@gmail.com>
 <70b9b568-92f3-a257-4011-3a68f3b31a6c@amd.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <aa948297-bee0-0e58-ec68-b9cf1fdda225@amd.com>
Date: Fri, 14 Feb 2020 15:12:40 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
In-Reply-To: <70b9b568-92f3-a257-4011-3a68f3b31a6c@amd.com>
Content-Language: en-US
X-ClientProxiedBy: ZR0P278CA0050.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:1d::19) To DM5PR12MB1705.namprd12.prod.outlook.com
 (2603:10b6:3:10c::22)
MIME-Version: 1.0
Received: from [IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
 (2a02:908:1252:fb60:be8a:bd56:1f94:86e7) by
 ZR0P278CA0050.CHEP278.PROD.OUTLOOK.COM (2603:10a6:910:1d::19) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2729.24 via Frontend Transport; Fri, 14 Feb 2020 14:12:45 +0000
X-Originating-IP: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 844e914b-6702-4ceb-8a86-08d7b157f6cc
X-MS-TrafficTypeDiagnostic: DM5PR12MB2549:|DM5PR12MB2549:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM5PR12MB2549898F303BD0A84615D76183150@DM5PR12MB2549.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-Forefront-PRVS: 03137AC81E
X-Forefront-Antispam-Report: SFV:NSPM;
 SFS:(10009020)(4636009)(346002)(136003)(376002)(39860400002)(366004)(396003)(199004)(189003)(45080400002)(8936002)(8676002)(36756003)(53546011)(2616005)(66556008)(81166006)(478600001)(966005)(66574012)(31686004)(186003)(81156014)(16526019)(2906002)(6636002)(6486002)(37006003)(6862004)(6666004)(5660300002)(316002)(4326008)(52116002)(66476007)(31696002)(66946007)(86362001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR12MB2549;
 H:DM5PR12MB1705.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: KkSWNwNcn8gI5BXVVuhcCAClwfNCKhJN2c6VNVAtVvOCcnqG3iX+dG3k3ivoUE25ktjkwwyrIrWhhRZ6+bvvADWJGakm3un+4rvmPLpN90xgmLmPguWQHyiemwfH73YXe6ytOtscXJQEGuF7VC9uzUN/AbA5kKMU79MN39iaVURJgPrHEkvK+dr//1VbeOccGUBUVOP1vfiX8SgU+UyvVjo3qlj1Ku1V3hjMCy3D2W088/1yBhdzx6TQn8z6SsVO489VytglXUpc2oQlJRboyPgrTGl9LslntB7OhPcv1etg10xEO3XGjAJU++Klw2pO9Hqk8mEI4Uk5M1z2i1Aw+FJuCOKKQQ19wB4J697I20bgKCTMuY7TwUTaHawdJ/cVcH0GQu5AzQUOIrGPzge7W0K1xySH898gNG7Gbb9pROkDn/uyLoG+CHbsFJm+Owzpn8JpnEFMjgJyL4SLCd8SbhcjEcg56q03AyPyXYnqif9sBKh0xHH0gDUlhBjsU/IOxVxIY+lVYfkbGKHCVp6frw==
X-MS-Exchange-AntiSpam-MessageData: GGMm7AOcDY12LSotaxZExeUzQckdu4tAlaMsMApEqR5a1ETmQiyyG3kQEQiz8InDLhbYNSA90K3hMpHy9HlzwAx3AGQlqUkDWb3Y1mQS6bL69gQjdNiv1PA6c0hdhwtGUHqeQhoauxk8A3bp6LypxPq3iT0qZDD0cU+6//1JSKB5jpP190T8krQW72KyCA3Mx81FMzSxApuBl15YdDMkTQ==
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 844e914b-6702-4ceb-8a86-08d7b157f6cc
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Feb 2020 14:12:45.9134 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: q7HfcIy9+1PAmUhzi5SvRDsrsIhYW9g4KeJKYKwh9OaErT7ewEaa4stFCFsbV9Oq
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB2549
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

QW0gMTMuMDIuMjAgdW0gMTQ6Mjggc2NocmllYiBOaXJtb3k6Cj4KPiBPbiAyLzEzLzIwIDI6MDAg
UE0sIENocmlzdGlhbiBLw7ZuaWcgd3JvdGU6Cj4+IEFtIDEzLjAyLjIwIHVtIDEzOjMxIHNjaHJp
ZWIgTmlybW95Ogo+Pj4KPj4+IE9uIDIvMTMvMjAgMToxOCBQTSwgQ2hyaXN0aWFuIEvDtm5pZyB3
cm90ZToKPj4+PiBMb29rcyBsaWtlIG1vc3Qgb2YgdGhlIHBhdGNoIGlzIG1pc3Npbmc/Cj4+Pj4K
Pj4+PiBXZSBzaG91bGQgaGF2ZSBxdWl0ZSBhIG51bWJlciBvZiB1c2VzIG9mIHRoZSBCTyBvZmZz
ZXQgaW4gcmFkZW9uIG9yIAo+Pj4+IGRvIGFsbCBvZiB0aG9zZSBnbyB0aHJvdWdoIHJhZGVvbl9i
b19ncHVfb2Zmc2V0Pwo+Pj4gQ29tcGlsYXRpb24gd29ya2VkIHNvIEkgdGhpbmsgYWxsIHRob3Nl
KGJvLT5vZmZzZXQpIGFjY2Vzc2VzIHdlbnQgCj4+PiB0aHJvdWdoIHJhZGVvbl9ib19ncHVfb2Zm
c2V0Lgo+Pgo+PiBDb29sLCB0aGFuIHRoYXQgaXMgYSBsb3QgZWFzaWVyIHRvIGltcGxlbWVudCB0
aGFuIEkgdGhvdWdodCBpdCB3b3VsZCBiZS4KPj4KPj4gSSBhc3N1bWUgeW91IGRvbid0IGhhdmUg
UmFkZW9uIGhhcmR3YXJlIGx5aW5nIGFyb3VuZCB0byB0ZXN0IHRoaXM/Cj4+Cj4+IElmIHlvdSBj
YW4geW91IGdpdmUgbWUgYSBicmFuY2ggb24gdGhlIEFNRCAob3IgcHVibGljKSBzZXJ2ZXJzIEkg
Y2FuIAo+PiBnaXZlIGl0IGF0IGxlYXN0IGEgcXVpY2sgcm91bmQgb2YgdGVzdGluZy4KPgo+IGh1
aCBpdCBzZWVtcyBJIGhhdmUgdG8gcmViYXNlIGl0IGEgYml0IGZvciBkcm0vZHJtLW5leHQgYXMg
aXQgaXMgYmFzZWQgCj4gb24gb3VyIGludGVybmFsIGJyYW5jaCA6Lwo+Cj4gWW91IGNhbiBhY2Nl
c3MgdGhlIGJyYW5jaCBhdCAKPiBodHRwOi8vZ2l0bGFiMS5hbWQuY29tL25pcm1vZGFzL2xpbnV4
L3RyZWUvdHRtX2NsZWFuLjEKPgo+IEkgd2lsbCByZWJhc2UgdGhpcyBmb3IgZHJtLW5leHQgaW4g
bmV4dCB2ZXJzaW9uIG9mIHRoZSBwYXRjaCBzZXJpZXMuCgpBY3R1YWxseSB5b3Ugc2hvdWxkIHBy
b2JhYmx5IGJhc2UgaXQgb24gZHJtLW1pc2MtbmV4dCBpbnN0ZWFkLgoKQW5kIGFkZGl0aW9uYWwg
dG8gdGhlIGFscmVhZHkgbm90ZWQgVlJBTSBoZWxwZXJzIHRoZSBib2NocyBkcml2ZXIgZmFpbHMg
CnRvIGNvbXBpbGUgb24geW91ciBicmFuY2guCgpUaGUgZ29vZCBuZXdzIGlzIHRoYXQgbXkgb2xk
IEhENTY3MCBzdGlsbCB3b3JrcyB3aXRoIHRoZSByYWRlb24gcGF0Y2ggCmFwcGxpZWQuIFNvIHRo
aXMgcGF0Y2ggaXMgUmV2aWV3ZWQtYW5kLXRlc3RlZC1ieTogQ2hyaXN0aWFuIEvDtm5pZyAKPGNo
cmlzdGlhbi5rb2VuaWdAYW1kLmNvbT4uCgpSZWdhcmRzLApDaHJpc3RpYW4uCgo+Cj4+Cj4+IENo
cmlzdGlhbi4KPj4KPj4+Pgo+Pj4+IElmIHllcyB0aGVuIHRoZSBjaGFuZ2UgaXMgbXVjaCBzbWFs
bGVyIHRoYW4gSSB0aG91Z2h0IGkgbmVlZHMgdG8gYmUuCj4+Pj4KPj4+PiBDaHJpc3RpYW4uCj4+
Pj4KPj4+IFJlZ2FyZHMsCj4+Pgo+Pj4gTmlybW95Cj4+Pgo+Pj4gX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPj4+IGFtZC1nZnggbWFpbGluZyBsaXN0Cj4+
PiBhbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwo+Pj4gaHR0cHM6Ly9uYW0xMS5zYWZlbGlu
a3MucHJvdGVjdGlvbi5vdXRsb29rLmNvbS8/dXJsPWh0dHBzJTNBJTJGJTJGbGlzdHMuZnJlZWRl
c2t0b3Aub3JnJTJGbWFpbG1hbiUyRmxpc3RpbmZvJTJGYW1kLWdmeCZhbXA7ZGF0YT0wMiU3QzAx
JTdDTmlybW95LkRhcyU0MGFtZC5jb20lN0M2MGFhMTdjMDVhMmY0NzQ2NjNmMDA4ZDdiMDg0YjU1
MCU3QzNkZDg5NjFmZTQ4ODRlNjA4ZTExYTgyZDk5NGUxODNkJTdDMCU3QzAlN0M2MzcxNzE5NTYz
NDI3MjgzODkmYW1wO3NkYXRhPUkybjB5TVhLNUN0ckc1dFk5UTQ3aWd4SnY5T25iJTJGQTdQQmVM
d3JwUGI1NCUzRCZhbXA7cmVzZXJ2ZWQ9MCAKPj4+Cj4+CgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZl
bEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFp
bG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
