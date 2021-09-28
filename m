Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 06B1A41A9FB
	for <lists+dri-devel@lfdr.de>; Tue, 28 Sep 2021 09:41:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E7CB96E0CF;
	Tue, 28 Sep 2021 07:41:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 565A16E0CF;
 Tue, 28 Sep 2021 07:41:05 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10120"; a="310188209"
X-IronPort-AV: E=Sophos;i="5.85,328,1624345200"; d="scan'208";a="310188209"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Sep 2021 00:41:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.85,328,1624345200"; d="scan'208";a="518907907"
Received: from fmsmsx606.amr.corp.intel.com ([10.18.126.86])
 by fmsmga008.fm.intel.com with ESMTP; 28 Sep 2021 00:41:03 -0700
Received: from fmsmsx608.amr.corp.intel.com (10.18.126.88) by
 fmsmsx606.amr.corp.intel.com (10.18.126.86) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Tue, 28 Sep 2021 00:41:03 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx608.amr.corp.intel.com (10.18.126.88) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Tue, 28 Sep 2021 00:41:02 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12 via Frontend Transport; Tue, 28 Sep 2021 00:41:02 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.105)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2242.12; Tue, 28 Sep 2021 00:41:02 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YyeF4qK3fvBNutbFya96N97mndPGKBHiIaKoPKulKXHqYEKxl1xGIQExxpanyA2Cw1SBzS1zR1KMsRiNWpAKgdiJC1sYDqzYIE6FngGnbRk8jgydzllknNWQKcBK++3VeAvJNHuEq9qe+5Pe8Ma+TA/tNu9PUIe5GRMYFXAqQ8v2k2duLCL0TjDHC+MBfW0q5gE1CQoLtdmH2qlOpQReSEuo+LA2TJmgk3OClKDWE5H80sL7TK7d0hGq5L1GAVn9n5tWrOZf3o8jyzN8v6bNp7CU1wXCjT+8cjDAJ5qj0kFcHaGfbSPeBsgdLIaBlqE7pYO0SJHWYlvmnMgdEtyrow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=az2lBHtyjboI/l0UHgIi98+LRvrQ8QAekzKXmPRx0Eg=;
 b=aHP7Y/NqHRYwC4GoTL2w/TZuVqQI2NtNXXAFZstwUbVaKgrlFFs+erQysKur2mfpyMt+rvnLJEpu4OAL64e9XMC25SQxAEQQGWmzHJy+LC/+9WB8HCnaLmPaTu9oM9S4Q4Uzp1G/J7Sg/o/b+t08crWTCoUxHFOq0mGk+D8f01RUQKSenIjjpS0zFcvIHUAEuvY8F0lIJcaNtQ7MpJVGoQ3Fmqo8ohvc3GmWJnCWDKhyPqcHaH9ES1I0VB6gIBGrGP6SsluqhnyN2R0ZLmZHkfwt6wy6T31dDwbFKTNpWeHAKyn/5oKh+c6a2ZZMcnOrzguAo1fXY/ZEYxuA0Sm/zA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=az2lBHtyjboI/l0UHgIi98+LRvrQ8QAekzKXmPRx0Eg=;
 b=a0E08fp70Jor3Q4JbiyEqdN2WRZLMlxuMACEIzTKRRE2MnCSF/4rvpkpzmoCtona1+mMgOw1OHIRZKyDuxl8dm1ZMHMr/7u7ueX8KfqBQ9CjRGBCF6ZI6MYMq6TTCAgHlBReMfA/IBd00JBww2xJjTQmj35cECjLKrP6kgVz1WM=
Received: from DM4PR11MB5549.namprd11.prod.outlook.com (2603:10b6:5:388::7) by
 DM6PR11MB4443.namprd11.prod.outlook.com (2603:10b6:5:14d::27) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4523.18; Tue, 28 Sep 2021 07:41:00 +0000
Received: from DM4PR11MB5549.namprd11.prod.outlook.com
 ([fe80::2db5:86a8:9c6f:3a1d]) by DM4PR11MB5549.namprd11.prod.outlook.com
 ([fe80::2db5:86a8:9c6f:3a1d%3]) with mapi id 15.20.4566.013; Tue, 28 Sep 2021
 07:41:00 +0000
