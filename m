Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ADE0B41EE1D
	for <lists+dri-devel@lfdr.de>; Fri,  1 Oct 2021 15:03:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B538F6ECEB;
	Fri,  1 Oct 2021 13:03:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF96D6ECE9;
 Fri,  1 Oct 2021 13:03:03 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10123"; a="223525373"
X-IronPort-AV: E=Sophos;i="5.85,339,1624345200"; d="scan'208";a="223525373"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Oct 2021 06:01:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.85,339,1624345200"; d="scan'208";a="709849059"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmsmga005.fm.intel.com with ESMTP; 01 Oct 2021 06:01:43 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Fri, 1 Oct 2021 06:01:43 -0700
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Fri, 1 Oct 2021 06:01:43 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12 via Frontend Transport; Fri, 1 Oct 2021 06:01:42 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.107)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2242.12; Fri, 1 Oct 2021 06:01:42 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ExEqi/I3vM/hOcQ4aTlFToYlbwVS0yM3b32GKtRl0P7FKlri2bjhg+wqHZxaDGzgoHH5SYoMhU7QDBmZjfXoef4gj//q2DQHGIzyAQccj1RVMsQnpQRbwP1GlOWiqkifvnVWF/qOrWkbhbpmyeEx+zC2DaOl3IbpmvWM2N5Mjx+n4FFk0QvTL9hSFuzPdjpjPiSBBjE6iJ8C5DnDL0nab4hx4H06+Xw633lAYVh30cNad3Fc9tg2mgAWtEhjl3U5WFPoyqtdgNxGsG20IE86zDmQ4e0cnxszIw4cPAM9ZxJ4OIEueiDrbPSzXUKWvDkACJzmIVIB1zpbNyMZGdipXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bNqtKw1TFZI8C0hWuQq67VEOlUFzvvGYIrPABG2a5CA=;
 b=PN433ZOlYkHabSL5+2ENVeUGCI+oSYRXZItq0Ig3Jbfx9yERDKwK5V5fkDs4w6CIZqy4NSrUZzP38227Mct9tLJHXK7WCrUcfeLVw25vtbsTGZjVpyCfdKUQyOQ1YfxWi4HKarnlL/ZgRkbFfa5UAaMPvBBSPEAvB6QJjW9mQj+T7sdVsiYUOhs2i9IY9E4upSIdR/GqdAnwVQoPAmrsMzyeZIFHDRw33anSqXnUXJd4kVQ66H4UG2Q/0RLP/s9ewvomSNLDPVD8PQ25cT2WlhkoH4McMZNhqk89hCSx1cfJlUoot2mcItqCBQxuVko6kM/mQ/7i/kuT3M11WubruA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bNqtKw1TFZI8C0hWuQq67VEOlUFzvvGYIrPABG2a5CA=;
 b=ZEOuSvkixJpbDZM58enU5+knRK70W7cs9F0Nktmaf2DxiKBi1thxMcc+fINy1Poo/jNSzWPOmDVweXsk0l7YrLv89nVrq1Bw/tPpwHyhJInRxGRxOw9XE0SqneCr+wuKz51Dwcd8zkwXzM7Ns4lrJfxo+J930aDmqF2mHDCdIy4=
Received: from DM4PR11MB5549.namprd11.prod.outlook.com (2603:10b6:5:388::7) by
 DM5PR1101MB2121.namprd11.prod.outlook.com (2603:10b6:4:50::19) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4566.19; Fri, 1 Oct 2021 13:01:41 +0000
Received: from DM4PR11MB5549.namprd11.prod.outlook.com
 ([fe80::2db5:86a8:9c6f:3a1d]) by DM4PR11MB5549.namprd11.prod.outlook.com
 ([fe80::2db5:86a8:9c6f:3a1d%3]) with mapi id 15.20.4566.019; Fri, 1 Oct 2021
 13:01:41 +0000
