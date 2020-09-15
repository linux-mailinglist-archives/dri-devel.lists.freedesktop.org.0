Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0592326A84A
	for <lists+dri-devel@lfdr.de>; Tue, 15 Sep 2020 17:05:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F06206E87B;
	Tue, 15 Sep 2020 15:05:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2068.outbound.protection.outlook.com [40.107.220.68])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 055376E861;
 Tue, 15 Sep 2020 15:05:31 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=S+uURhelGsy+bQucw/1ZAZ8eP0eI+QDiaPC113yDUdf+X3gMJFFw2YoUUz+AuOv19mqilDhBVkNqFAdKwF4hPzKwFKevGcZO9KufDD40bVnmd9ysZO8+M7zv9by3XVzyVTWJCiUonBNhdiNqprA4nodI7q9BmBfiq0Aj5EXAmgRgyoFcFtzYgiHs0PZpbqGhno3ML+lP2VPGN87eFUtDzq/ekTr31vqfPTpnXOGzIJ6lTMnGviyURDMNh7rdwNxTN/mF2VXlOZFyHhwfXO8XhHFSbpEjHGdd2yGYXPQiPnbR7avCx8nFtUwt9yI+oQWhXzbhs7H4/1ZK4n8ax/garA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iH6uLUSOGlskccVBIX+AS4mkIM1KgY3H2c/OM9SZuao=;
 b=L9I7u/OiqMoUsZifvVRwnr2UI6HgYwzd1k+kkX17C6QcWgSYvaK0wfe49k+GIJt3irVTwbj/sRNY6jW88dlHZQdLAl/xCysEweFOVNQyUp6dlYAXr4ChUUlbN6hq6TtX1wdU15pA4P/c3F1V6LlLm7Ru6A11j1aEF4A+CXw4TkiHzgz0k8MqHZqhdciwnNgngLTDZVgrMZkU/6lkS59v/UnybhRx7D5aG/RKuVf6JpAYMMUfI82PvwN/stRF6HZJYMJ2MuqVUKaYMzKjuDuKA1zqRtUOlrHxEvg2rrxKNVTiMa6FoLUEzEKXiier/pd6Il/ykPbC/SDnl7wmOKrLwA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iH6uLUSOGlskccVBIX+AS4mkIM1KgY3H2c/OM9SZuao=;
 b=BeFzVoSEuTGKsuQkkQeo0LftvEvZm89B/cv9FHSjBVfpkWpUvqA0Wcu0z8xvtMPLXmlgq1DQ3M87Ct6iw/HjqiL0JonaDw/9b+A549Fc/riXv78+sdV6KCl77biQB7nkC5lMjOYfJ/MXLWQC5qp4FeGesQ5ej3As3jaRxuLjy7g=
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by MN2PR12MB4125.namprd12.prod.outlook.com (2603:10b6:208:1d9::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3370.16; Tue, 15 Sep
 2020 15:05:29 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::f8f7:7403:1c92:3a60]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::f8f7:7403:1c92:3a60%6]) with mapi id 15.20.3370.019; Tue, 15 Sep 2020
 15:05:29 +0000
Subject: Re: [PATCH v2 01/21] drm/amdgpu: Introduce GEM object functions
To: Thomas Zimmermann <tzimmermann@suse.de>, alexander.deucher@amd.com,
 airlied@linux.ie, daniel@ffwll.ch, linux@armlinux.org.uk,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 l.stach@pengutronix.de, christian.gmeiner@gmail.com, inki.dae@samsung.com,
 jy0922.shim@samsung.com, sw0312.kim@samsung.com, kyungmin.park@samsung.com,
 kgene@kernel.org, krzk@kernel.org, patrik.r.jakobsson@gmail.com,
 jani.nikula@linux.intel.com, joonas.lahtinen@linux.intel.com,
 rodrigo.vivi@intel.com, chunkuang.hu@kernel.org, p.zabel@pengutronix.de,
 matthias.bgg@gmail.com, robdclark@gmail.com, sean@poorly.run,
 bskeggs@redhat.com, tomi.valkeinen@ti.com, eric@anholt.net,
 hjc@rock-chips.com, heiko@sntech.de, thierry.reding@gmail.com,
 jonathanh@nvidia.com, rodrigosiqueiramelo@gmail.com,
 hamohammed.sa@gmail.com, oleksandr_andrushchenko@epam.com,
 hyun.kwon@xilinx.com, laurent.pinchart@ideasonboard.com,
 michal.simek@xilinx.com, sumit.semwal@linaro.org, evan.quan@amd.com,
 Hawking.Zhang@amd.com, tianci.yin@amd.com, marek.olsak@amd.com,
 hdegoede@redhat.com, andrey.grodzovsky@amd.com, Felix.Kuehling@amd.com,
 xinhui.pan@amd.com, aaron.liu@amd.com, nirmoy.das@amd.com,
 chris@chris-wilson.co.uk, matthew.auld@intel.com,
 tvrtko.ursulin@linux.intel.com, andi.shyti@intel.com, sam@ravnborg.org,
 miaoqinglang@huawei.com, emil.velikov@collabora.com