From: "Wang, Zhi A" <zhi.a.wang@intel.com>
To: Zhenyu Wang <zhenyuw@linux.intel.com>, Luis Chamberlain <mcgrof@kernel.org>
CC: Christoph Hellwig <hch@lst.de>, Jason Gunthorpe <jgg@nvidia.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, Greg KH
 <gregkh@linuxfoundation.org>, "intel-gfx@lists.freedesktop.org"
 <intel-gfx@lists.freedesktop.org>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, Jani Nikula <jani.nikula@linux.intel.com>,
 Gerd Hoffmann <kraxel@redhat.com>, "Vivi, Rodrigo" <rodrigo.vivi@intel.com>,
 "intel-gvt-dev@lists.freedesktop.org" <intel-gvt-dev@lists.freedesktop.org>,
 "Nikula, Jani" <jani.nikula@intel.com>
Subject: Re: refactor the i915 GVT support
Thread-Topic: refactor the i915 GVT support
Thread-Index: AQHXfkkPR74j3PcQBUqzVfBaHB7ETatOyPlwgAATUQCAB+h0AIABoDZQgABTFICAAN/IAIAIA5SAgABQYwCAAPoZAIATp54AgAB+0YCAAEa+gIADWQiAgAHzigCAAF7DAIAIh7KAgDP1tYA=
Date: Tue, 28 Sep 2021 07:41:00 +0000
Message-ID: <55c11f22-99e5-6109-3be3-a04b06b3336e@intel.com>
References: <20210729072022.GB31896@lst.de>
 <20210803094315.GF13928@zhen-hp.sh.intel.com>
 <20210803143058.GA1721383@nvidia.com>
 <20210804052606.GG13928@zhen-hp.sh.intel.com> <20210816173458.GA9183@lst.de>
 <20210817010851.GW13928@zhen-hp.sh.intel.com>
 <20210817052203.GX13928@zhen-hp.sh.intel.com>
 <20210819082929.GB13928@zhen-hp.sh.intel.com> <20210820141724.GA29034@lst.de>
 <YSAI8pKAvvW/8S2O@bombadil.infradead.org>
 <20210826061219.GD9942@zhen-hp.sh.intel.com>
In-Reply-To: <20210826061219.GD9942@zhen-hp.sh.intel.com>
Accept-Language: en-FI, en-US
Content-Language: aa
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
authentication-results: linux.intel.com; dkim=none (message not signed)
 header.d=none;linux.intel.com; dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 4bccb068-02bc-4359-eedd-08d982535122