From: "Wang, Zhi A" <zhi.a.wang@intel.com>
To: Jason Gunthorpe <jgg@nvidia.com>
CC: Luis Chamberlain <mcgrof@kernel.org>, Jessica Yu <jeyu@kernel.org>, "De
 Marchi, Lucas" <lucas.demarchi@intel.com>, Zhenyu Wang
 <zhenyuw@linux.intel.com>, Christoph Hellwig <hch@lst.de>,
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
Thread-Index: AQHXfkkPR74j3PcQBUqzVfBaHB7ETatOyPlwgAATUQCAB+h0AIABoDZQgABTFICAAN/IAIAIA5SAgABQYwCAAPoZAIATp54AgAB+0YCAAEa+gIADWQiAgAHzigCAAF7DAIAIh7KAgDP1tYCAAGooAIAACYwAgAAIY4CAAcrQAIAAB/CAgALBwQA=
Date: Fri, 1 Oct 2021 13:01:41 +0000
Message-ID: <0f52ab3e-f50a-041f-f37d-4d2f3febe49b@intel.com>
References: <20210817052203.GX13928@zhen-hp.sh.intel.com>
 <20210819082929.GB13928@zhen-hp.sh.intel.com> <20210820141724.GA29034@lst.de>
 <YSAI8pKAvvW/8S2O@bombadil.infradead.org>
 <20210826061219.GD9942@zhen-hp.sh.intel.com>
 <55c11f22-99e5-6109-3be3-a04b06b3336e@intel.com>
 <YVMgGKk1K4gO8ls6@bombadil.infradead.org>
 <af40291a-de36-b39f-9ded-aaf4ddba641f@intel.com>
 <20210928150507.GM964074@nvidia.com>
 <24c7bbec-b425-52fb-d3f9-539a0a391dfa@intel.com>
 <20210929185541.GW964074@nvidia.com>
In-Reply-To: <20210929185541.GW964074@nvidia.com>
Accept-Language: en-FI, en-US
Content-Language: aa
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
authentication-results: nvidia.com; dkim=none (message not signed)
 header.d=none;nvidia.com; dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: a9dc4bc1-0e23-48d3-184d-08d984db9cf9