References: <20200915145958.19993-1-tzimmermann@suse.de>
 <20200915145958.19993-2-tzimmermann@suse.de>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <835ba167-3576-1af6-5421-552075588796@amd.com>
Date: Tue, 15 Sep 2020 17:05:16 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <20200915145958.19993-2-tzimmermann@suse.de>
Content-Language: en-US
X-ClientProxiedBy: AM4PR0501CA0058.eurprd05.prod.outlook.com
 (2603:10a6:200:68::26) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
 (2a02:908:1252:fb60:be8a:bd56:1f94:86e7) by
 AM4PR0501CA0058.eurprd05.prod.outlook.com (2603:10a6:200:68::26) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3370.16 via Frontend
 Transport; Tue, 15 Sep 2020 15:05:20 +0000
X-Originating-IP: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 1a838726-fffa-4157-c269-08d85988c810
X-MS-TrafficTypeDiagnostic: MN2PR12MB4125:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MN2PR12MB41250AA01CA1B95601DC4CEF83200@MN2PR12MB4125.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:758;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 7GgM4bqO5JcsIWOJL4//UUkwnNJXGNHZKrCDBcRkBJwuojXEgpW/xVeuyAoaF46u0080mwzt2ZsAb7SlPB6HDpijAmcwXMCw93dvH5flZgFFIXoEHx65eyx5ceMm6e6qGOk5uwSTSWrnzBTnYFNCEgvTFMDDnp+EasoXNq1ElrDyVFmbp8PnnuzJeRiq1yYXqcdWbu8Kl1dVJQtspbgKB6KlRlIXXxc+kIf4WAcCYQYmYf+NM6+9AxPsLDTalzcP6epv/M0eTd0cq+sa1jQ8aD0BiMnCM32aQDBXtTLuIjbMdTajQeJ0WR2t4Fvk69jqj3myMJDDTa857l3gKUoG2pa2WJRl05wuaKXWBhlyVHaJGJOPvD0CpIhGZMPYg1ia8eW5a1P10wKcn2DOS9smUL9fp+VohPilgYh0FBoKMQcNDZA+D3FAdO1c244DM+VS
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(396003)(366004)(39860400002)(376002)(346002)(8676002)(16526019)(6666004)(31686004)(316002)(31696002)(52116002)(86362001)(5660300002)(66946007)(2906002)(6486002)(478600001)(8936002)(66476007)(66556008)(4326008)(1191002)(186003)(7406005)(2616005)(36756003)(7366002)(7416002)(66574015)(83380400001)(921003)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: 64GigJExS88f6Sc/sZN+EAOYkB3JVxzWEXWUv/xT9N4/NxYk06hvG3FZ9dvkYiVEyf4M+krJrNQ0SHQuHDRdOXdZRHOHj+fOrClXsn2mwqa2alfLJ25CHBdPcqfG3WCUZECWSgjlthDvGqlEpw1HToJUL0O/5ND2eZ8PHU9rdSHA0pKAesLEbr2TqXukA3sTDzllVlbCEj9zAWLgj0LcB2wrqbKu8LOTaZY56FwJvVVf/v7qBnX8390lkX587slVuXoN5/kliWDEMJ9k1obTeSbuFASAZuXvkWeZucKvvj1UnuQ4Kddgn90u8njC8ABejQN2Bj/KWiQl3xGpXgGOChjNHMvVQzHyMkN3WpYTAPpbfcaSl6CFGkquFcAiDk2+otmg3c7I//Dhwo8/Mwz3dRfeqgvDlLweqf92zTEbyPE8dlaPMj2ZyPDB5Tx8UjNgWyva78w2Ikjp3X5rlJMvv7xbmJCpw/RQQNXAW06GEiEZUTtcf2Ju8j4UnSR1nDODqrmAlKBhmuCoWK7uLt4mliEzUzdmWBlYADbPOT1SOFpFActK8lPxhO/gj54j9lKEquLbIdUR8xcWWiQaECKrUi1pKTsPoaabK1A7yIom1CAw+e7FUXPHFYqX014dhNTMduCxAzdzfR3n3mTpPDVV1bQDsBgV/1+7Y8xvF7z4LPFdqezMF64JeiD/VbsQriXRxxdWfkjM1TzrN1KuEyM7uQ==
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1a838726-fffa-4157-c269-08d85988c810
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Sep 2020 15:05:28.6777 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Xdj71nAlM95T5fuk70sjB5LBFvFYtCngbb20CQ4yyHoA22s1l11i0QYZ1aTJh0WE
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4125
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
Cc: linux-samsung-soc@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 intel-gfx@lists.freedesktop.org, etnaviv@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-rockchip@lists.infradead.org,
 linux-mediatek@lists.infradead.org, amd-gfx@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, linux-tegra@vger.kernel.org,
 xen-devel@lists.xenproject.org, freedreno@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QW0gMTUuMDkuMjAgdW0gMTY6NTkgc2NocmllYiBUaG9tYXMgWmltbWVybWFubjoKPiBHRU0gb2Jq