x-ms-traffictypediagnostic: DM6PR11MB4443:
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM6PR11MB44439EEC969C6C8D2722F873CAA89@DM6PR11MB4443.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7219;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Ey0mS1vn/HL1wZSSLOUi5FpGRjssOQTijB6DcAx4AqqVGWvGLQwKWsZMPsxEN+rVIYuTe8N0Tsz5woMpLdOonZkbFSipMmq1tMNYDKQhTJH1DNg69rwedSgSjAaIMHFW6XY7cbOBrRiaiogS/1WJ3zHXfgcyxtdQZ992ZUiZSqlGca1H/4CHBd9xLwZGyBafZrNHaP/Dnhklt2M/J7AvNZMVa5WeO9f8x7hTwAHxT1y0+QK0z+gzGmJw+R2PcKUC2hiTFw+MpGKBMaVLw3KXou8e+Pn3cJiLB2sMolWJnKauwFu+Gms6uvo8O4wOmTWZStoT/iXl6vfuqBSYhuvRtalAtdzcxsf3H3ab5BspcC4ud8nUCkNovw1i262D0LTi7qW079rWslRZjfUM2am//n/UI5qakKdB2rcQOpgWn9nLLgOXq2hfBM9ASr8sVwQ43vTqIRzSA52SKMT6Frid6MqcAKpTryAfLHELN5g++qhpPEsiZzURJhE8f8HAnYgiXnfdRu6kb0Mdiwiuc/cbq3D9KXw3QLINAMvtiP7E3KZJXjlgOzicbuExntJ8ziOwFv9VMX8AvOnsmbAlezA/3sY/SrrI0z9DCojg3IhGhCqxy/x5ycp2V1cLy+u+0J8ABBxCJYmxMrVJ+F80ZZCdASL4q3eE5tJ4MFPFGm5hT7acRJWDkFyi0RSuTMVT/vtxVuuKrXrk7XqnVftGOSahBT5ytSvf9TZl3I1GJaM76Cr0ANpaHRIL8p2q6v+NIddHEdB1iipTPH9CmAF13PJ04UiYvg8qu3DT2xiRLHd/e/N0YvMXQw0ghg/FPpma++8y2Awe7qHoqkMy1g7f/KgjF6SzVzU2hZGIGWNZdRqa1F0YR9EdBrim8NnuS52KT7KlBLSu9mgqK+juPMFrVfauBA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5549.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(86362001)(71200400001)(53546011)(122000001)(8676002)(2616005)(54906003)(91956017)(2906002)(66946007)(4326008)(38070700005)(8936002)(110136005)(83380400001)(5660300002)(31686004)(186003)(66446008)(508600001)(316002)(31696002)(6486002)(38100700002)(36756003)(66476007)(6512007)(64756008)(966005)(7416002)(66556008)(26005)(6506007)(76116006)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?Windows-1252?Q?ggiB81/MIPg6r5JqcbApDmoof6kOqeYNuRTCvk0IuVMO9ns7YT965TT7?=
 =?Windows-1252?Q?MXjil72Lpd/gm4z3fs25fur/rr7Q7t0qoBRzuNRWWrZL1GVscM3HTOUd?=
 =?Windows-1252?Q?9LpnSYmJBpMEqt7XdK0lLbE3c76rrap02MsiqezBAem6Ijf7set+8t4C?=
 =?Windows-1252?Q?m6lblWtf+mEUsIRZRs33pUoD8RIQac7BwGdcKxnl5pukKAD0Ndw6894T?=
 =?Windows-1252?Q?SgPNsYbeh6XakOXt8z7edCiv20VF23cVY1WQs4l3GH5wQYomHANcBpAJ?=
 =?Windows-1252?Q?6YKRsSRX7Pwh0mhffBNSBL9G7Wlo+btX1plRFUUQEd+JWS9S2YBlzwDm?=
 =?Windows-1252?Q?I1d33R73ty6KdoZNzfV25unsdlVRXGmjn2TSttbblMdBCyP4ZmB9KzkH?=
 =?Windows-1252?Q?Ip/AVdxMr36YjH7UBNHtFLdjKPQMQJB7QUg22QYfgcpjKX48j93KrAaZ?=
 =?Windows-1252?Q?VNpfU1hBK4XI1EUsliTSfEt7bPktnMAEn2AX2s11WjiBxwpDF4niv1Xm?=
 =?Windows-1252?Q?a5OH6lYQU+0Vw2hOAesA6NxyaLho2xyDLMpnZvnDrU4dxbqh/znxy6W2?=
 =?Windows-1252?Q?o8TAOhb987c6+koQOtNfOlFsfKQZ9Bf8YXmRRsNmT1eNhG42CcyjJAl/?=
 =?Windows-1252?Q?wFxOl00iVe/q7u+k34oUiSL6vGsQLy2XRNzgpsTIpJUxYCvF1ilY7GHm?=
 =?Windows-1252?Q?fFXmDisfSSVKXGlF6DrJpoWEYU2q+tLP5yL2T3U6oS5JacV0pB+jQnTJ?=
 =?Windows-1252?Q?Qu7yUlBwo5h3PNdK8k/+thMHcx50iBHapoT5nlC9UjNbb0ewWxt/3avw?=
 =?Windows-1252?Q?zgmEHb4xr/aoq/08UrR0/ioR/TRKYLff8dJ7mvznh7dT5lLGepv+o9bV?=
 =?Windows-1252?Q?q2JwBPP/PkJTW08joVbTVSaEZijqFvxCzB0BXH8KT/YSnGSXFjbF3M4K?=
 =?Windows-1252?Q?NaXxMKWus6JwriybdH7rDtLZVmxLoVWCOR/g9eWTqzO4XuByTJO/Pgxs?=
 =?Windows-1252?Q?PzFJ2UnDPGP3qL/foDH4OeUhQOTJ+rQbV6YVShhNGpBrrvHfatPK/aeg?=
 =?Windows-1252?Q?106EAAQYTVjeDjDlmVYQ4L66l4zj6dI2sMXmSntZmxlVshmNR1rIG6nf?=
 =?Windows-1252?Q?WeauoeTyncGNh5iw69Ui9qI8g02NpnNofGZZHVCc9w3unV1EejVVt5m8?=
 =?Windows-1252?Q?mBaiVnQOQzOx8jgIgYh73bLQMJDKt5Xdq5Al+Vw0/tm0XTpQXkEvf13v?=
 =?Windows-1252?Q?DijAlKlbKaHc4zRFaYApLqzKS2tm0bB0m+hJH4VQJbcmaZhDQSTt7OIR?=
 =?Windows-1252?Q?MlrorJ5xVaZrUH84zU/eb/0wCBSoidaEAqCvniEcWCiY/qgo/28miSIH?=
 =?Windows-1252?Q?0l9p9nSp9zh+FA/cDFPu68dbg1+S8JGI+8GnUTCR0mQSjpGl73KlbMO3?=