x-ms-traffictypediagnostic: DM5PR1101MB2121:
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM5PR1101MB2121AEC33E645B46F5FE7270CAAB9@DM5PR1101MB2121.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: XXwOY8hgu0AIJhjjs9N066HSRNeW/xlyzTPVFCTUS7D6ROPccJ1XZ4v/K63Ab7laFEBWFWWWdtNRSXPkN9YVpSujZtayBr3fz22JKw3FbxbAMenrQ0RZzS5i3vRz4i+LbqJ9XIdDqBVCT7cefOLrVXdMpgEGffLkTtz6m7j8MOY8AAInaR/dtScP6XMp8NCYvxmk7WJ9VqFSuxKw5cubK9b+F8znr6uzHEwCd9XZP1zbYD1cpSF89sY2JlW2elUZ6hnCSRLAiyQRPg68iEUsL65HT5yQsKT5L6l0GJLEZV2JFqa+exoicxrE42fGPhEXiC0sqqzSFWvHAyr9EZW8XyamJCilRQ71+J8DJAURaCMVN46fNfkLbZ7N5RfTJIURRznHmrrZ8e79yZd9r5LAgQGSB1M1MMXLLg1xxOj55eIXrwQBJTTZEFw1ilsrV/CUV6S06UoWHbWTCVKjyztUki7xXBCV6vZT8vYmdioWL04tHsj7Vq0ZUVItQfIzMd3bdEDAkcHCJdmfm+fhBXwMll5weGE34QDtj9ycI6v+sFKUYmiEzuVXgUMrwEi/D4wcZSJ4/TBB9smfey27NJjsvMMaOoEQSLQ/ElIRpnEZbA9xFukCHcug5RUEOzY31STD2PGzUMUr3EHJ8HjM+eeOHKZNaeNOxnpHT+cvtV+ZJQgZXZ5a4B82gCb/P/7travXLEUqfv0jFXPijBW9PSj+0kJ7B3Q/PIrF1O8GUJ7FI6tJh94py9dssCMkLlsL8y51mDBHBnygbiz78nuF7DPsEQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5549.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(31696002)(26005)(186003)(4326008)(31686004)(36756003)(38070700005)(71200400001)(83380400001)(8676002)(76116006)(66946007)(6486002)(38100700002)(91956017)(2906002)(122000001)(6512007)(64756008)(8936002)(7416002)(66476007)(66556008)(86362001)(5660300002)(53546011)(316002)(2616005)(54906003)(508600001)(6916009)(66446008)(6506007)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Sm1kNTVXd1QrWVc1S3owbHdqdktkRTFJdGFnN0tVQXp2cUdwUFM2VHc0cVll?=
 =?utf-8?B?MWRRS25jMzhTMjVvcmVSdGo3ak9URWlyUWl2eWN2SGw1YVhDODNxdkI3ank2?=
 =?utf-8?B?bGNQWkt4TmFoWHVNZXplc0xBNGhlY05BN3FvdGNMbTE1cHZ3cHRtdGFWcDFh?=
 =?utf-8?B?RmdDY2xJbjZVb2JLMG93aFpYNTJtOGZaZmZwemRTS3Nqa0NxSmFOMDBaTHJP?=
 =?utf-8?B?NnFLelRrVkZyMnBKZTVIT0NmSjRVV1Y5UzB2NzFib29Ea1VzZTZ1bWVXQWsy?=
 =?utf-8?B?SzlyZGNqTDNXVlJibDJWcmVTSHkrRWZMbW9zT3MrWW5meVNMbzVvcDNTdlBC?=
 =?utf-8?B?N0Z1Q0owM1FWNnhBOU42UExoRVVPRjBOSXhtOHROVmtneERPQUh3bytyRE9m?=
 =?utf-8?B?dEZCZjZvOXUrM1FOVmlKb2VOOW5VQmdtbGFVZ1o5Nm5nMEs2U24wRXNjZm13?=
 =?utf-8?B?MElWd3MxKzQ1RGFYaWNoRmhSM3NkeWdsTW1FZTFxQjZHbHNFMFhHRmFEREdj?=
 =?utf-8?B?QW9qOGJPYTZWa3JEaU1MSmQ5SmZ0ams4dFAxT3QwbERKblJ5Wkhkd3JURHhw?=
 =?utf-8?B?cGZxNEE2bGYxNjZLVTRCbjJPZTA1NStyaEJITzhsTkVUdURzbFFLMGRrZGYz?=
 =?utf-8?B?Qkl6QVU2VEVSSWVUeDk3RGFXUnUxRGl2aE04WUp2NEdFazBSSE5WV0k1SjFK?=
 =?utf-8?B?SXRmQ0EvdUhpZGZxNWtFSFVEYnlLSEx0TFlqRDFNSkM2RjRKWnVoRnduK2FI?=
 =?utf-8?B?cDZtQm05OC9mV0VyOUd4TUM3cG5KMmYxYmZLUloyL2RpczNRWTZpMkdyT1d0?=
 =?utf-8?B?Zy9KU0s5a3JrVXRIVkFFa1NoUU9pMVBhWDJRanNaL2VkZWM0bENMYkMyaDBF?=
 =?utf-8?B?R3Qrc2oycEEvSzdBVnpvNHZzV3F3SmhvbVhvajBjaE9HeUZwUC9SK1JZa2d3?=
 =?utf-8?B?Z0RBTUVLV0NkZkpRajlZT3EyaTdNNXNhYnp3OEhTcGJ2QUlqTTREQTkzaGtq?=
 =?utf-8?B?dlZNZEtMSk5CenZ2NXhmMFZMWk9rc3c4Qlh2enpudU1mZDZtcFFmaHNpbmZ5?=
 =?utf-8?B?NEZ1ZjZjOG1RdVFaQ0FQWE5GenBiU01rN29WU1BpSVdZcG5sT1JBa0NhUkI4?=
 =?utf-8?B?UnpZYzdGZi9hUE1ZcFdpa21xQ2RVTllxSDAyRHFwVGFFcUNNcFBxeUY3dUl1?=
 =?utf-8?B?eXpxZE5tL1dORDVqZmJGNzRHdEdaL2Q0TmplSzBUL0dHNE00UmRuYml2YTJi?=
 =?utf-8?B?SXUyZHZ6MDQ1VmlnaTJxYXNBaHdlRkVvQWthSkM5Y2FCcU9EODBjcS9SdXdj?=
 =?utf-8?B?VVowVHBJT0VYSUFyOTJPOGFQNzF6RHdJZ0FLTXgrTGEya2J6aWVnSjJ3VEY5?=
 =?utf-8?B?VFhobWNwdEtMSW5lUi8xYmdSbTczNzVqQXozbWY1RldCWDNUNVduSmRvN2pD?=
 =?utf-8?B?a0pydERvQ2hsSkpBazZKWVZ6L0VjcUphNkJnMjU0Ni81QW5SRmVjVlNnNkE4?=
 =?utf-8?B?ajJrTVNYQTJxTmw0Y2oybHBYN3JrY3dRb3NMN2FmSkI2RVN5MlJsWVVCM3dB?=
 =?utf-8?B?bzNobkdkbXlBNFpNZlRXSm9kdnB5eTMrOHRTZTFoaU95a0hXMVp4VXZLVEY2?=
 =?utf-8?B?VnhFdER2c1p0UUlxZEhOQmZjd0x0ckJLYTBJbDdXUEFORFVMcTBYTzRJcVFR?=
 =?utf-8?B?TnRhcktkajdra1d2c0VjVkE5d3R6WHI0ZXlITUNFUy93T2N2MklnWHZtMllk?=
 =?utf-8?Q?Q2CcJImsp8ir7EPsgIaz5F7lZyk44HOdp/V3vqn?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <1F5CE16CD83A9444ABF2347EF24FB39B@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5549.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a9dc4bc1-0e23-48d3-184d-08d984db9cf9
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Oct 2021 13:01:41.5482 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: uFDp4NPNrmhu3qM0h/TO6CGd/naNXmC8AtCkPmToazesEvl7OuC2UPeJb2oP6RJMebJh5+IMKQfuG2j1oirt7Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR1101MB2121
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

