Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AA84F4AD333
	for <lists+dri-devel@lfdr.de>; Tue,  8 Feb 2022 09:24:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E95B210E479;
	Tue,  8 Feb 2022 08:23:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2079.outbound.protection.outlook.com [40.107.223.79])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 794D010E370;
 Tue,  8 Feb 2022 07:21:58 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oOrTzts2lGF4YGQZkj74tJAP/CJalO5Yj7q00519uBqPuZ4UVBaED/IMqnzRC8/7JbDl/jsyaxlEOMDoqBkfU3jXEb01tCBBoZIGzh6kR19CxzC7Jlwp5TVBE/QXj7V83+JF37etWaApI0hli1Z1CZ2LTzWbszYeoYR+QBoVDMvBbVOzZFql2iBEVn3zH1y8pqpzmHiAG9nofxyZ9ZJOdUFzWcYUIzruzZiQS9JyN8rJym/BmkQKj2P2Qcd9Ys9L80n1m4Fn4hHUseWPuwm56RJjkjB24VgpVK+G4sX9dsM7kt5kF99jgoJvCnols2fjUO0xzCyYJO1l3aoj+43uRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=F58eWAL4a/tx09vt/sWjCqN05NAyZmsBCdXLkUPUxxM=;
 b=Ud7/jacNfCU+wALewClQUGZQwpdp2xNDn+t84W4jwSLyPnAsflgQM0H4eG70AjVdQldlDYXdyK6T9vLyTmnDgLZjkjGlmNjhfpl2q2TqFfDexx34QLNX7KjOqFY9odsfRpcxJlabD+jcDcsLSZgTIYOCjFngT2+d4hnMxFdf1RWqrP1UgVs30etaEuyHFtkDpn+TqadknLzKSLlzFGBYhSeXX9Hge8HjvCaGGF34MjWRo3oX0f98eIxEUrGWtnVmGRLbbWBglhIk28IjUGTNHUsXUavvJUDAS1477k0lZqVfCUieb8wfeBBtjwmDQYl8NwyfYCuJWb8w/SJC6tEtcQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=F58eWAL4a/tx09vt/sWjCqN05NAyZmsBCdXLkUPUxxM=;
 b=UIrI7btShHHJxijxGoUqZ42ijarfmE9CszL+JnLIk3o1H6aziHoyn3zXflIwJAygu9d98ojnnzheSSm9CKCCJXmlTRsZMhAVEyt/x1PQdTrRpY5OTcx+XisAm6HDTnKuij1T8zW3ntZ3logdeM7+WxTjAnLIQGmy5aRVKnXSxsQOi4EEfAsnD8RdmLOYlB1YT8a+JmRPYtGN4QI/51fjQWZ9CHcUn/ADBM/HxkgvB3mMHmyjDgxwKMPowuwDwoVC+wT3OsbFXO1powaOXK+fAh1NjdO1lRo2zT1UQuYhpPqVGXYJxdjd73dYHjC3rqmmgiD05+GlBioaRY94mlIMhQ==