Content-Type: text/plain; charset="Windows-1252"
Content-ID: <D493D29BDF215A418885A33A1BBAA3E9@namprd11.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5549.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4bccb068-02bc-4359-eedd-08d982535122
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Sep 2021 07:41:00.3989 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: NbWbxEOQISKdi98zyyh6E+UMYRtAx/6THh3pr4NNdxTBJxJiSnvNKcVRQyYTf4DX+BafUrrrJm85rOW3uOAQdQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4443
X-OriginatorOrg: intel.com
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hey guys:

After some investigation, I found the root cause this problem ("i915"=20
module loading will be stuck with Christoph's refactor patches), which=20
can be reproduced by building both i915 and kvmgt as kernel module and=20
the loading i915.

The root cause is: in Linux kernel loading, before a kernel module=20
loading is finished, its symbols can not be reached by other module when=20
resolving the symbols (even they can be found in /proc/kallsyms).=20
Because the status of the kernel module is MODULE_STATE_COMING and=20
resolve_symbol() from another kernel module will check this and return a=20
-EBUSY.

In this case, before i915 loading is finished, the requested module=20
"kvmgt" cannot reach the symbols in module i915. Thus it kept waiting=20
and left message like below in the dmesg:

[=A0 644.152021] kvmgt: gave up waiting for init of module i915.
[=A0 644.152039] kvmgt: Unknown symbol i915_gem_object_set_to_cpu_domain=20
(err -16)
[=A0 674.871409] kvmgt: gave up waiting for init of module i915.
[=A0 674.871427] kvmgt: Unknown symbol intel_ring_begin (err -16)
[=A0 705.590586] kvmgt: gave up waiting for init of module i915.
[=A0 705.590604] kvmgt: Unknown symbol i915_vma_move_to_active (err -16)
[=A0 736.310230] kvmgt: gave up waiting for init of module i915.
[=A0 736.310248] kvmgt: Unknown symbol shmem_unpin_map (err -16)
...

The error message is from execution path below:

kernel/module.c:

[i915 module loading] ->=20
request_module("kvmgt")->[modprobe]->init_module("kvmgt")->load_module()->s=
implify_symbols()->resolve_symbol_wait():

static const struct kernel_symbol *
resolve_symbol_wait(struct module *mod,
 =A0=A0=A0 =A0=A0=A0 =A0=A0=A0 const struct load_info *info,
 =A0=A0=A0 =A0=A0=A0 =A0=A0=A0 const char *name)
{
 =A0=A0=A0 const struct kernel_symbol *ksym;
 =A0=A0=A0 char owner[MODULE_NAME_LEN];

 =A0=A0=A0 if (wait_event_interruptible_timeout(module_wq,
 =A0=A0=A0 =A0=A0=A0 =A0=A0=A0 !IS_ERR(ksym =3D resolve_symbol(mod, info, n=
ame, owner))
 =A0=A0=A0 =A0=A0=A0 =A0=A0=A0 || PTR_ERR(ksym) !=3D -EBUSY,
 =A0=A0=A0 =A0=A0=A0 =A0=A0=A0 =A0=A0=A0 =A0=A0=A0 =A0=A0=A0=A0 30 * HZ) <=
=3D 0) {
 =A0=A0=A0 =A0=A0=A0 pr_warn("%s: gave up waiting for init of module %s.\n"=
,
 =A0=A0=A0 =A0=A0=A0 =A0=A0=A0 mod->name, owner);

}

code:=20
https://github.com/intel/gvt-linux/blob/bd950a66c7919d7121d2530f30984351534=
a96dc/kernel/module.c#L1452

In resolve_symbol_wait(), it calls resolve_symbol() to resolve the=20
symbols in "i915". In resolve_symbol() -> ref_module() ->=20
strong_try_module_get(), it will check the status of the module which=20
owns the symbol.

static inline int strong_try_module_get(struct module *mod)
{
 =A0=A0=A0 BUG_ON(mod && mod->state =3D=3D MODULE_STATE_UNFORMED);
 =A0=A0=A0 if (mod && mod->state =3D=3D MODULE_STATE_COMING)
 =A0=A0=A0 =A0=A0=A0 return -EBUSY;
 =A0=A0=A0 if (try_module_get(mod))
 =A0=A0=A0 =A0=A0=A0 return 0;
 =A0=A0=A0 else
 =A0=A0=A0 =A0=A0=A0 return -ENOENT;
}

code:https://github.com/intel/gvt-linux/blob/bd950a66c7919d7121d2530f309843=
51534a96dc/kernel/module.c#L318

But unfortunately, this execution path begins in i915 module loading, at=20
this time, the status of kernel module "i915" is MODULE_STATE_COMING=20
until loading of "kvmgt" is finished. Thus a -EBUSY is always returned=20
when kernel is trying to resolve symbols for "kvmgt".

This patch below might need re-work:

Author: Christoph Hellwig <hch@lst.de>
Date:=A0=A0 Wed Jul 21 17:53:38 2021 +0200

 =A0=A0=A0 drm/i915/gvt: move the gvt code into kvmgt.ko

 =A0=A0=A0 Instead of having an option to build the gvt code into the main =
i915
 =A0=A0=A0 module, just move it into the kvmgt.ko module.=A0 This only requ=
ires
 =A0=A0=A0 a new struct with three entries that the main i915 module needs =
to
 =A0=A0=A0 request before enabling VGPU passthrough operations.

 =A0=A0=A0 This also conveniently streamlines the GVT initialization and av=
oids
 =A0=A0=A0 the need for the global device pointer.

 =A0=A0=A0 Signed-off-by: Christoph Hellwig <hch@lst.de>
 =A0=A0=A0 Signed-off-by: Zhenyu Wang <zhenyuw@linux.intel.com>
 =A0=A0=A0 Link:=20
http://patchwork.freedesktop.org/patch/msgid/20210721155355.173183-5-hch@ls=
t.de
 =A0=A0=A0 Acked-by: Zhenyu Wang <zhenyuw@linux.intel.com>

On 8/26/21 6:12 AM, Zhenyu Wang wrote:
> On 2021.08.20 12:56:34 -0700, Luis Chamberlain wrote:
>> On Fri, Aug 20, 2021 at 04:17:24PM +0200, Christoph Hellwig wrote:
>>> On Thu, Aug 19, 2021 at 04:29:29PM +0800, Zhenyu Wang wrote:
>>>> I'm working on below patch to resolve this. But I met a weird issue in
>>>> case when building i915 as module and also kvmgt module, it caused
>>>> busy wait on request_module("kvmgt") when boot, it doesn't happen if
>>>> building i915 into kernel. I'm not sure what could be the reason?
>>> Luis, do you know if there is a problem with a request_module from
>>> a driver ->probe routine that is probably called by a module_init
>>> function itself?
>> Generally no, but you can easily foot yourself in the feet by creating
>> cross dependencies and not dealing with them properly. I'd make sure
>> to keep module initialization as simple as possible, and run whatever
>> takes more time asynchronously, then use a state machine to allow
>> you to verify where you are in the initialization phase or query it
>> or wait for a completion with a timeout.
>>
>> It seems the code in question is getting some spring cleaning, and its
>> unclear where the code is I can inspect. If there's a tree somewhere I
>> can take a peak I'd be happy to review possible oddities that may stick
>> out.
> I tried to put current patches under test here: https://github.com/intel/=
gvt-linux/tree/gvt-staging
> The issue can be produced with CONFIG_DRM_I915=3Dm and CONFIG_DRM_I915_GV=
T_KVMGT=3Dm.
>
>> My goto model for these sorts of problems is to abstract the issue
>> *outside* of the driver in question and implement new selftests to
>> try to reproduce. This serves two purposes, 1) helps with testing
>> 2) may allow you to see the problem more clearly.
>>
> I'll see if can abstract that.
>
> Thanks, Luis.


