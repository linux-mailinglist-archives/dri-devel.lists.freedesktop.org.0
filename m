Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 11CE078B9F3
	for <lists+dri-devel@lfdr.de>; Mon, 28 Aug 2023 23:06:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7268510E359;
	Mon, 28 Aug 2023 21:06:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B66310E35D;
 Mon, 28 Aug 2023 21:06:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1693256805; x=1724792805;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=cJOoBJ15b1TRMk7GlkxrRlmjcSfK6GGXALwDwd+Wzns=;
 b=Sg7HMVjsvljb0+s1wO2y5tofQnfK7zNPW3Kr8CCkKe6A3G2ylqsBeF+Z
 5mRpg7gKsAqd5xNUAX1XahnTKMot9jKO2csjqVCn+KGP3G5QIb3muKQ3B
 zfDwcUsHyb9vyqwQitXsMxmAwMYkyWP6nF2Ta0Jf8G3tJovpzFaK5oyzN
 RiM/som8MuAtQDDhMxAAB6rC58Q1sjt0k3qAB4GjgYD2i7+Y9yLepdzPS
 tO2SqQ5I28aXQva4xpViYzQ2NuSNTHmhOIMb+dCcL0tCLMTtaDcw/2MZT
 NUy4+Q/Ux11Qb8XVo77tBmJPODV5lRK137rTh4LamaPlHdItsgMo4Rdye Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10816"; a="355533773"
X-IronPort-AV: E=Sophos;i="6.02,208,1688454000"; d="scan'208";a="355533773"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Aug 2023 14:06:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10816"; a="853015973"
X-IronPort-AV: E=Sophos;i="6.02,208,1688454000"; d="scan'208";a="853015973"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmsmga002.fm.intel.com with ESMTP; 28 Aug 2023 14:06:45 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Mon, 28 Aug 2023 14:06:45 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Mon, 28 Aug 2023 14:06:45 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.105)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Mon, 28 Aug 2023 14:06:44 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=c+33YLgbGkCfQj1U5H4FhoYJwcm1uWr4tOxpej6RJj/HslcvZ3ZnnoybjlVajcl0LEhCnqujzm8/FmhFDQ9r5M8LgeO1qcRiBSeDzc4SDgQVKjtLUBS1v6tsYz4TaUSH6GJLLu5QzK/m6Q2ZUAvjUlDo/GOnnizMZt3vdkfxNjYgXOBIxx1f9SxCXKhdfw4LvHnlgu9rk7UBldG+v1JlsdXTcwjqc96vMGx4El0RKXny3VZSkuw894QNcbwvTjln/hVg9JnVlEVYSnXnFRIyrtA/Khgpu1gGkMCDp3RQCFhGgiEm7UwOIUYo0jBcGDwK31ELzcuwjL2BXCEvsLB2lA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cJOoBJ15b1TRMk7GlkxrRlmjcSfK6GGXALwDwd+Wzns=;
 b=KXOnL1+rxAnKfIsP9+IUmR3VjLm4pSJVBoa0QXuA+iyWhtK6Z+vs9Tvnok3of2jYPU+Q92PYLeeknBoaTfjdMlxP2X72LeddYhOYpHKUBbHHP7wujGDS9yIfVUrHS5dckcsMIt7n+sS75hvBqa1T1ZdrWqRP3DutjbUIa+5JR4FeikshvtSAZLseYFCh5pfjc9cj3r8JvbEyL8ASQ5mrS2yd16Qjmt8kmGTr8zFmhaRga8+zmWQsv15EDtavx54dRMwk9hFD0ZKErlTf/0H97thOCDMIJM2k16f6tIAOHzFHORWMsi6OTy2Cl5TMDrxlaTiN0Jy8F/GMLf7sgmFDmg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM8PR11MB5751.namprd11.prod.outlook.com (2603:10b6:8:12::16) by
 DM4PR11MB7376.namprd11.prod.outlook.com (2603:10b6:8:100::6) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6699.34; Mon, 28 Aug 2023 21:06:43 +0000