Received: from MW2PR12MB4667.namprd12.prod.outlook.com (2603:10b6:302:12::28)
 by DM6PR12MB3337.namprd12.prod.outlook.com (2603:10b6:5:118::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.17; Tue, 8 Feb
 2022 07:21:56 +0000
Received: from MW2PR12MB4667.namprd12.prod.outlook.com
 ([fe80::846c:d3cd:5a30:c35]) by MW2PR12MB4667.namprd12.prod.outlook.com
 ([fe80::846c:d3cd:5a30:c35%5]) with mapi id 15.20.4951.019; Tue, 8 Feb 2022
 07:21:56 +0000
From: Chaitanya Kulkarni <chaitanyak@nvidia.com>
To: Christoph Hellwig <hch@lst.de>, Andrew Morton <akpm@linux-foundation.org>, 
 Dan Williams <dan.j.williams@intel.com>
Subject: Re: [PATCH 2/8] mm: remove the __KERNEL__ guard from <linux/mm.h>
Thread-Topic: [PATCH 2/8] mm: remove the __KERNEL__ guard from <linux/mm.h>
Thread-Index: AQHYHLyNNQpxdwy5KkmKJWPkv3ZBYg==
Date: Tue, 8 Feb 2022 07:21:56 +0000
Message-ID: <54be0e1e-6534-2325-b06a-92cb217caf00@nvidia.com>
References: <20220207063249.1833066-1-hch@lst.de>
 <20220207063249.1833066-3-hch@lst.de>
In-Reply-To: <20220207063249.1833066-3-hch@lst.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 965a5139-21ec-4497-57d6-08d9ead3b024
x-ms-traffictypediagnostic: DM6PR12MB3337:EE_
x-microsoft-antispam-prvs: <DM6PR12MB333780DDD03FF4FC51C5D799A32D9@DM6PR12MB3337.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:324;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: B2h6WRaJb4GBPoxNkZbLkI+5BBMir/eb6tzdON1qOJIqQZHMQFwrhAV2lMbS4VbVjtN8jlpOg4WXaNIOiuNkCv0hZITDckuqTJtj8OIpCb92C+Nto8JhYvDjBN5c51ZCk8rv/cFa0QMaonfRwCWqtUKXGazAp5UK9GLJ9tQ5YU5cNxNeiQjDO1fpwKyYHdXU4Tietf+hhWQ/RwKXPSXYzCD/RrgLPVf2njTPqbAW3C3wdagqATDpGsE1mEKklUwukTZPpVysVAnrmcdpcL8BpYAPLlZ0jq1JufCydiQ7R4DzN75fZ3Ahf2Rl3sSDg6DN2meK/8qa+ls8nii54aeACiluFUDGbCy0klHJvNNGNjeo6hs8nLOULnqc9wPBWiCSCTQYXFIegQ2cHDdyQpX38QP5dqwnFtB3obXbIWOXDhn8Tc1VvtFQiwpsmK9eoRQzjgxnls6ITmLCDr0CxBwp136/p8ZxThOlOFRXWBMuVUcFLs5hz2cdWXs9FXqAtRkR3coDgDUFiEPTpEBp3bNBgEGDdYUvPiTM9/l4sXDIMx/XUo8mVcnzrCocFXqTzDN1Cl04WtfPja+YXFihD2AUgwDq0EpWAiw2Fi6wAnSC7gty3i4EoutLhL/xBMuy7JA6hu6Fsu52K21j89hppOxYshe+4RLjvoveHVHAOcaFJ9j5errUgFv8si3XkurkKIWL0YivLcx7nH3PANjg3uM7MpkeGq21HXVd5H2biut0vAoGT2SkXoC9B+e4Zbk9sdfDDI5GpHO0tBYrezS3xvC00Q==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW2PR12MB4667.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(31696002)(110136005)(4744005)(54906003)(64756008)(8936002)(8676002)(66556008)(66946007)(76116006)(66446008)(66476007)(31686004)(316002)(91956017)(38100700002)(186003)(2616005)(122000001)(5660300002)(6506007)(86362001)(71200400001)(38070700005)(7416002)(53546011)(6512007)(83380400001)(36756003)(2906002)(508600001)(4326008)(6486002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?YU50MFpaUEtsU3FmUWt3VmRGTkt6T29nMGxoeS9xRkgrSlh2VnVyRzJLVVd4?=
 =?utf-8?B?RzhiSE05ZlloeWMrRVFyN2FYdytEZitUZWxiMWpmcFNvV1Qvc2tzQUt0ZDNl?=
 =?utf-8?B?TE5rMnc0Q3Uwb1ZQcHlZd0R2SEV1MVNrQUZEdytTWjVMc3grY2E4ZmdGNm5W?=
 =?utf-8?B?NFZ6ZjN4Z0NoQm5Vei8vdGJMWVVGaHhoNjFEZVZURUxHR2VWWFlRS3UyQmRS?=
 =?utf-8?B?OFJJUzRCdGZuejRRbnNBNmhDbUhsZldFeHZ5ZFZweVkzQVBScWhuVmEyaXJ1?=
 =?utf-8?B?OG9QbjAyNzFKMmdJd1hRcjV2MzIrQXRQTGx5eFFxRlp1a2JObGptZ3FnaVBl?=
 =?utf-8?B?UVNDN0UxVmhST0dUc1pnSElBOXBpb0xNNE96N1A4YjdnTUc3RUl6d3JseFBi?=
 =?utf-8?B?MWlLanFrSGdUWDZqMEl2cHlKS1dERkNsTmpGV0VnUnk5eVJHRHoyRnNwL3l4?=
 =?utf-8?B?aWRXSi9Xczdha2FNbW45QmczN3R1Y3dYVjNicEpMNU1wdXliZFp5Y1NQY2F1?=
 =?utf-8?B?amhyNlNGVXhJZUNTN2EvaTkvVThCODRzdXpTeDRRaWJOeHIrMGlWY0NqMTJV?=
 =?utf-8?B?bmdqdzBWb0w3UzlIelRIdmNBQkMrcFd6NWdleVpFT1l0Zm51eDVRSHVaQno5?=
 =?utf-8?B?UGgvR1kxZlVaNEVydi9IQzlKWUY1aFUzSG9OL1hyRGZyZWdhRWFiRjhQZzkw?=
 =?utf-8?B?R2ZzUElUWkxVSE8ybXFPUkx3akpGaTdnWk5zWkhRTFYwaSs2YzdIUHFFa3Uv?=
 =?utf-8?B?eTkvUy83RnRBanB3M0l6VVdLdTN2bVkrWUEzMVY5VEQwaUhlb05pZHdFUmRr?=
 =?utf-8?B?Nm1zNk9BcG5lbWl0cDRlTW1TY1FTVkZCVmM1bytrcDh2QUw2Z055aktHOUFD?=
 =?utf-8?B?TkxqRENqd3dDa3RLak54WE9KYmtRQ0djdUovcUJTZnFtL3NwZmZKVEhsV1JB?=
 =?utf-8?B?TDFtL1ZuejBpb05RNU0yRTJUbzFCK3FFNi9tTng1NUJobmJyWHArN1JIeEpT?=
 =?utf-8?B?RHhFR3NRbEMrdUprUk1uYmV2ZGNzTmJId290RFJYcnl6eWFrNmJ4QjNvdHUy?=
 =?utf-8?B?djJxelZXaFFmcGNGbVR2VUJVTmQ5b0d0OHV4dDRodTkzY2RuYTZ1SmE3aU9T?=
 =?utf-8?B?R2lIVyt4V1ZkMytUcnRzQXIwS2FCWGRUS0tQSWVrRXl2czhYSXpXU2NQeXFH?=
 =?utf-8?B?L0dHTzlZNDRPKy9QQTRPWWJWeXFHS095YVpzNkNheHNON3NGclNEVFYvSkJN?=
 =?utf-8?B?OHg3RFB6V1cvdTc4M1IxNjVHdkVlRG1JRDJXc2UrL3JuUkR5UDhLdGNwRFFi?=
 =?utf-8?B?NnZZa01QRlhVeFlDOUx6d0dMY21pYTM5S1RhUkZvMDEwWk1iOHBJcndHOVBy?=
 =?utf-8?B?YWNEalg1ZnV0bWJ2ZjY0OTRuR3pIaVpqaHNYL0YyTU9vMGVBMVlvWTdVUjZp?=
 =?utf-8?B?NWRFSGlBYlFnOWJUbVd0Nm9hSVc0S2ZaOFpBRE1mVkJGNTdnWTlBaTJ0L2po?=
 =?utf-8?B?OEN6ZEtObmtORjBva1ZXT0tRSGI4SFF6RmEzeU5FU3REMlc3bEVkRi9FV0hI?=
 =?utf-8?B?ZDFpU1ZIYWFXYzhrYzlUL0Y2VytyTnVTN3ZsTmZJS0RpVDZnUmlVMnhoK281?=
 =?utf-8?B?YWNPR092RU1ha0czZUR2dThZcHlhL0pkMjFiWE05bnlDRUxYZkpjSGt2MHF5?=
 =?utf-8?B?QVM0aklWZHQwR0ZBeWxjck1HV2F3bEpwdzgyUVZnZkJrc2tYcTJFcU44amNS?=
 =?utf-8?B?MkFQUHdVTG9KZ1F3aDkydnhjL3RtRXhERzlZKzJxZWcxQURhR3ZZRGFnRmFQ?=
 =?utf-8?B?MlM3M1c0ZWZKdEx0WnNaeGJYUzFPL1JkMjlFSlg3eU43TjdzajMrVlJNWkVo?=
 =?utf-8?B?dUhBS2s5b2Q4bHlEa3FYcHd3LzRKbWpQODhyekRZeUw3VlpiMitvdVltVnlw?=
 =?utf-8?B?VnF0bkgyZHZET0RBNVhpL0o4VUk3UU9TQ2tLeE4vU1VkQzk2Mm54YmxBSkUw?=
 =?utf-8?B?WnR4S0tXMEttWVJtN0xKYjBIc0dHUE1iaWtMc3lidTFzNjJvcy96YkpzVnJL?=
 =?utf-8?B?ZkhVblpDdDhaM3ZibHRsMzN3ZjZ0TDRjeUxHMVBXcmJPNGhjRWtSeitMaDBP?=
 =?utf-8?B?cEQ3OGVERk1nMDJoMk1HeHZKUk50M3ZWeEZ1NTRXcXQ4eGNFNWRtNndlVVdE?=
 =?utf-8?Q?PVhJJvgj+HAcyU0Gev96ocgqhnI++Ov3N+rqhCe18HAh?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <C27A9AEF07ED5040AE0CDD394F3555FE@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MW2PR12MB4667.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 965a5139-21ec-4497-57d6-08d9ead3b024
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Feb 2022 07:21:56.2712 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: mqk5uwwKoh+MNw806U4Nr8edjo9Sk7CTBbHELcnkPbBqbIiRSM9bI33MkRMwFml4YrayK6no//L+QA1mBnr2yA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB3337
X-Mailman-Approved-At: Tue, 08 Feb 2022 08:23:40 +0000
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
Cc: "nvdimm@lists.linux.dev" <nvdimm@lists.linux.dev>,
 Ralph Campbell <rcampbell@nvidia.com>, Alistair Popple <apopple@nvidia.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Karol Herbst <kherbst@redhat.com>, "linux-mm@kvack.org" <linux-mm@kvack.org>,
 "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>,
 Felix Kuehling <Felix.Kuehling@amd.com>, "Pan, Xinhui" <Xinhui.Pan@amd.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 Jason Gunthorpe <jgg@ziepe.ca>, Ben Skeggs <bskeggs@redhat.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 Logan Gunthorpe <logang@deltatee.com>,
 =?utf-8?B?Q2hyaXN0aWFuIEvDtm5pZw==?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMi82LzIyIDEwOjMyIFBNLCBDaHJpc3RvcGggSGVsbHdpZyB3cm90ZToNCj4gX19LRVJORUxf
XyBpZmRlZnMgZG9uJ3QgbWFrZSBzZW5zZSBvdXRzaWRlIG9mIGluY2x1ZGUvdWFwaS8uDQo+IA0K
PiBTaWduZWQtb2ZmLWJ5OiBDaHJpc3RvcGggSGVsbHdpZyA8aGNoQGxzdC5kZT4NCj4gLS0tDQo+
ICAgaW5jbHVkZS9saW51eC9tbS5oIHwgNCAtLS0tDQo+ICAgMSBmaWxlIGNoYW5nZWQsIDQgZGVs
ZXRpb25zKC0pDQo+IA0KPiBkaWZmIC0tZ2l0IGEvaW5jbHVkZS9saW51eC9tbS5oIGIvaW5jbHVk
ZS9saW51eC9tbS5oDQo+IGluZGV4IDIxM2NjNTY5YjE5MjIzLi43YjQ2MTc0OTg5YjA4NiAxMDA2
NDQNCj4gLS0tIGEvaW5jbHVkZS9saW51eC9tbS5oDQo+ICsrKyBiL2luY2x1ZGUvbGludXgvbW0u
aA0KPiBAQCAtMyw5ICszLDYgQEANCj4gICAjZGVmaW5lIF9MSU5VWF9NTV9IDQo+ICAgDQo+ICAg
I2luY2x1ZGUgPGxpbnV4L2Vycm5vLmg+DQo+IC0NCj4gLSNpZmRlZiBfX0tFUk5FTF9fDQo+IC0N
Cj4gICAjaW5jbHVkZSA8bGludXgvbW1kZWJ1Zy5oPg0KPiAgICNpbmNsdWRlIDxsaW51eC9nZnAu
aD4NCj4gICAjaW5jbHVkZSA8bGludXgvYnVnLmg+DQo+IEBAIC0zMzgxLDUgKzMzNzgsNCBAQCBt
YWR2aXNlX3NldF9hbm9uX25hbWUoc3RydWN0IG1tX3N0cnVjdCAqbW0sIHVuc2lnbmVkIGxvbmcg
c3RhcnQsDQo+ICAgfQ0KPiAgICNlbmRpZg0KPiAgIA0KPiAtI2VuZGlmIC8qIF9fS0VSTkVMX18g
Ki8NCj4gICAjZW5kaWYgLyogX0xJTlVYX01NX0ggKi8NCj4gDQoNCkxvb2tzIGdvb2QuDQoNClJl
dmlld2VkLWJ5OiBDaGFpdGFueWEgS3Vsa2FybmkgPGtjaEBudmlkaWEuY29tPg0KDQo=
