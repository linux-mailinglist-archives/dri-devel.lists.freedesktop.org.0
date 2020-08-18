Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B7C642480A3
	for <lists+dri-devel@lfdr.de>; Tue, 18 Aug 2020 10:31:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CAEAA89BCD;
	Tue, 18 Aug 2020 08:31:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2075.outbound.protection.outlook.com [40.107.92.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BADDA89BB3;
 Tue, 18 Aug 2020 08:31:34 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jozRH25AhCqdmExxZxGKK76UmbNNLnbQBJhG6aerRB2xADYfApJuAMlHNuDOiYSLkGtOUmTTAlceIo8JyAk1deAo3hCZz387iqzTzlLEKDyS7854wfihrOeoUv1x1CXTZKEIUSEAcyOoP6whxm+GIqWL+TiBogKYtb7yGC58zdvmCnWDgXEZjDGVgh1I46hVH20vbpeqtDG530/BJ+Ymf8NbbVtNElT6hMIvGibLTAL66CmlMz9i12NglM6we+kNmBDybLvO9tSvR7k7oo+ZeWJthp+vzPsIuEWvldjWRz08cJ7hBcfLs+S69i6z/bxO/yjdIyC8+8dNHkKHkCwmpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=D+zrV1tiZSyPoEH1/0OgFEmJxkx6pkIq+hXK3ZVrooE=;
 b=BaJiXLVwQbrzdmL1v1e93sK+38Z0ubgqRVdVMVAt+M2/5wQ8lPGB29BmYw/SQI6kvjn4/t6SCuHYMi0kJdAZxiykft9rawE5OwHhX3wX76CqzHyMFuNIsxYGssY7kkj9lmZkWN1J5olQvhURqwqpmdM2KW0HDfsbBY9gJsSIaWGAuB0IsJtjeYWDTe+gaI8QLoMycWePd65zs6sGEAEG3ZbiM40/LQf8tKV5feauSLBMH7kyYpQKTfd42zv73EhYJv8oD9ApMtKi99bZSanCeLbUlfDpsrNQw73DxgFmXAIG98ExtC9gISYfuUZU8iuC+StxKLHfeYkml6LslIdywQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=D+zrV1tiZSyPoEH1/0OgFEmJxkx6pkIq+hXK3ZVrooE=;
 b=Y1RJyxhJn/hyNQ09gRIPIukFVGUjYVZVbTIfFJg0W7fJesDkwYpxUUkfmyj98ix2boidT8a7bzJXm1QMinPTcmuei5olVUJygLdke35RRcTp/X/v2ZWpyUzurHaEpKwigf+c0Nc1udPb/uLHPP37BzXU3znOOc6GPcboeY5U8gM=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by MN2PR12MB4320.namprd12.prod.outlook.com (2603:10b6:208:15f::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3305.24; Tue, 18 Aug
 2020 08:31:27 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::a16e:8812:b4c0:918d]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::a16e:8812:b4c0:918d%6]) with mapi id 15.20.3283.028; Tue, 18 Aug 2020
 08:31:27 +0000
Subject: Re: [PATCH 1/2] drm: allow limiting the scatter list size.
To: Gerd Hoffmann <kraxel@redhat.com>
References: <20200818074828.9509-1-kraxel@redhat.com>
 <20200818074828.9509-2-kraxel@redhat.com>
 <9c355d64-1a61-eb59-be80-d9fc863ddf22@amd.com>
 <20200818082703.7z6fcvoymiqow5kw@sirius.home.kraxel.org>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <03c03129-db27-c6da-df8f-909141d2a3f7@amd.com>
Date: Tue, 18 Aug 2020 10:31:19 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <20200818082703.7z6fcvoymiqow5kw@sirius.home.kraxel.org>
Content-Language: en-US
X-ClientProxiedBy: AM0PR06CA0142.eurprd06.prod.outlook.com
 (2603:10a6:208:ab::47) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
 (2a02:908:1252:fb60:be8a:bd56:1f94:86e7) by
 AM0PR06CA0142.eurprd06.prod.outlook.com (2603:10a6:208:ab::47) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3283.16 via Frontend Transport; Tue, 18 Aug 2020 08:31:24 +0000