Received: from DM8PR11MB5751.namprd11.prod.outlook.com
 ([fe80::542d:f32a:14b:1531]) by DM8PR11MB5751.namprd11.prod.outlook.com
 ([fe80::542d:f32a:14b:1531%3]) with mapi id 15.20.6699.034; Mon, 28 Aug 2023
 21:06:43 +0000
From: "Teres Alexis, Alan Previn" <alan.previn.teres.alexis@intel.com>
To: "Vivi, Rodrigo" <rodrigo.vivi@intel.com>
Subject: Re: [PATCH v2 2/3] drm/i915/guc: Close deregister-context race
 against CT-loss
Thread-Topic: [PATCH v2 2/3] drm/i915/guc: Close deregister-context race
 against CT-loss
Thread-Index: AQHZzxWOM6RDYlL2zU2EXxVkEb9vJ6/rYksAgABXNoCAD7ObAIAE28wA
Date: Mon, 28 Aug 2023 21:06:43 +0000
Message-ID: <7ff4a5252aa3997e4f511b9b8984afd681560238.camel@intel.com>
References: <20230815011210.1188379-1-alan.previn.teres.alexis@intel.com>
 <20230815011210.1188379-3-alan.previn.teres.alexis@intel.com>
 <ZNuD9JdmoYhYJ+G5@intel.com>
 <c890d7338f2c30818d313b34a02eee1ba0842261.camel@intel.com>
 <423d81f9849c589bceedbcd383570aa42bc8c6c9.camel@intel.com>