ZWN0IGZ1bmN0aW9ucyBkZXByZWNhdGUgc2V2ZXJhbCBzaW1pbGFyIGNhbGxiYWNrIGludGVyZmFj
ZXMgaW4KPiBzdHJ1Y3QgZHJtX2RyaXZlci4gVGhpcyBwYXRjaCByZXBsYWNlcyB0aGUgcGVyLWRy
aXZlciBjYWxsYmFja3Mgd2l0aAo+IHBlci1pbnN0YW5jZSBjYWxsYmFja3MgaW4gYW1kZ3B1LiBU
aGUgb25seSBleGNlcHRpb24gaXMgZ2VtX3ByaW1lX21tYXAsCj4gd2hpY2ggaXMgbm9uLXRyaXZp
YWwgdG8gY29udmVydC4KPgo+IHYyOgo+IAkqIG1vdmUgb2JqZWN0LWZ1bmN0aW9uIGluc3RhbmNl
IHRvIGFtZGdwdV9nZW0uYyAoQ2hyaXN0aWFuKQo+IAkqIHNldCBjYWxsYmFja3MgaW4gYW1kZ3B1
X2dlbV9vYmplY3RfY3JlYXRlKCkgKENocmlzdGlhbikKPgo+IFNpZ25lZC1vZmYtYnk6IFRob21h
cyBaaW1tZXJtYW5uIDx0emltbWVybWFubkBzdXNlLmRlPgo+IC0tLQo+ICAgZHJpdmVycy9ncHUv
ZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2Rydi5jICAgIHwgIDYgLS0tLS0tCj4gICBkcml2ZXJzL2dw
dS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZ2VtLmMgICAgfCAyMyArKysrKysrKysrKysrKysrKy0t
LS0tCj4gICBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZ2VtLmggICAgfCAgNSAt
LS0tLQo+ICAgZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X29iamVjdC5jIHwgIDEg
Kwo+ICAgNCBmaWxlcyBjaGFuZ2VkLCAxOSBpbnNlcnRpb25zKCspLCAxNiBkZWxldGlvbnMoLSkK
Pgo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZHJ2LmMg
Yi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZHJ2LmMKPiBpbmRleCA2ZWRkZTJi
OWU0MDIuLjg0MGNhOGY5YzFlMSAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Ft
ZGdwdS9hbWRncHVfZHJ2LmMKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRn
cHVfZHJ2LmMKPiBAQCAtMTUwNSwxOSArMTUwNSwxMyBAQCBzdGF0aWMgc3RydWN0IGRybV9kcml2
ZXIga21zX2RyaXZlciA9IHsKPiAgIAkubGFzdGNsb3NlID0gYW1kZ3B1X2RyaXZlcl9sYXN0Y2xv
c2Vfa21zLAo+ICAgCS5pcnFfaGFuZGxlciA9IGFtZGdwdV9pcnFfaGFuZGxlciwKPiAgIAkuaW9j
dGxzID0gYW1kZ3B1X2lvY3Rsc19rbXMsCj4gLQkuZ2VtX2ZyZWVfb2JqZWN0X3VubG9ja2VkID0g
YW1kZ3B1X2dlbV9vYmplY3RfZnJlZSwKPiAtCS5nZW1fb3Blbl9vYmplY3QgPSBhbWRncHVfZ2Vt
X29iamVjdF9vcGVuLAo+IC0JLmdlbV9jbG9zZV9vYmplY3QgPSBhbWRncHVfZ2VtX29iamVjdF9j
bG9zZSwKPiAgIAkuZHVtYl9jcmVhdGUgPSBhbWRncHVfbW9kZV9kdW1iX2NyZWF0ZSwKPiAgIAku
ZHVtYl9tYXBfb2Zmc2V0ID0gYW1kZ3B1X21vZGVfZHVtYl9tbWFwLAo+ICAgCS5mb3BzID0gJmFt
ZGdwdV9kcml2ZXJfa21zX2ZvcHMsCj4gICAKPiAgIAkucHJpbWVfaGFuZGxlX3RvX2ZkID0gZHJt
X2dlbV9wcmltZV9oYW5kbGVfdG9fZmQsCj4gICAJLnByaW1lX2ZkX3RvX2hhbmRsZSA9IGRybV9n
ZW1fcHJpbWVfZmRfdG9faGFuZGxlLAo+IC0JLmdlbV9wcmltZV9leHBvcnQgPSBhbWRncHVfZ2Vt
X3ByaW1lX2V4cG9ydCwKPiAgIAkuZ2VtX3ByaW1lX2ltcG9ydCA9IGFtZGdwdV9nZW1fcHJpbWVf
aW1wb3J0LAo+IC0JLmdlbV9wcmltZV92bWFwID0gYW1kZ3B1X2dlbV9wcmltZV92bWFwLAo+IC0J
LmdlbV9wcmltZV92dW5tYXAgPSBhbWRncHVfZ2VtX3ByaW1lX3Z1bm1hcCwKPiAgIAkuZ2VtX3By
aW1lX21tYXAgPSBhbWRncHVfZ2VtX3ByaW1lX21tYXAsCj4gICAKPiAgIAkubmFtZSA9IERSSVZF
Ul9OQU1FLAo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVf
Z2VtLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZ2VtLmMKPiBpbmRleCBh
YTdmMjMwYzcxYmYuLmFlZWNkNWRjM2NlNCAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0v
YW1kL2FtZGdwdS9hbWRncHVfZ2VtLmMKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdw
dS9hbWRncHVfZ2VtLmMKPiBAQCAtMzYsOSArMzYsMTIgQEAKPiAgIAo+ICAgI2luY2x1ZGUgImFt
ZGdwdS5oIgo+ICAgI2luY2x1ZGUgImFtZGdwdV9kaXNwbGF5LmgiCj4gKyNpbmNsdWRlICJhbWRn
cHVfZG1hX2J1Zi5oIgo+ICAgI2luY2x1ZGUgImFtZGdwdV94Z21pLmgiCj4gICAKPiAtdm9pZCBh
bWRncHVfZ2VtX29iamVjdF9mcmVlKHN0cnVjdCBkcm1fZ2VtX29iamVjdCAqZ29iaikKPiArc3Rh
dGljIGNvbnN0IHN0cnVjdCBkcm1fZ2VtX29iamVjdF9mdW5jcyBhbWRncHVfZ2VtX29iamVjdF9m
dW5jczsKPiArCj4gK3N0YXRpYyB2b2lkIGFtZGdwdV9nZW1fb2JqZWN0X2ZyZWUoc3RydWN0IGRy
bV9nZW1fb2JqZWN0ICpnb2JqKQo+ICAgewo+ICAgCXN0cnVjdCBhbWRncHVfYm8gKnJvYmogPSBn
ZW1fdG9fYW1kZ3B1X2JvKGdvYmopOwo+ICAgCj4gQEAgLTg3LDYgKzkwLDcgQEAgaW50IGFtZGdw
dV9nZW1fb2JqZWN0X2NyZWF0ZShzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldiwgdW5zaWduZWQg
bG9uZyBzaXplLAo+ICAgCQlyZXR1cm4gcjsKPiAgIAl9Cj4gICAJKm9iaiA9ICZiby0+dGJvLmJh
c2U7Cj4gKwkoKm9iaiktPmZ1bmNzID0gJmFtZGdwdV9nZW1fb2JqZWN0X2Z1bmNzOwo+ICAgCj4g
ICAJcmV0dXJuIDA7Cj4gICB9Cj4gQEAgLTExOSw4ICsxMjMsOCBAQCB2b2lkIGFtZGdwdV9nZW1f
Zm9yY2VfcmVsZWFzZShzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldikKPiAgICAqIENhbGwgZnJv
bSBkcm1fZ2VtX2hhbmRsZV9jcmVhdGUgd2hpY2ggYXBwZWFyIGluIGJvdGggbmV3IGFuZCBvcGVu
IGlvY3RsCj4gICAgKiBjYXNlLgo+ICAgICovCj4gLWludCBhbWRncHVfZ2VtX29iamVjdF9vcGVu
KHN0cnVjdCBkcm1fZ2VtX29iamVjdCAqb2JqLAo+IC0JCQkgICBzdHJ1Y3QgZHJtX2ZpbGUgKmZp
bGVfcHJpdikKPiArc3RhdGljIGludCBhbWRncHVfZ2VtX29iamVjdF9vcGVuKHN0cnVjdCBkcm1f
Z2VtX29iamVjdCAqb2JqLAo+ICsJCQkJICBzdHJ1Y3QgZHJtX2ZpbGUgKmZpbGVfcHJpdikKPiAg
IHsKPiAgIAlzdHJ1Y3QgYW1kZ3B1X2JvICphYm8gPSBnZW1fdG9fYW1kZ3B1X2JvKG9iaik7Cj4g
ICAJc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYgPSBhbWRncHVfdHRtX2FkZXYoYWJvLT50Ym8u
YmRldik7Cj4gQEAgLTE1Miw4ICsxNTYsOCBAQCBpbnQgYW1kZ3B1X2dlbV9vYmplY3Rfb3Blbihz
dHJ1Y3QgZHJtX2dlbV9vYmplY3QgKm9iaiwKPiAgIAlyZXR1cm4gMDsKPiAgIH0KPiAgIAo+IC12
b2lkIGFtZGdwdV9nZW1fb2JqZWN0X2Nsb3NlKHN0cnVjdCBkcm1fZ2VtX29iamVjdCAqb2JqLAo+
IC0JCQkgICAgIHN0cnVjdCBkcm1fZmlsZSAqZmlsZV9wcml2KQo+ICtzdGF0aWMgdm9pZCBhbWRn
cHVfZ2VtX29iamVjdF9jbG9zZShzdHJ1Y3QgZHJtX2dlbV9vYmplY3QgKm9iaiwKPiArCQkJCSAg
ICBzdHJ1Y3QgZHJtX2ZpbGUgKmZpbGVfcHJpdikKPiAgIHsKPiAgIAlzdHJ1Y3QgYW1kZ3B1X2Jv
ICpibyA9IGdlbV90b19hbWRncHVfYm8ob2JqKTsKPiAgIAlzdHJ1Y3QgYW1kZ3B1X2RldmljZSAq
YWRldiA9IGFtZGdwdV90dG1fYWRldihiby0+dGJvLmJkZXYpOwo+IEBAIC0yMTEsNiArMjE1LDE1
IEBAIHZvaWQgYW1kZ3B1X2dlbV9vYmplY3RfY2xvc2Uoc3RydWN0IGRybV9nZW1fb2JqZWN0ICpv
YmosCj4gICAJdHRtX2V1X2JhY2tvZmZfcmVzZXJ2YXRpb24oJnRpY2tldCwgJmxpc3QpOwo+ICAg
fQo+ICAgCj4gK3N0YXRpYyBjb25zdCBzdHJ1Y3QgZHJtX2dlbV9vYmplY3RfZnVuY3MgYW1kZ3B1
X2dlbV9vYmplY3RfZnVuY3MgPSB7Cj4gKwkuZnJlZSA9IGFtZGdwdV9nZW1fb2JqZWN0X2ZyZWUs
Cj4gKwkub3BlbiA9IGFtZGdwdV9nZW1fb2JqZWN0X29wZW4sCj4gKwkuY2xvc2UgPSBhbWRncHVf
Z2VtX29iamVjdF9jbG9zZSwKPiArCS5leHBvcnQgPSBhbWRncHVfZ2VtX3ByaW1lX2V4cG9ydCwK
PiArCS52bWFwID0gYW1kZ3B1X2dlbV9wcmltZV92bWFwLAo+ICsJLnZ1bm1hcCA9IGFtZGdwdV9n
ZW1fcHJpbWVfdnVubWFwLAo+ICt9Owo+ICsKPiAgIC8qCj4gICAgKiBHRU0gaW9jdGxzLgo+ICAg
ICovCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9nZW0u
aCBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9nZW0uaAo+IGluZGV4IGUwZjAy
NWRkMWIxNC4uNjM3YmY1MWRiZjA2IDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQv
YW1kZ3B1L2FtZGdwdV9nZW0uaAo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2Ft
ZGdwdV9nZW0uaAo+IEBAIC0zMywxMSArMzMsNiBAQAo+ICAgI2RlZmluZSBBTURHUFVfR0VNX0RP
TUFJTl9NQVgJCTB4Mwo+ICAgI2RlZmluZSBnZW1fdG9fYW1kZ3B1X2JvKGdvYmopIGNvbnRhaW5l
cl9vZigoZ29iaiksIHN0cnVjdCBhbWRncHVfYm8sIHRiby5iYXNlKQo+ICAgCj4gLXZvaWQgYW1k
Z3B1X2dlbV9vYmplY3RfZnJlZShzdHJ1Y3QgZHJtX2dlbV9vYmplY3QgKm9iaik7Cj4gLWludCBh
bWRncHVfZ2VtX29iamVjdF9vcGVuKHN0cnVjdCBkcm1fZ2VtX29iamVjdCAqb2JqLAo+IC0JCQkJ
c3RydWN0IGRybV9maWxlICpmaWxlX3ByaXYpOwo+IC12b2lkIGFtZGdwdV9nZW1fb2JqZWN0X2Ns
b3NlKHN0cnVjdCBkcm1fZ2VtX29iamVjdCAqb2JqLAo+IC0JCQkJc3RydWN0IGRybV9maWxlICpm
aWxlX3ByaXYpOwo+ICAgdW5zaWduZWQgbG9uZyBhbWRncHVfZ2VtX3RpbWVvdXQodWludDY0X3Qg
dGltZW91dF9ucyk7Cj4gICAKPiAgIC8qCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9h
bWQvYW1kZ3B1L2FtZGdwdV9vYmplY3QuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2Ft
ZGdwdV9vYmplY3QuYwo+IGluZGV4IGFjMDQzYmFhYzA1ZC4uYzRlODJhOGZhNTNmIDEwMDY0NAo+
IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9vYmplY3QuYwo+ICsrKyBi
L2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9vYmplY3QuYwo+IEBAIC01NjEsNiAr
NTYxLDcgQEAgc3RhdGljIGludCBhbWRncHVfYm9fZG9fY3JlYXRlKHN0cnVjdCBhbWRncHVfZGV2
aWNlICphZGV2LAo+ICAgCWJvID0ga3phbGxvYyhzaXplb2Yoc3RydWN0IGFtZGdwdV9ibyksIEdG
UF9LRVJORUwpOwo+ICAgCWlmIChibyA9PSBOVUxMKQo+ICAgCQlyZXR1cm4gLUVOT01FTTsKPiAr
CgpUaGUgbmV3bGluZSBpcyBub3QgdW5yZWxhdGVkLgoKQXBhcnQgZnJvbSB0aGF0IHRoZSBwYXRj
aCBpcyBSZXZpZXdlZC1ieTogQ2hyaXN0aWFuIEvDtm5pZyAKPGNocmlzdGlhbi5rb2VuaWdAYW1k
LmNvbT4uCgpCdXQgSSB0aGluayB3ZSBuZWVkIHNvbWUgc21va2UgdGVzdGluZyBvZiBpdC4KCkNo
cmlzdGlhbi4KCj4gICAJZHJtX2dlbV9wcml2YXRlX29iamVjdF9pbml0KGFkZXZfdG9fZHJtKGFk
ZXYpLCAmYm8tPnRiby5iYXNlLCBzaXplKTsKPiAgIAlJTklUX0xJU1RfSEVBRCgmYm8tPnNoYWRv
d19saXN0KTsKPiAgIAliby0+dm1fYm8gPSBOVUxMOwoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxA
bGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxt
YW4vbGlzdGluZm8vZHJpLWRldmVsCg==