X-Originating-IP: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 733fd9ac-5bf9-4479-2d30-08d843511978
X-MS-TrafficTypeDiagnostic: MN2PR12MB4320:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MN2PR12MB43203D0876E0A0E3FE06BA86835C0@MN2PR12MB4320.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: LQaNOJXCKf3kKYJ59Cb2Dm2gnNaHZ0LBy4rCZViA0eu9SEgygFr7lqNBtLsLOSB2tOQc1grI/3ZgVRa+tWc+PDiQUCDerWl9qSHzFTxytn+WNbCUGwTGqm8P/ALyEUDnA4MDRDV0c3RgynClLR/qp6Y1dMvndi6/nOgHcjlHHjid1aOEW7OgNKjJkZgpwjvrqJyNCuDZQ55Y8marTz+vsF3U9JflaYbxHJ+rWIM/8yDGW9bqsS85fFMZJCvgcRuHPI3NkAIsxptt8PLvhDUTcxLr85wElcEj8ZUIhheGqPs/7mqNqDCvT17D3zVQStWryRUnSOaZi6caSSDonxSpJVhQJrRB5Nm1W1Aoh5yqPKwPwnuCtxc/JYVLfMsLm10R
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(346002)(396003)(366004)(136003)(39860400002)(8936002)(31686004)(5660300002)(316002)(66556008)(66476007)(6666004)(36756003)(8676002)(186003)(478600001)(2616005)(31696002)(16526019)(2906002)(6916009)(4326008)(86362001)(6486002)(66574015)(54906003)(7416002)(52116002)(66946007)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: Kg1CmbjzDwObSoZoMrNCi8+hXFQDjU92ZpmsGLbTBTDzJ/mLacqHqFh0F1DM8+6w8Ce147m3qYvj8IbFvPXHjPNtaLFgR6X1AqkK906wxQTWWUcCKq3pT8CO7YqOlnTkb+ra3TbwlvKttW8sEpdsdNWd/Vlv2tdutM9swBs+WuhUHeTvgk6KlP3wDDtPbXM4IMA5BW6YHR8/X5U0JqP+AAQeYcCcFrv7Csn2R44KGcIRDvwvFU8gEQjNQvOOMrNachlK6aRpZFflIoFeMeD+LD69I9v+TvQqvdaW9b70v4zf87obZJcaK2jII8W1cHL1kFdq1XPeZX7PuuAe7Xaor/6g5rK3yfzFleGuvTxvletLBwQh02RczflKflBTrY+T6ITUcMERDw2Ob+AgpCNMJ/lJkS2pVuDe7mYr6Ma/raZ4W2SUIQGtfxsSI6tUIHWBtN/EXQkapF1iSWh2dLm+r75GZd4jETyncozb3DGXm30/zfQeB+VqlDwcvPZHqzAueS/8EB5ckxnkS3slVgqNSdF7qNoecIz95WIpRPLAvIFHO7oTlmuc7fRiyapZJ5jsPyJE3aJX6BVdaABibkdhk9GOHrVc6X5cRFQZDlYRyKVreJDdb4Or70/LCf//38OcYq704RSYoxE3LQw6X9SMIWcSa6JJpb7d7MYJHkHPGl6tZ9S3KmRcHDsJ/PxFAQGnoUbvdm6yW1NGBQVwb9o7Ew==
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 733fd9ac-5bf9-4479-2d30-08d843511978
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Aug 2020 08:31:27.6280 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hjBcB47fGEt4/fIiRNL0Ry5fSoEAzS0fx60Ge7bc3/5IWqE2oGhkiPzhznoF/Lzd
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4320
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
Cc: "open list:DRM DRIVER FOR MSM ADRENO GPU"
 <freedreno@lists.freedesktop.org>, Alex Deucher <alexander.deucher@amd.com>,
 open list <linux-kernel@vger.kernel.org>,
 Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>,
 David Airlie <airlied@linux.ie>,
 "open list:DRM DRIVER FOR NVIDIA GEFORCE/QUADRO GPUS"
 <nouveau@lists.freedesktop.org>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>,
 "moderated list:DRM DRIVERS FOR VIVANTE GPU IP"
 <etnaviv@lists.freedesktop.org>, Sandy Huang <hjc@rock-chips.com>,
 dri-devel@lists.freedesktop.org, Jonathan Hunter <jonathanh@nvidia.com>,
 "open list:ARM/Rockchip SoC support" <linux-rockchip@lists.infradead.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 "open list:RADEON and AMDGPU DRM DRIVERS" <amd-gfx@lists.freedesktop.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Russell King <linux+etnaviv@armlinux.org.uk>,
 "open list:DRM DRIVERS FOR NVIDIA TEGRA" <linux-tegra@vger.kernel.org>,
 "moderated list:DRM DRIVERS FOR XEN" <xen-devel@lists.xenproject.org>,
 Sean Paul <sean@poorly.run>, "moderated list:ARM/Rockchip SoC support"
 <linux-arm-kernel@lists.infradead.org>, Ben Skeggs <bskeggs@redhat.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QW0gMTguMDguMjAgdW0gMTA6Mjcgc2NocmllYiBHZXJkIEhvZmZtYW5uOgo+IE9uIFR1ZSwgQXVn