T24gOS8yOS8yMSA2OjU1IFBNLCBKYXNvbiBHdW50aG9ycGUgd3JvdGU6DQo+IE9uIFdlZCwgU2Vw
IDI5LCAyMDIxIGF0IDA2OjI3OjE2UE0gKzAwMDAsIFdhbmcsIFpoaSBBIHdyb3RlOg0KPj4gT24g
OS8yOC8yMSAzOjA1IFBNLCBKYXNvbiBHdW50aG9ycGUgd3JvdGU6DQo+Pj4gT24gVHVlLCBTZXAg
MjgsIDIwMjEgYXQgMDI6MzU6MDZQTSArMDAwMCwgV2FuZywgWmhpIEEgd3JvdGU6DQo+Pj4NCj4+
Pj4gWWVzLiBJIHdhcyB0aGlua2luZyBvZiB0aGUgcG9zc2liaWxpdHkgb2YgcHV0dGluZyBvZmYg
c29tZSB3b3JrIGxhdGVyIHNvDQo+Pj4+IHRoYXQgd2UgZG9uJ3QgbmVlZCB0byBtYWtlIGEgbG90
IG9mIGNoYW5nZXMuIEdWVC1nIG5lZWRzIHRvIHRha2UgYQ0KPj4+PiBzbmFwc2hvdCBvZiBHUFUg
cmVnaXN0ZXJzIGFzIHRoZSBpbml0aWFsIHZpcnR1YWwgc3RhdGVzIGZvciBvdGhlciB2R1BVcywN
Cj4+Pj4gd2hpY2ggcmVxdWlyZXMgdGhlIGluaXRpYWxpemF0aW9uIGhhcHBlbnMgYXQgYSBjZXJ0
YWluIGVhcmx5IHRpbWUgb2YNCj4+Pj4gaW5pdGlhbGl6YXRpb24gb2YgaTkxNS4gSSB3YXMgdGhp
bmtpbmcgbWF5YmUgd2UgY2FuIHRha2Ugb3RoZXIgcGF0Y2hlcw0KPj4+PiBmcm9tIENocmlzdG9w
aCBsaWtlICJkZS12aXJ0dWFsaXplKiIgZXhjZXB0IHRoaXMgb25lIGJlY2F1c2UgY3VycmVudGx5
DQo+Pj4+IHdlIGhhdmUgdG8gbWFpbnRhaW4gYSBURVNULU9OTFkgcGF0Y2ggb24gb3VyIHRyZWUg
dG8gcHJldmVudCBpOTE1IGJ1aWx0DQo+Pj4+IGFzIGtlcm5lbCBtb2R1bGUuDQo+Pj4gSG93IGFi
b3V0IGp1c3QgY2FwdHVyZSB0aGVzZSByZWdpc3RlcnMgaW4gdGhlIG1haW4gbW9kdWxlL2Rldmlj
ZSBhbmQNCj4+PiBub3QgdHJ5IHNvIGhhcmQgdG8gaXNvbGF0ZSBpdCB0byB0aGUgZ3Z0IHN0dWZm
Pw0KPj4gSGkgSmFzb246DQo+Pg0KPj4gVGhhbmtzIGZvciB0aGUgaWRlYS4gSSBhbSBub3Qgc3Vy
ZSBpOTE1IGd1eXMgd291bGQgdGFrZSB0aGlzIGlkZWEgc2luY2UNCj4+IHRoYXQgaXQncyBvbmx5
IGZvciBHVlQtZywgaTkxNSBkb2Vzbid0IHVzZSB0aGlzIGF0IGFsbC4gV2UgbmVlZCB0byB0YWtl
DQo+PiBhIHNuYXBzaG90IG9mIGJvdGggUENJIGNvbmZpZ3VyYXRpb24gc3BhY2UgYW5kIE1NSU8g
cmVnaXN0ZXJzIGJlZm9yZQ0KPj4gaTkxNSBkcml2ZXIgc3RhcnRzIHRvIHRvdWNoIHRoZSBIVy4N
Cj4gR2l2ZW4gdGhlIGNvZGUgaXMgYWxyZWFkeSBsaW5rZWQgaW50byBpOTE1IEkgZG9uJ3Qgc2Vl
IHRoZXJlIGlzIG11Y2gNCj4gdG8gb2JqZWN0IHRvIGhlcmUuIEl0IGNhbiByZW1haW4gY29uZGl0
aW9uYWwgb24gdGhlIGtlcm5lbCBwYXJhbWV0ZXINCj4gYXMgdG9kYXkuDQo+DQo+IEFzIGEgZ2Vu
ZXJhbCBwaGlsb3NvcGh5IHRoaXMgd291bGQgYWxsIGJlIG11Y2ggbGVzcyBzdHJhbmdlIGlmIHRo
ZQ0KPiBtZGV2IC5rbyBpcyB0cnVlbHkgb3B0aW9uYWwuIEl0IHNob3VsZCBiZSBjbGVhbmx5IHNl
cGVyYXRlIGZyb20gaXRzDQo+IGJhc2UgZGV2aWNlIGFuZCBuZXZlciByZXF1ZXN0X21vZHVsZSdk
Li4NCj4NCj4gSW4gdGhpcyBjYXNlIGF1eGlsaWFyeSBkZXZpY2UgbWlnaHQgYmUgYSBnb29kIG9w
dGlvbiwgaGF2ZSBpOTE1IGNyZWF0ZQ0KPiBvbmUgYW5kIHRoZSBtZGV2IG1vZHVsZSBiZSBsb2Fk
ZWQgYWdhaW5zdCBpdC4NCj4NCj4gSW4gdGhlIG1lYW4gdGltZSBpcyB0aGVyZSBzb21lIHNob3J0
Y3V0IHRvIGdldCB0aGlzIHNlcmllcyB0byBtb3ZlDQo+IGFoZWFkPyBJcyBwYXRjaCA0IGVzc2Vu
dGlhbCB0byB0aGUgcmVzdCBvZiB0aGUgc2VyaWVzPw0KPg0KPiBBIHJlYWxseSBhd2Z1bCBoYWNr
IHdvdWxkIGJlIHRvIHB1c2ggdGhlIHBjaV9kcml2ZXJfcmVnaXN0ZXIgaW50byBhDQo+IFdRIHNv
IHRoYXQgdGhlIHJlcXVlc3RfbW9kdWxlIGlzIGd1YXJlbnRlZWQgdG8gbm90IGJlIHBhcnQgb2Yg
dGhlDQo+IG1vZHVsZV9pbml0IGNhbGxjaGFpbi4NCg0KSGkgSmFzb24gYW5kIGZvbGtzOg0KDQpU
aGFua3Mgc28gbXVjaCBmb3IgdGhlIGlkZWFzLiBUaGF0IHNvdW5kcyBncmVhdCBhbmQgSSB3YXMg
a2VlcGluZyANCnRoaW5raW5nIGhvdyB0byBtYWtlIHByb2dyZXNzIG9uIHRoaXMuIEhvdyBhYm91
dCB3ZSBkbyBsaWtlIHRoaXM6IFdlIA0KZG9uJ3QgZG8gcmVxdWVzdF9tb2R1bGUoImt2bWd0Iikg
aW4gaTkxNS5rbywgd2hpY2ggcmVzb2x2ZXMgdGhlIGNpcmN1bGFyIA0KbW9kdWxlIGRlcGVuZGVu
Y3kuIFdlIGtlZXAgdGhlIGNvZGUgb2YgZG9pbmcgc25hcHNob3Qgb2YgcmVnaXN0ZXJzIGluIA0K
aW50ZWxfZ3Z0LmMuIFdoZW4gaTkxNS5lbmFibGVfZ3Z0PTEsIHdlIGRvIHRoZSBzbmFwc2hvdC4g
VGhlbiB3ZSBleHBvcnQgDQpmdW5jdGlvbnMgZm9yIGt2bWd0LmtvIGluIGludGVsX2d2dC5jIHRv
IGNoZWNrIGlmIGd2dCBpbiBpOTE1IGlzIGVuYWJsZWQgDQpvciBub3QgYW5kIGdldCB0aGUgc25h
cHNob3RzLg0KDQpIb3cgZG9lcyB0aGF0IHNvdW5kcz8gSSBqdXN0IG5lZWQgdG8gd3JpdGUgYW5v
dGhlciBwYXRjaCBhbmQgcHV0IGl0IG9uIA0KdG9wIG9mIENocmlzdG9waCdzIHNlcmllcy4NCg0K
VGhhbmtzLA0KDQpaaGkuDQoNCj4+IEFsc28gSSB3YXMgdGhpbmtpbmcgaWYgbW92aW5nIGd2dCBp
bnRvIGt2bWd0LmtvIGlzIHRoZSByaWdodCBkaXJlY3Rpb24uDQo+PiBJdCBzZWVtcyB0aGUgbW9k
dWxlIGxvYWRpbmcgc3lzdGVtIGluIGtlcm5lbCBpcyBub3QgZGVzaWduZWQgZm9yICJtb2R1bGUN
Cj4+IEEgbG9hZGluZyBtb2R1bGUgQiwgd2hpY2ggbmVlZHMgc3ltYm9scyBmcm9tIG1vZHVsZSBB
LCBpbiB0aGUNCj4+IGluaXRpYWxpemF0aW9uIHBhdGggb2YgbW9kdWxlIEEiLg0KPiBPZiBjb3Vy
c2Ugbm90LCB0aGF0IGlzIGEgY2lyY3VsYXIgbW9kdWxlIGRlcGVuZGVuY3ksIGl0IHNob3VsZCBu
b3QgYmUNCj4gdGhhdCB3YXkuIFRoZSBTVyBsYXllcnMgbmVlZCB0byBiZSBjbGVhbiBhbmQgb3Jk
ZXJseSAtIG1lYW5pbmcgdGhlDQo+IGk5MTUgbW9kdWxlIG5lZWRzIHRvIGhhdmUgdGhlIG1pbmlt
YWwgYW1vdW50IG9mIGNvZGUgdG8gc3VwcG9ydCB0aGUNCj4gbWRldiBtb2R1bGUuDQo+DQo+IEph
c29uDQoNCg0K