In-Reply-To: <423d81f9849c589bceedbcd383570aa42bc8c6c9.camel@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.46.1-0ubuntu1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR11MB5751:EE_|DM4PR11MB7376:EE_
x-ms-office365-filtering-correlation-id: 93e3ea7f-fada-4db7-06b8-08dba80aae4c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Y6cL7dAtnGwAZbBjR44k2Ss7hDu7FKNO3WbkV/n5lsqmAhJqP1skFTXN5wuM9g/OSazOTaUPWhDHVUsdBQcDct71hkexRT05ze1ljJ24LdSRe8NGyijfWvrhF/eWrwNyW+GZbF8/0Z22lUf9QSf0iE3EvW/Z1d23pDC16IToYXMEy5rekrI0hUyHxxiD4RUkH2xh4eGh87ee+CpNdtqmQZKd9cKu/7PqgpcItlgoy/uFTCE9/HoS6mKKBuRdr9Um/O7HbxljGXrDDhrqL6BOoZYI62BiREA7whaCsDzbDcOashlGg0sfplWe16v+orQ1d2DAWqTib2eoENEX2P7u7HN3fwrHs2A/eCAVH1G8QC2M+0nNNkY7GH9AuYdZpCotk11lthnHyzkpAR4vVYKUm1jZmuEKr6ZwLuvvot4uQupDUB7xEgwWXqufXJ6c9jcoLptacdjTkj6R10uNQHxBBOSku8bgBQNf9smPr+OoenE5VCx2wdCQyn/glojjblLyaCqk16ivqFQ0vMsqiTt8MrgA4JsmHVZdOpOgLROEo0QfgIdEkv6DxVOwM8sxwnjv1l6HARLb5zdAgjsTJe4eAGM2WlIa0xGc5GTD23JNSyQp8ogl37iX9nIP0j2KZDcb
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5751.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(396003)(39860400002)(376002)(136003)(346002)(186009)(1800799009)(451199024)(6512007)(6486002)(6506007)(71200400001)(83380400001)(478600001)(2616005)(107886003)(26005)(2906002)(6636002)(316002)(64756008)(66446008)(37006003)(66476007)(66556008)(66946007)(91956017)(54906003)(41300700001)(5660300002)(6862004)(450100002)(4326008)(8676002)(8936002)(76116006)(36756003)(82960400001)(38070700005)(38100700002)(86362001)(122000001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?UlM5VDBZdXpyRi9LT0xrL0FiUDRVeit4ZXVTdWNEUXc1SDM4Qi82c0dFcGVD?=
 =?utf-8?B?b2Z1dXZZTWVFak9RRFJ2aDFSM0pIZjhjMTBzZlZIbldhY3ZRdWk5bzBBZi8w?=
 =?utf-8?B?dW5aQm1uTEtzaEl1ZXo4SWpWc2xEU3RJS1Z5dHo2MjF6RGFlay9Fa2ZwckJ2?=
 =?utf-8?B?TjExbERDR2t3UWVIMlp5SEtYdXRraTlKSHE4amVRa2NGM2xUR3Y1RmRFdjJM?=
 =?utf-8?B?bXh5WnYzK1BvbjEzQzVuM0gxUmZVQk9TY20xRjYwMzBsQ3l6RmxZdzZtZ3JU?=
 =?utf-8?B?T2JzQWdCMit0MmtzWjcyME85bXNhVUVxcTR6WDF6dGIvQlhmQ1FIbHh3V1dY?=
 =?utf-8?B?WnFhUzVHc3NHR3M2dW5wbE9JVWJBckJoMjloSitUL2hqcEFMRXJ4L25GU1px?=
 =?utf-8?B?cUJrTmc4bUp3dU81S2x3aU84aGxobkE1cWtyMmZ5TVdOdGE2MjhtNkdiYTNv?=
 =?utf-8?B?RHVRKzZDWVlrRi9WWmJJa1ZiS1BTVUZUK0ZZb0piTThWR2ZJRkp4NWJXZDV2?=
 =?utf-8?B?TzRJU3cvRTVhZmFMY2VRYkhjREZPK3pWVkQxbXg3TmtjZTJkT0luQlc4OG5F?=
 =?utf-8?B?bUkwa05XSTNYeFRkVU4wVjVZYTRDUDhnTHdRYlJEN1RxZDVlYWlTQk5RQ2Mw?=
 =?utf-8?B?dm5ydGY1azMzV1ZUSUx3M3ZvbmtWc1lyVXFTWE1zM0RCZ0N4TXNSUnpibjli?=
 =?utf-8?B?dHhQcUNSYVpScUhyZ004b0VIVnBSUFlQSTY5ekg0RTNJckIvSFJ2UkgrWW9n?=
 =?utf-8?B?QUJIWktpV29KUS8rQURCeCsrOUh4cGZPSzJrTmJRZDhMeWxqUitXRmdnVUdi?=
 =?utf-8?B?cVdHQ1lhMG5ybXh5T0FqT3Y5d3h1TzVmckRnTmJjU1pzWmRWZzlOUE9CejR6?=
 =?utf-8?B?K2RiajhGTVE3eUxtOHRlVzkzZlB2ZkZXTnZsa2ZMcnJIU1VHZUhvVjBrdXVz?=
 =?utf-8?B?Mnh6VjJlQ0tEQ1NuUVBybkFIY05KUDlCZ2x3b3Jmc1lUZnhuQS9nQnpuS3hq?=
 =?utf-8?B?NEF6RmVJeTJ3S1loUHVuL0NCNFp3a3ZZK3NvZW9yYmh0RXdQSlNLN0pRR3hu?=
 =?utf-8?B?dGdVUldlRkkvaVJ6M0plV3pMR05VNFc3bDA2bW1DS3JaUkliaFBlYVJlS3Zs?=
 =?utf-8?B?R0ZoQjM1VHpqQVFkZTdET2IrOGpUd2NnYTNFMXBNZUhiVms2bHZSOXFBWXJu?=
 =?utf-8?B?d2tIaUQzRnZuWFNrV2RoREVFYUUrOElpYTVLSUxrdkJjeE1naG5ITk9vRTBt?=
 =?utf-8?B?b3dzN3lUVXFNeWh1WnhqV0lPSEl3dTNzNWtzUEhNV1pGYnZkTkFPSDNWOTB2?=
 =?utf-8?B?ZmFjQjd2ZU9iVldXRFBURS9aZDg4QlJMK3p1R2FZNkY5RlhRVWRSbWV3VzhT?=
 =?utf-8?B?V2hUK0Nad0hXN1V0NTZqSFRVM0lkdFJPcjFxRXd5TWVzMmhxWjJZaW04Tkhv?=
 =?utf-8?B?ZldtMVJncGtHZGlRcEsrczZKb3RmdGdZT0ZTYnMxSDJKdXBLYWROUHJyd2xt?=
 =?utf-8?B?Y3Exd1k5SFBUejhRRlJUQmN1RUluYnR0cFhLVHFQYUIveW1XcXAxSkJNUitC?=
 =?utf-8?B?NnRkZnU0YjgzSStPQlc5emlLZ3JyYzR4MjcvQ2liQ0E1STJoVXpxZmk3REwv?=
 =?utf-8?B?d2F5OHVCQjM4YTZXUUlHZzFqZ2g4Q0lBREoyZ1grL1g3dVZYZWJOMmZIbnlE?=
 =?utf-8?B?d1RqbkJlV0JxVGVXK3lub2Q4bElEQUMvR0x2TTRKdEZqNGo1Q1hwM2lDM1Fh?=
 =?utf-8?B?M2J4UzBUVDdaUG9jc1RQU1VmN1pBNzRsYTdxUzUzbDZqWk4zNWh5cGUrUzcx?=
 =?utf-8?B?WGJaMHB3UUdSZzBZdTJCaFJXOXg0QXRKVVJKa3diYWF5ZEVwdGpvcmRVc3Nq?=
 =?utf-8?B?V0VUcDlTZG5RU1hCRGVmVmdSS3NJWVR1Z1JRS2MwWlVtS3ZCMUdQV1NlWFN3?=
 =?utf-8?B?anp6OElwdmVtS2NGclZSY2dQQlM0eEt6dkV3UU5tM2lITlU2Ui91dEYwTW16?=
 =?utf-8?B?dTJhQTlRSUZnNWRsaEM0TUEzUHVoWFRSb3d0MkdOZFo4MC9VS0NNRUJOdTE5?=
 =?utf-8?B?ZWY0cWFCK2I3TjFycDJMYXlUVDZHd3B4SmQvQkQvdlJLTnlVdTNUeWVJaWNX?=
 =?utf-8?B?UlllQk5tSXVnVTdhRzVDdVo4cmN0K3I2VUlZTE84aWFBMHJ4eFpQTWt0TDN5?=
 =?utf-8?Q?W+rmUVPh8hW1SS+9C3yRlx0=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <1D395B8A639B6A4DB1F5742C7463779B@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5751.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 93e3ea7f-fada-4db7-06b8-08dba80aae4c
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Aug 2023 21:06:43.0220 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: GoCwYh+r+Re7rPR+XX07+OY1N2J6d88UQGZ5f9BwlpXZUYTE0yusVb4I0kalt6HtFIeXURPnto0S07/zWJ0f+gJ+7LvQ3zuNdKZUt6BeSu9jQpu4PjJ0HbvrEKFI9+J6
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB7376
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
Cc: "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "Ceraolo Spurio, Daniele" <daniele.ceraolospurio@intel.com>, "Harrison,
 John C" <john.c.harrison@intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QWRkaXRpb25hbCB1cGRhdGUgZnJvbSB0aGUgbW9zdCByZWNlbnQgdGVzdGluZy4NCg0KV2hlbiBy
ZWx5aW5nIHNvbGVseSBvbiBndWNfbHJjX2Rlc2NfdW5waW4gZ2V0dGluZyBhIGZhaWx1cmUgZnJv
bSBkZXJlZ2lzdGVyX2NvbnRleHQNCmFzIGEgbWVhbnMgZm9yIGlkZW50aWZ5aW5nIHRoYXQgd2Ug
YXJlIGluIHRoZSAiZGVyZWdpc3Rlci1jb250ZXh0LXZzLXN1c3BlbmQtbGF0ZSIgcmFjZSwNCml0
IGlzIHRvbyBsYXRlIGEgbG9jYXRpb24gdG8gaGFuZGxlIHRoaXMgc2FmZWx5LiBUaGlzIGlzIGJl
Y2F1c2Ugb25lIG9mIHRoZQ0KZmlyc3QgdGhpbmdzIGRlc3Ryb3llZF93b3JrZXJfZnVuYyBkb2Vz
IGl0IHRvIHRha2UgYSBndCBwbSB3YWtlcmVmIC0gd2hpY2ggdHJpZ2dlcnMNCnRoZSBndF91bnBh
cmsgZnVuY3Rpb24gdGhhdCBkb2VzIGEgd2hvbGUgbG90IGJ1bmNoIG9mIG90aGVyIGZsb3dzIGlu
Y2x1ZGluZyB0cmlnZ2VyaW5nIG1vcmUNCndvcmtlcnMgYW5kIHRha2luZyBhZGRpdGlvbmFsIHJl
ZnMuIFRoYXQgc2FpZCwgaXRzIGJlc3QgdG8gbm90IGV2ZW4gY2FsbA0KZGVyZWdpc3Rlcl9kZXN0
cm95ZWRfY29udGV4dHMgZnJvbSB0aGUgd29ya2VyIHdoZW4gIWludGVsX2d1Y19pc19yZWFkeSAo
Y3QtaXMtZGlzYWJsZWQpLg0KDQouLi5hbGFuDQoNCg0KT24gRnJpLCAyMDIzLTA4LTI1IGF0IDEx
OjU0IC0wNzAwLCBUZXJlcyBBbGV4aXMsIEFsYW4gUHJldmluIHdyb3RlOg0KPiBqdXN0IGEgZm9s
bG93IHVwIG5vdGUtdG8tc2VsZjoNCj4gDQo+IE9uIFR1ZSwgMjAyMy0wOC0xNSBhdCAxMjowOCAt
MDcwMCwgVGVyZXMgQWxleGlzLCBBbGFuIFByZXZpbiB3cm90ZToNCj4gPiBPbiBUdWUsIDIwMjMt
MDgtMTUgYXQgMDk6NTYgLTA0MDAsIFZpdmksIFJvZHJpZ28gd3JvdGU6DQo+ID4gPiBPbiBNb24s
IEF1ZyAxNCwgMjAyMyBhdCAwNjoxMjowOVBNIC0wNzAwLCBBbGFuIFByZXZpbiB3cm90ZToNCj4g
PiA+ID4gDQo+IFtzbmlwXQ0KPiANCj4gaW4gZ3VjX3N1Ym1pc3Npb25fc2VuZF9idXN5X2xvb3As
IHdlIGFyZSBpbmNyZW1lbnRpbmcgdGhlIGZvbGxvd2luZw0KPiB0aGF0IG5lZWRzIHRvIGJlIGRl
Y3JlbWVudGVkIGlmIHRoZSBmdW5jdGlvbiBmYWlscy4NCj4gDQo+IGF0b21pY19pbmMoJmd1Yy0+
b3V0c3RhbmRpbmdfc3VibWlzc2lvbl9nMmgpOw0KPiANCj4gYWxzbywgaXQgc2VlbXMgdGhhdCBl
dmVuIHdpdGggdGhpZSB1bnJvbGwgZGVzaWduIC0gd2UgYXJlIHN0aWxsDQo+IGxlYWtpbmcgYSB3
YWtlcmVmIGVsc2V3aGVyZS4gdGhpcyBpcyBkZXNwaXRlIGEgY2xlYW5lciByZWRlc2lnbiBvZg0K
PiBmbG93cyBpbiBmdW5jdGlvbiAiZ3VjX2xyY19kZXNjX3VucGluIg0KPiAoZGlzY3Vzc2VkIGVh
cmxpZXIgdGhhdCB3YXNudCB2ZXJ5IHJlYWRpYmxlKS4NCj4gDQo+IHdpbGwgcmUtcmV2IHRvZGF5
IGJ1dCB3aWxsIHByb2JhYmx5IG5lZWQgbW9yZSBmb2xsb3cgdXBzDQo+IHRyYWNraW5nIHRoYXQg
b25lIG1vcmUgbGVha2luZyBndC13YWtlcmVmIChvbmUgaW4gdGhvdXNhbmRzLWN5Y2xlcykNCj4g
YnV0IGF0IGxlYXN0IG5vdyB3ZSBhcmUgbm90IGhhbmdpbmcgbWlkLXN1c3BlbmQuLiB3ZSBiYWls
IGZyb20gc3VzcGVuZA0KPiB3aXRoIHVzZWZ1bCBrZXJuZWwgbWVzc2FnZXMuDQo+IA0KPiANCj4g
DQo+IA0KDQo=