IDE4LCAyMDIwIGF0IDA5OjU3OjU5QU0gKzAyMDAsIENocmlzdGlhbiBLw7ZuaWcgd3JvdGU6Cj4+
IEFtIDE4LjA4LjIwIHVtIDA5OjQ4IHNjaHJpZWIgR2VyZCBIb2ZmbWFubjoKPj4+IEFkZCBtYXhf
c2VnbWVudCBhcmd1bWVudCB0byBkcm1fcHJpbWVfcGFnZXNfdG9fc2coKS4gIFdoZW4gc2V0IHBh
c3MgaXQKPj4+IHRocm91Z2ggdG8gdGhlIF9fc2dfYWxsb2NfdGFibGVfZnJvbV9wYWdlcygpIGNh
bGwsIG90aGVyd2lzZSB1c2UKPj4+IFNDQVRURVJMSVNUX01BWF9TRUdNRU5ULgo+Pj4KPj4+IEFs
c28gYWRkIG1heF9zZWdtZW50IGZpZWxkIHRvIGdlbSBvYmplY3RzIGFuZCBwYXNzIGl0IHRvCj4+
PiBkcm1fcHJpbWVfcGFnZXNfdG9fc2coKSBjYWxscyBpbiBkcml2ZXJzIGFuZCBoZWxwZXJzLgo+
Pj4KPj4+IFNpZ25lZC1vZmYtYnk6IEdlcmQgSG9mZm1hbm4gPGtyYXhlbEByZWRoYXQuY29tPgo+
PiBJJ20gbWlzc2luZyBhbiBleHBsYW5hdGlvbiB3aHkgdGhpcyBzaG91bGQgYmUgdXNlZnVsIChp
dCBjZXJ0YWlubHkgaXMpLgo+IHZpcnRpby1ncHUgbmVlZHMgdGhpcyB0byB3b3JrIHByb3Blcmx5
IHdpdGggU0VWIChzZWUgcGF0Y2ggMi8yIG9mIHRoaXMKPiBzZXJpZXMpLgoKWWVhaCwgdGhhdCdz
IHRoZSBwcm9ibGVtIHBhdGNoIDIvMiBuZXZlciBzaG93ZWQgdXAgaGVyZSA6KQoKPj4gQW5kIHRo
ZSBtYXhpbXVtIHNlZ21lbnQgc2l6ZSBzZWVtcyBtaXNwbGFjZWQgaW4gdGhlIEdFTSBvYmplY3Qu
IFRoaXMgaXMKPj4gdXN1YWxseSBhIHByb3BlcnR5IG9mIHRoZSBkZXZpY2Ugb3IgZXZlbiBjb21w
bGV0ZWx5IGNvbnN0YW50Lgo+IFBsYWNpbmcgaXQgaW4gZHJtX2RldmljZSBpbnN0ZWFkIHdvdWxk
IGluZGVlZCB3b3JrIGZvciB2aXJ0aW8tZ3B1LCBzbyBJCj4gZ3Vlc3MgeW91IGFyZSBzdWdnZXN0
aW5nIHRoYXQgaW5zdGVhZD8KClRoYXQgaXMgcHJvYmFibHkgdGhlIGJlc3QgYXBwcm9hY2gsIHll
cy4KCkZvciBJbnRlbCBhbmQgQU1EIGl0IGNvdWxkIGV2ZW4gYmUgZ2xvYmFsL2NvbnN0YW50LCBi
dXQgaXQgY2VydGFpbmx5IApkb2Vzbid0IG5lZWRzIHRvIGJlIGtlcHQgYXJvdW5kIGZvciBlYWNo
IGJ1ZmZlci4KCkNocmlzdGlhbi4KCj4KPiB0YWtlIGNhcmUsCj4gICAgR2VyZAo+CgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGlu
ZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVl
ZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
