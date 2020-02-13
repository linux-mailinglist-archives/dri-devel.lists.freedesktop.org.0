Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5996715BF51
	for <lists+dri-devel@lfdr.de>; Thu, 13 Feb 2020 14:28:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F6346E2EA;
	Thu, 13 Feb 2020 13:28:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2053.outbound.protection.outlook.com [40.107.244.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A4ECF6E2EA
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Feb 2020 13:28:24 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SQONiAN3MqGlbg86J6bKfMBDLxo1jXxhuV+dLF2pMVznWQZChhEtac9Qqh1nVVjXfH8+XOhVz+XMWbDxuJnVL+5Xw82AtD8z6od1RTdmi9Gabf5GaCf78p6/wIH/APaoiLaEWn6asgSFRurFjNOD5255z5lz4GSTU+3oY6PGtSECl+zpwFhAzmZGavy5LMHFOeVdoZm1xbeWp6Gb/3N/rh2Y7GsQHgq3nldaqeswpXlrYEWzfx0r6w1kNOziqC5liU0ImeDXJsB4VoGz3YbMrKptxlouVZiQMjl0N8SjbuOmvflz6Z7NnaLNzx3ux+N2vUo/lPNn6hUFZihj+XMWLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kk3CraBHRGsTrKt4JoTEQ/vNpHq0NeOkUGkgdugom9U=;
 b=bOTSArEMgP3aIfmpbvZiOyR6YhBdq3IeP9rtpA+VUfuZDHd1f11DzWqob1XNSSu4yO/iy5ZYIb0PGHbPHeX2E9t9VP0651GO9NzT8nzWUdjV1HFvW6GUj0hOPqWHGywa62zFwbjBKt9GvAhI1xRezbbSLq34dr4sBjpPURQVRETSe9e4+SlOv/cOG0aXbBIgDwnd4GuZm2tXphhtrd2pmsp9vBmW3OTn2I1OevNAj9BO5qHq/OB6DYclVReYixr/NJqyHXKdBMcx/vNLd55aVdxYJ15QsmooYr0bBpFRmo+HRv6ZDrxUB4956+vugV90SfqKRj6FtafI5yTAVIpkNQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kk3CraBHRGsTrKt4JoTEQ/vNpHq0NeOkUGkgdugom9U=;
 b=DcnaXpJgHaK6cQpe9Enhd/d9BieI54uL+2eK000K3OxOrtaxuiizC/9/y/VXkxZzKMqkwNzTRBxa3kWeLfNSwtkpc1i3hCZPLtmDbrx6cgxU6xeIW9Ui8qAiQI09kO2rB6ih7bRYHwZBYx8zuXG/jdJoEfgD4zBiZH8j3wX/rFc=
Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Nirmoy.Das@amd.com; 
Received: from DM5PR12MB2376.namprd12.prod.outlook.com (52.132.143.139) by
 DM5PR12MB2437.namprd12.prod.outlook.com (52.132.208.13) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2729.22; Thu, 13 Feb 2020 13:28:23 +0000
Received: from DM5PR12MB2376.namprd12.prod.outlook.com
 ([fe80::c06c:24da:d4c5:5ee3]) by DM5PR12MB2376.namprd12.prod.outlook.com
 ([fe80::c06c:24da:d4c5:5ee3%6]) with mapi id 15.20.2729.024; Thu, 13 Feb 2020
 13:28:23 +0000
Subject: Re: [RFC PATCH 2/6] drm/radeon: don't use ttm bo->offset
To: christian.koenig@amd.com
References: <20200213120203.29368-1-nirmoy.das@amd.com>
 <20200213120203.29368-3-nirmoy.das@amd.com>
 <21dc2b96-fd7d-19e4-bda6-ebdae2051435@amd.com>
 <bacde18d-3db6-8752-a4ba-2fddf0e406a0@amd.com>
 <10d62138-bb51-155e-ac57-0f23c9c2943e@gmail.com>
From: Nirmoy <nirmodas@amd.com>
Message-ID: <c35d895b-14da-ea72-c13b-d8f1be5765ab@amd.com>
Date: Thu, 13 Feb 2020 14:30:57 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.2
In-Reply-To: <10d62138-bb51-155e-ac57-0f23c9c2943e@gmail.com>
Content-Language: en-US
X-ClientProxiedBy: AM0PR05CA0077.eurprd05.prod.outlook.com
 (2603:10a6:208:136::17) To DM5PR12MB2376.namprd12.prod.outlook.com
 (2603:10b6:4:b9::11)
MIME-Version: 1.0
Received: from [IPv6:2003:c5:8f2a:5e00:4db9:9f42:976e:8a13]
 (2003:c5:8f2a:5e00:4db9:9f42:976e:8a13) by
 AM0PR05CA0077.eurprd05.prod.outlook.com (2603:10a6:208:136::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2729.22 via Frontend
 Transport; Thu, 13 Feb 2020 13:28:22 +0000
X-Originating-IP: [2003:c5:8f2a:5e00:4db9:9f42:976e:8a13]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 4bde6e26-3d15-49b1-1088-08d7b0889979
X-MS-TrafficTypeDiagnostic: DM5PR12MB2437:|DM5PR12MB2437:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM5PR12MB2437A6831C12A53454FA893A8B1A0@DM5PR12MB2437.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-Forefront-PRVS: 031257FE13
X-Forefront-Antispam-Report: SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(366004)(39850400004)(346002)(376002)(136003)(199004)(189003)(37006003)(5660300002)(2616005)(2906002)(316002)(52116002)(186003)(478600001)(8936002)(53546011)(8676002)(4744005)(81156014)(81166006)(16526019)(31686004)(6486002)(31696002)(4326008)(36756003)(34206002)(66946007)(6636002)(66476007)(66556008)(6666004);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR12MB2437;
 H:DM5PR12MB2376.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: /v1FyWY2+1vwA9yxGUPW2vfmJV76kCKPlz30Ko6HsPpR2kKwZcD6aNhsXW34H76SKYc0RfiR4wW9OTE7fBIcU/TizU95faQ9t7BzIuNw67U8MM91Zus94+x0lirSWEPT0UyQw/lZA2QFxw+tU9r8+zbv5287zkO7+AS1LJ+eQvfgBr9hpEjGW5Z0K2JYZMr7kn679uEX8BsGVO6K1irweGpzZSpflyWWZ/oWzOp0k/wya1XeghURGi2CH+6wDQYkPquMgowXqTvXxnW3LrHF6xm63BKjPtBqPjqgmHDcb35YRD8HwjUdbWDGdH5I/Su8JGqoqVSlexCxuF8hulBhV8yNUqTz0MdjC4+nyVXZ4EuIjVFgGpk8qLKReALL73GFe50bfy7MdhLbAcerc+ZPufl864xsg6Md/N97coSPGuZb/9FMm+gWZC8anK9aDVcj
X-MS-Exchange-AntiSpam-MessageData: MtFEB5d/SNxjBIXfI29rkgMmNkaBy/hvAeijHUSLBZjvwAbKgDAaE8Rg6s25e8TOci8V+0Z+s4cFHHOeLiQLQchDSI1ZbpIGlwwpwIoX8P4xXAUhHKrQDCSeDScPqPxLg4FfWNbuc7R/4tu4A4d0kpYgYFpw99kmFbLyvpIu2g9jZVpQnJCLNBZ0SIFh8VkhV/2/u+qnQNNQB7IAAKLyyQ==
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4bde6e26-3d15-49b1-1088-08d7b0889979
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Feb 2020 13:28:23.4682 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xURlcJb/JCYjABZpY27sBqtogPcU4ERwj0OuJBDy/8AW798O0dEkHYr3a5FFPT95TeX71f9KAtfpjeaIhCaiFA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB2437
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

Ck9uIDIvMTMvMjAgMjowMCBQTSwgQ2hyaXN0aWFuIEvDtm5pZyB3cm90ZToKPiBDb29sLCB0aGFu
IHRoYXQgaXMgYSBsb3QgZWFzaWVyIHRvIGltcGxlbWVudCB0aGFuIEkgdGhvdWdodCBpdCB3b3Vs
ZCBiZS4KPgo+IEkgYXNzdW1lIHlvdSBkb24ndCBoYXZlIFJhZGVvbiBoYXJkd2FyZSBseWluZyBh
cm91bmQgdG8gdGVzdCB0aGlzPwoKWWVzIHRoaXMgd291bGQgYmUgbmljZSBJIGRvbid0IGhhdmUg
YcKgIFJhZGVvbiBodyB3aXRoIG1lLgoKPgo+IElmIHlvdSBjYW4geW91IGdpdmUgbWUgYSBicmFu
Y2ggb24gdGhlIEFNRCAob3IgcHVibGljKSBzZXJ2ZXJzIEkgY2FuIAo+IGdpdmUgaXQgYXQgbGVh
c3QgYSBxdWljayByb3VuZCBvZiB0ZXN0aW5nLgoKClRoYW5rcywKCk5pcm1veQoKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5n
IGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVk
ZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
