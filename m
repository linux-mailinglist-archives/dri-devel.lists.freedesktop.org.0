Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 595477ABB39
	for <lists+dri-devel@lfdr.de>; Fri, 22 Sep 2023 23:50:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BBFA010E199;
	Fri, 22 Sep 2023 21:50:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CO1PR02CU001.outbound.protection.outlook.com
 (mail-westus2azon11011001.outbound.protection.outlook.com [52.101.47.1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8572110E705;
 Fri, 22 Sep 2023 21:50:42 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VMXT+SV4A5Hsnx8pBQLzEmMXJwdaifoWLa8dMOmNgTx2ZbWwBSRQyz1ttZHjKWcY55GjxqO6sGq9ZGL8c+deMzne2p0Ut3OIucGvYeNpF9+Hb4ao73Xnfgzibfisn7Bv4WVKLxKeILD3b1syyt4+JvYy/tnHt/Z+v6CFStf96qLlQIdl+MFoPR0w0A2NbZqniLKeNvgYZb2VPMzaQ8WMXpiSx4vxiLvt5F4YLxE9RI4TcoyUyNU9VCB46+GnsfYUyYuKy9iFv7422dPn0dqBj7trrTpq0s3XNQRwIBu92PGAH0hzHr3EzzrTchrHHdp0JflibI8ftIJje2Xv/c+ZVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CABVWGXGnqCMBz/f8G6kBXiQne27hJSjf0Yb4XE4TPs=;
 b=eNLOJnBmodAUxCfWtN1FanAM96XM39ak12oj7GgzK8Sx76zxjxyPFfaAJku7YHwrAtJaZJ7RbKroe/Ku/nYeqSQ2FRJQkAZaigbBP+DVZiZicwT6JwSWzrRT31lENXGTcl0jG/9bXmffygzVtV5Iuw2nj6cGLQVsS59priPitV7aT40ZaJZYGE69ZCjBd5jDjNoosLirkB/YwJu7F9em76f/8GcBgBsA2VVCn0xnT2dUPbcRMRN2taOGPUjUHnJmIXYZzhkuR/9KSmCOB1l2SJpZZI9YAGC6DAhpwxR6BnXBumSCc3c9t1WarnazIfwqcpt6sNrOFx4P2WN9gMAdJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vmware.com; dmarc=pass action=none header.from=vmware.com;
 dkim=pass header.d=vmware.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vmware.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CABVWGXGnqCMBz/f8G6kBXiQne27hJSjf0Yb4XE4TPs=;
 b=qP7v+OMUd/WAH7rpvjKlfkq9fQ+5vA9Z0cbNFAZapfYxw6lLkVN/F1kkTH3wONuFSyEBI2VqOmAA4jmG2GJyrd0aT/t8HdP2DAZo2CC+FkBFq+jGndUwvmRIIPgHXznz+MYe7vmtgIKm4wtRKWh9KJVAoKSLnixPCBLJN7W+2Ig=
Received: from IA0PR05MB9832.namprd05.prod.outlook.com (2603:10b6:208:404::6)
 by BLAPR05MB7220.namprd05.prod.outlook.com (2603:10b6:208:284::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6792.28; Fri, 22 Sep
 2023 21:50:39 +0000
Received: from IA0PR05MB9832.namprd05.prod.outlook.com
 ([fe80::4d19:99e0:a7e8:2653]) by IA0PR05MB9832.namprd05.prod.outlook.com
 ([fe80::4d19:99e0:a7e8:2653%7]) with mapi id 15.20.6813.017; Fri, 22 Sep 2023
 21:50:39 +0000
From: Zack Rusin <zackr@vmware.com>
To: "keescook@chromium.org" <keescook@chromium.org>, "airlied@gmail.com"
 <airlied@gmail.com>
Subject: Re: [PATCH 8/9] drm/vmwgfx: Annotate struct vmw_surface_dirty with
 __counted_by
Thread-Topic: [PATCH 8/9] drm/vmwgfx: Annotate struct vmw_surface_dirty with
 __counted_by
Thread-Index: AQHZ7XwoTUuOhoiPIUumAPFu1EBBrLAnYq0A
Date: Fri, 22 Sep 2023 21:50:38 +0000
Message-ID: <14e3506369eeb677d73b68be487cb6f04c4b36d3.camel@vmware.com>
References: <20230922173110.work.084-kees@kernel.org>
 <20230922173216.3823169-8-keescook@chromium.org>
In-Reply-To: <20230922173216.3823169-8-keescook@chromium.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.48.1-0ubuntu1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vmware.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA0PR05MB9832:EE_|BLAPR05MB7220:EE_
x-ms-office365-filtering-correlation-id: 670f6412-7605-44b2-e712-08dbbbb5f5c1
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: TBK8cV6xM7wlsH0GqzLUKr04kH6IJ5IhS8KVYD1hIS2gVvrvSnVcOtyxx4OCwDdUkmj9UU/Oyel0A7TQHMbWFWid3T+WCpTri2Gpp33IRksXsuQ2PQs0/67EwjpipR9Rtv2III0pPihJDVQ4KtHovBhEuDmK0XGkgVlRvhYi54JFMqaasTetLaG7dhSGxZgJWA8NgSz0GW/ULTxs4tRrjicbF5ZdzmXrGqWJH+N5GG390M7Pc/wxWq8foL8YdfW7y7075zyV9abhIBlAPkLizeZi0bBdgpLKx54/TSiM6uZcWwoIya/wcFlwxgvwQYeDYMQ3dWy7h9PgTXXN4Pl9BFP67X6LjbtV9AB0E3xab0hWEzpwIrDEmARpony0lnZy47WJu085MfihTZHadPkcRy9N/BtO6b6XQQnCFdS5dtV2SJEVIHeVbz7MN+dqRNsaqfnS68jlVa/DhienTU7kwmtLqFD6xDWIqXuAJWRbi8CkPgqOLxfhBlfK0lMTs3E1zXKIxjxUmEFZ07+fJiUPaio8Fcl/5HXBArzGsabPQnArBF80yiA76fVdSYhS1skVYrN+S5vqcNTEOGfwb9YX/ivo8LK51XHiT+lVMmtca6PR7NJRc6hbvamdk2a/g3gi7SsikLoJ4eV57j1hy8NhG/W/Xj0JVL7c68CUsXWxtUt8UOk4a37/K8ldlU+0Y1tFZhgDVW5dyLgzF9e+HLQ1VroE6spf9PshYp0nLlXjR68=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA0PR05MB9832.namprd05.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(136003)(346002)(376002)(396003)(366004)(186009)(451199024)(1800799009)(83380400001)(6512007)(71200400001)(2616005)(966005)(41300700001)(26005)(7406005)(5660300002)(2906002)(110136005)(8676002)(66446008)(76116006)(6486002)(54906003)(4326008)(66476007)(316002)(64756008)(66946007)(7416002)(66556008)(8936002)(7366002)(36756003)(86362001)(478600001)(122000001)(38070700005)(6506007)(38100700002)(14143004);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?N2RjVzFVV1lXZEVRVkdhOUplM2xoY1g0dml4TjBXcmpXOVFwZjltTWp4SFJZ?=
 =?utf-8?B?d3ExRkxzN29LK0xva2IvS3ZyaWV4UFpYaGs1TzdVbTVrSWpsOFhHOXlSM0dj?=
 =?utf-8?B?R1BrQW0rL2pSeGl2YXVUUTNUZHJmeVpaWDJSRGc0S1hzK3BiMU1lbW5BT09L?=
 =?utf-8?B?Tk5IUEM2eXRzaVV6eWs2enl0L21Gb1hMS085TUFEZ1hUZW9FaTZCWFpjbmUw?=
 =?utf-8?B?RlhjTlhpdmlySkRHKzh0c3hpQnN3SC9YSkRHMnppTkM5Uko0T1ZaUXN1bjc0?=
 =?utf-8?B?VlF3RVJ4ellSRk4vNFVtNWJYNmZscTl5d0xnVnhpb2lkYkR0aE5DTDRKaytk?=
 =?utf-8?B?KzlweHp3K2VIWWxWc21TTzJPOHRaUWR1SHlNUTl5WEZucVRFTFlIR2dCVTBB?=
 =?utf-8?B?MkVURXBwSEZFQkE3cUJ6THQ4YTZnQmxmMHVlT3pBZ2RHYmJlbmJlNmh6T203?=
 =?utf-8?B?bTRtWkd4YTVDWHRGRGRsU21mT01iQ2s2RUxKL2lEQTR3Y0c3TjhsN0dlcTdx?=
 =?utf-8?B?S211QllOVWpnYkllTDk3Q3REZ2paVTBodVFxeUVDYUxWMHdmYis0Z2ptWCtP?=
 =?utf-8?B?ajNYRzJxSDd2TFBkRmo3Z01FeU1vcTdMZXA0cTQ4YnBDZ2xJMEJoUUVoalpr?=
 =?utf-8?B?Rnh3Uk54bFhsaExQcnhwbXlCdCtQemlnWDJnWUs4TW1HUEgydVFObkYxZlNs?=
 =?utf-8?B?V0l1WXpiM0xiZC9rQTFHSWtQMms4RUFxZ2lyYjVqY25laU9XRXhINWVoL0E0?=
 =?utf-8?B?eGhKQmRTYUhXL1ZaYUxROEdLdW0wbTVZYW1DS0xSZWdLdTZGZFNpR05UaG9o?=
 =?utf-8?B?YUhXNFkzOG8rSnFGUUxraXpZNjFmMWh4K25ubWhMMFZBRUlrU2s1Y2QyVzN3?=
 =?utf-8?B?QzZIVW5BVjdHbU1ZNDYrVUJQbVM1N1VudUp0NU9wWEdKRDZvV01aMGxJelNl?=
 =?utf-8?B?czFrOGNOY3UvaDNlNWxVN1VKQUZWU3dvSFJmYm9sUDlsZmxWUXRjcUt6QzFM?=
 =?utf-8?B?SEJpeTB2OFNnWVZ4WC9mRTRXbVN4NVFpd01WZmpnQ3cvMjNpQm9SSEpCOTFY?=
 =?utf-8?B?VFROMW5EemVRQlJKZFFORVpTb1BrWFJ0SHlMSFlJSWdmTlorMmFrZUpmV21R?=
 =?utf-8?B?Z2hteXZ4bnQzb1grWHNJU0lLbFVJZWVFRzNacGZFejMrT3Q4a0hjK0trQnhL?=
 =?utf-8?B?dS94MFMyakx1cTdOcGhUQ1dESHlZTkhkQUQ2Z09oS3psMGMvOUtsTWdKQXVp?=
 =?utf-8?B?d21LdllFbDZXWDdKcEZpL2dmSEJ6T24yK1d5cG9iWWNlbEQxN2JoRGpuM1M1?=
 =?utf-8?B?NUZnM1VodGo4cnZRcGZ0Umkvc3NSN1AwVmFidkpMZDh4MDJVdGM5bzF6Si9N?=
 =?utf-8?B?Nzd3eWsvMUJmam9HY003Sk11c20rSFRPL1NUVHpEUkVETUdJL2FZR3VqblFU?=
 =?utf-8?B?dVRTa0FWZEZEanAwTjBQYVZpV1VSNWV0Q2ovOVRXWi9MaHNpQkM5QURYTWQr?=
 =?utf-8?B?eVk2M2tBdi8zQkZUcFNyQmdGdTJPUS85ZFRkVGRXR2xLcTVZV0tQUDdvbnA2?=
 =?utf-8?B?WjRScDY1bVp6U0xkL2p5SVhqNG5WYTdwRm85ZERYRnBMT1paS1ZneVdXUXRC?=
 =?utf-8?B?MFYwVHJ2eVAvaUppL0NESmEyUk9Fc1pyaDJKaFJyenFNRHNQZ21WWVZ1SUN2?=
 =?utf-8?B?NzR5cDMvUFpVSnhjem8vRElIcFJDZEo2UUN0ZEhHd3d4SHpCMGlBQjdLTlJh?=
 =?utf-8?B?ajhIV0JWMXJBZlNBUUF6VEQ0Z0NxMkp2UkxlNnpxL0dqOFZXT1VEWFNjaEQ0?=
 =?utf-8?B?QUhaZFhBNWhQaUFlL0xvTGlEUHhia0gxRFkvN05tN0x5UUUxYzRxaWJwQlZt?=
 =?utf-8?B?Q2gwV1UxSUlHQjNQM3VscEN1d0x1WmZtdHZvSzZ0V2NPOUhGcHdKMjBVRFNI?=
 =?utf-8?B?ZGYzZ290RkpjOEVTdHRHR3QyZjM4S0VTd0hQL00ralEyYmJUa0dDWVRjU3Bs?=
 =?utf-8?B?UDhKYWFQNGloSFordFJ4dlNwK0dtWSt5WVNJL2JYZ2VkS2h2QVpHcVJPZ1NQ?=
 =?utf-8?B?VHVGWGU3bEdpbG1nYjVPa2twNVBnaFR0QmJPbyttTjljVE5Vb0dxT1VFZUpQ?=
 =?utf-8?Q?2DBqarSr4o4k6GzaWGrYhtVRp?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <B732D08D5301B247B8565F79ACEBE727@namprd05.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: vmware.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA0PR05MB9832.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 670f6412-7605-44b2-e712-08dbbbb5f5c1
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Sep 2023 21:50:38.9309 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b39138ca-3cee-4b4a-a4d6-cd83d9dd62f0
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: qCjzxkMXE8er3GdugO/gLLXqZVuPoXKuVklmbK7kTgotzbuaiVlxley+cclDioG3kvfnwXq76R/J4aZ3NrXBbw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BLAPR05MB7220
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
Cc: "tejas.upadhyay@intel.com" <tejas.upadhyay@intel.com>,
 "emma@anholt.net" <emma@anholt.net>, "trix@redhat.com" <trix@redhat.com>,
 "llvm@lists.linux.dev" <llvm@lists.linux.dev>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "chris@chris-wilson.co.uk" <chris@chris-wilson.co.uk>,
 "Prike.Liang@amd.com" <Prike.Liang@amd.com>,
 "ray.huang@amd.com" <ray.huang@amd.com>,
 "linux-hardening@vger.kernel.org" <linux-hardening@vger.kernel.org>,
 "andrzej.hajda@intel.com" <andrzej.hajda@intel.com>,
 "marijn.suijten@somainline.org" <marijn.suijten@somainline.org>,
 "matthew.brost@intel.com" <matthew.brost@intel.com>,
 "evan.quan@amd.com" <evan.quan@amd.com>,
 "kherbst@redhat.com" <kherbst@redhat.com>,
 "neil.armstrong@linaro.org" <neil.armstrong@linaro.org>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "quic_khsieh@quicinc.com" <quic_khsieh@quicinc.com>,
 Linux-graphics-maintainer <Linux-graphics-maintainer@vmware.com>,
 "bskeggs@redhat.com" <bskeggs@redhat.com>,
 "andi.shyti@linux.intel.com" <andi.shyti@linux.intel.com>,
 "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>,
 "airlied@redhat.com" <airlied@redhat.com>,
 "alexander.deucher@amd.com" <alexander.deucher@amd.com>,
 "lijo.lazar@amd.com" <lijo.lazar@amd.com>,
 "tvrtko.ursulin@linux.intel.com" <tvrtko.ursulin@linux.intel.com>,
 "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "kevin1.wang@amd.com" <kevin1.wang@amd.com>,
 "quic_abhinavk@quicinc.com" <quic_abhinavk@quicinc.com>,
 "mripard@kernel.org" <mripard@kernel.org>,
 "nathan@kernel.org" <nathan@kernel.org>, "le.ma@amd.com" <le.ma@amd.com>,
 "gurchetansingh@chromium.org" <gurchetansingh@chromium.org>,
 "rodrigo.vivi@intel.com" <rodrigo.vivi@intel.com>,
 "virtualization@lists.linux-foundation.org"
 <virtualization@lists.linux-foundation.org>,
 "sean@poorly.run" <sean@poorly.run>,
 "yifan1.zhang@amd.com" <yifan1.zhang@amd.com>,
 "kraxel@redhat.com" <kraxel@redhat.com>,
 "Xiaojian.Du@amd.com" <Xiaojian.Du@amd.com>,
 "freedreno@lists.freedesktop.org" <freedreno@lists.freedesktop.org>,
 "andersson@kernel.org" <andersson@kernel.org>,
 "Xinhui.Pan@amd.com" <Xinhui.Pan@amd.com>,
 "ndesaulniers@google.com" <ndesaulniers@google.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "mwen@igalia.com" <mwen@igalia.com>,
 "dmitry.baryshkov@linaro.org" <dmitry.baryshkov@linaro.org>,
 "Hawking.Zhang@amd.com" <Hawking.Zhang@amd.com>,
 "Lang.Yu@amd.com" <Lang.Yu@amd.com>,
 "christian.koenig@amd.com" <christian.koenig@amd.com>,
 "john.c.harrison@Intel.com" <john.c.harrison@Intel.com>,
 "nirmoy.das@intel.com" <nirmoy.das@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCAyMDIzLTA5LTIyIGF0IDEwOjMyIC0wNzAwLCBLZWVzIENvb2sgd3JvdGU6DQo+IFBy
ZXBhcmUgZm9yIHRoZSBjb21pbmcgaW1wbGVtZW50YXRpb24gYnkgR0NDIGFuZCBDbGFuZyBvZiB0
aGUgX19jb3VudGVkX2J5DQo+IGF0dHJpYnV0ZS4gRmxleGlibGUgYXJyYXkgbWVtYmVycyBhbm5v
dGF0ZWQgd2l0aCBfX2NvdW50ZWRfYnkgY2FuIGhhdmUNCj4gdGhlaXIgYWNjZXNzZXMgYm91bmRz
LWNoZWNrZWQgYXQgcnVuLXRpbWUgY2hlY2tpbmcgdmlhIENPTkZJR19VQlNBTl9CT1VORFMNCj4g
KGZvciBhcnJheSBpbmRleGluZykgYW5kIENPTkZJR19GT1JUSUZZX1NPVVJDRSAoZm9yIHN0cmNw
eS9tZW1jcHktZmFtaWx5DQo+IGZ1bmN0aW9ucykuDQo+IA0KPiBBcyBmb3VuZCB3aXRoIENvY2Np
bmVsbGVbMV0sIGFkZCBfX2NvdW50ZWRfYnkgZm9yIHN0cnVjdCB2bXdfc3VyZmFjZV9kaXJ0eS4N
Cj4gDQo+IFsxXQ0KPiBodHRwczovL2dpdGh1Yi5jb20va2Vlcy9rZXJuZWwtdG9vbHMvYmxvYi90
cnVuay9jb2NjaW5lbGxlL2V4YW1wbGVzL2NvdW50ZWRfYnkuY29jY2kNCj4gDQo+IENjOiBaYWNr
IFJ1c2luIDx6YWNrckB2bXdhcmUuY29tPg0KPiBDYzogVk13YXJlIEdyYXBoaWNzIFJldmlld2Vy
cyA8bGludXgtZ3JhcGhpY3MtbWFpbnRhaW5lckB2bXdhcmUuY29tPg0KPiBDYzogRGF2aWQgQWly
bGllIDxhaXJsaWVkQGdtYWlsLmNvbT4NCj4gQ2M6IERhbmllbCBWZXR0ZXIgPGRhbmllbEBmZnds
bC5jaD4NCj4gQ2M6IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcNCj4gU2lnbmVkLW9m
Zi1ieTogS2VlcyBDb29rIDxrZWVzY29va0BjaHJvbWl1bS5vcmc+DQo+IC0tLQ0KPiDCoGRyaXZl
cnMvZ3B1L2RybS92bXdnZngvdm13Z2Z4X3N1cmZhY2UuYyB8IDIgKy0NCj4gwqAxIGZpbGUgY2hh
bmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkNCj4gDQo+IGRpZmYgLS1naXQgYS9k
cml2ZXJzL2dwdS9kcm0vdm13Z2Z4L3Ztd2dmeF9zdXJmYWNlLmMNCj4gYi9kcml2ZXJzL2dwdS9k
cm0vdm13Z2Z4L3Ztd2dmeF9zdXJmYWNlLmMNCj4gaW5kZXggNWRiNDAzZWU4MjYxLi4yZDFkODU3
Zjk5YWUgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS92bXdnZngvdm13Z2Z4X3N1cmZh
Y2UuYw0KPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vdm13Z2Z4L3Ztd2dmeF9zdXJmYWNlLmMNCj4g
QEAgLTc3LDcgKzc3LDcgQEAgc3RydWN0IHZtd19zdXJmYWNlX29mZnNldCB7DQo+IMKgc3RydWN0
IHZtd19zdXJmYWNlX2RpcnR5IHsNCj4gwqDCoMKgwqDCoMKgwqDCoHN0cnVjdCB2bXdfc3VyZmFj
ZV9jYWNoZSBjYWNoZTsNCj4gwqDCoMKgwqDCoMKgwqDCoHUzMiBudW1fc3VicmVzOw0KPiAtwqDC
oMKgwqDCoMKgwqBTVkdBM2RCb3ggYm94ZXNbXTsNCj4gK8KgwqDCoMKgwqDCoMKgU1ZHQTNkQm94
IGJveGVzW10gX19jb3VudGVkX2J5KG51bV9zdWJyZXMpOw0KPiDCoH07DQo+IMKgDQo+IMKgc3Rh
dGljIHZvaWQgdm13X3VzZXJfc3VyZmFjZV9mcmVlKHN0cnVjdCB2bXdfcmVzb3VyY2UgKnJlcyk7
DQoNClRoYW5rcyENCg0KUmV2aWV3ZWQtYnk6IFphY2sgUnVzaW4gPHphY2tyQHZtd2FyZS5jb20+
DQo=
