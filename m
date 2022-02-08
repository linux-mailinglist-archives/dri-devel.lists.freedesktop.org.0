Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 516074AD32D
	for <lists+dri-devel@lfdr.de>; Tue,  8 Feb 2022 09:24:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0AFDB10E4C3;
	Tue,  8 Feb 2022 08:23:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2062.outbound.protection.outlook.com [40.107.243.62])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4369D10E269;
 Tue,  8 Feb 2022 07:50:41 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WpSTCwd9by0DDWO26McBQlfsOpPf7M080cBbe2GlwLTt2X91Xi+90Aop5DB1Vhl3xN5U80SvCH76rzwjhd1wy0gGqvVkKdliuv/u/tkBpOdyzeA5a+GtQ0cN4r81rPhZS7h2qxmfCTwL2ziM2R/edhX9YkMU2Yqpy5Wy28xSsOaCAKgqWFP0oQv0sePqR68NeTREYpMFGv9qG8oLIss0r7WItbvmjluQSmqgXA67QN1Ew3A6bKQGoa3hWKA7G2fm3s8P0e5IczEOTiadFCqxWu88lCDOeFPdV3dTKOLPk+I6iO2eaC4zyvWmopQrWUWrti+MUP26re1YV9IwPY0LRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KiWrys8sp4PaHF6WH1Imh+jgwgEopExnPUVfDy1o8C0=;
 b=BNY+0wQY2K6S74OIoCkEVsjrk88BfYZI8g35RAP/c4GuK62zz/THFjLPiT6vgPRprQ4mjeAzcrKrQb/G1mObd4fRMPgtU9sM1E4O0NVh9jgDnES+XUJmLvwqs/3/FKKqOlYUCiFjXYNeWkpedc3l58CGefOv8QZ9NS9+gX2zcCK4o9Et2D8Hxfy4cor8HC1fhDxwAjf7feKQE8KNHGye/Fwe+BhSNWOnRcw+YuNCdVqxHyBZmaEnrzfgpkQ+Hm7l1hL8sPmRk1O8TUxTMwewoPaEmicSOpoxPdtYgcK9fyeCG3Ui//vaGX6kI5Dh/5uwn+Nu/HdgbimQk/RYOH8qPw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KiWrys8sp4PaHF6WH1Imh+jgwgEopExnPUVfDy1o8C0=;
 b=dI/dYyeeNX3K2vWsyMpP0ZP4p7faH2InPsZnEEZfbD4Po116/SpKfdrkv9SV4opUXc+JdFQxNjh0lmGixw+BNyUq7xaiYlh0ADVl/v3hlIBCG1mBH8XL8U+DNZYyVMo80SLVPItX9oHMaAEH5rrJ6/D1kyUFbYKRaR4Qy0A70kcsiLm+yiKO2Zs1Mu4jm+7la/SPrjkCkC2Uo1yj1bsSp316A7K5mMKY6OAgij/ibJpWMxoE03I/okX10L7m3Tcj5UCL3PJCflgYB44IvFUSvnzCiJIgIFY0EC9iSw3yYaWGRDBcqs4QgoPdN+gJC3sERNCCvr8O9O7XiptQG+BALw==
Received: from MW2PR12MB4667.namprd12.prod.outlook.com (2603:10b6:302:12::28)
 by BYAPR12MB3253.namprd12.prod.outlook.com (2603:10b6:a03:12f::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.18; Tue, 8 Feb
 2022 07:50:39 +0000
Received: from MW2PR12MB4667.namprd12.prod.outlook.com
 ([fe80::846c:d3cd:5a30:c35]) by MW2PR12MB4667.namprd12.prod.outlook.com
 ([fe80::846c:d3cd:5a30:c35%5]) with mapi id 15.20.4951.019; Tue, 8 Feb 2022
 07:50:39 +0000
From: Chaitanya Kulkarni <chaitanyak@nvidia.com>
To: Christoph Hellwig <hch@lst.de>, Andrew Morton <akpm@linux-foundation.org>
Subject: Re: [PATCH 5/8] mm: simplify freeing of devmap managed pages
Thread-Topic: [PATCH 5/8] mm: simplify freeing of devmap managed pages
Thread-Index: AQHYHMCPFas1VHS2U0CDnrSRuC236g==
Date: Tue, 8 Feb 2022 07:50:38 +0000
Message-ID: <01ae1d08-33ba-c38e-07ba-40721b95ed5c@nvidia.com>
References: <20220207063249.1833066-1-hch@lst.de>
 <20220207063249.1833066-6-hch@lst.de>
In-Reply-To: <20220207063249.1833066-6-hch@lst.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 2892362d-c824-4d6f-9416-08d9ead7b2f2
x-ms-traffictypediagnostic: BYAPR12MB3253:EE_
x-microsoft-antispam-prvs: <BYAPR12MB325336D00C5B2818293A1DBFA32D9@BYAPR12MB3253.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5797;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: +mzupTcvjgPtuUOgWrHLTEejgZWrmcSmuQw5/BajKaIGFaXa09zlpTgJ8vBwsFXv4BxBgfm5z6czJuznYcQQnQjThHV+lH8AYEp1Fg2Qqtf9AKqtRAKE6h+JfL0Hqb52PCx4U/phkC524+UErkrFsPZ+OuCzzPYraWLUC6w7vGaTo3i7JkBcW126DzuxPnoFnpPD7fbzf7YdsnwtF9L6z0/eGQYxkURDeeOkkglF2XfbHYS1AlagJ2DoAAD0gj/cg4ChT16DcPmvMPNtvGzuVyB3UjBI2LjTenYCA//mK8rDg0Aigyhb+YsrU3RCr2nDTzMVLjwCJAuxGWJ/KTgNRmGHDxQUryj9ckVcRX3oLJMpn9YRUnE/55kh8qOp/7HQ6GQEtmAeDzI28dK6HX4TMH+MnTNi08N+8q3gleVleXDPYYOlN6SkYFJwAa5c0reM60PaRTf/phgkuVUkB+6uP6VYU9IsX6KWsAeo8Qq5Zb6LgUQrPvhGTmrcTxMa/RkCP90YS9W7Se4itCPWTBDzfh7G92kYHshumM8pNrPQx2b3I336mH4MdaL5p+6h2BbrRTyQMRXKGzPLZeyPFYRfjy5GCvkJcfAQBh63SqAgcULvloKwdVNhYdgGxRhghj9pDHlkvaal/Q+HvyiNDTTyCRfrJnwR6Ygatus8GIQllTC6ufzk0WWLf7UpzK8OYCCj5nzPZ5jZYDUSOV29Q3Je6E8Lyh5Icu9PE9TTrmo6JlM0bZSTQ5LTOqVNf0L3HRLZYPzIg2b55FYkTb9+wXZ6FQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW2PR12MB4667.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(31686004)(66946007)(76116006)(66556008)(66446008)(64756008)(6506007)(66476007)(186003)(91956017)(6486002)(38100700002)(122000001)(71200400001)(7416002)(36756003)(508600001)(5660300002)(8676002)(54906003)(31696002)(2906002)(110136005)(316002)(6512007)(86362001)(4326008)(38070700005)(8936002)(2616005)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?NXltVU53YWtVZmcyVTJBcjJuSzBualUxblVtWkpCaVVMQlAralQya283ekdO?=
 =?utf-8?B?cjJNNUFxV2FBRnliQkVPRGRyOUVXNzNlMjNmdXpWWTcwTmFNQnRnVkJCMkVJ?=
 =?utf-8?B?dGd5QXlqQS9zdFRZaFZ1ZHJpSm1VaHAvUlpSM0YxMjNWVml4YnVuOHNDUGRV?=
 =?utf-8?B?Nk5BVDhNbE1iYjRBRU1JcldlanltTXlraWhtNHAvT3NBa1JROFRnblBqSCtj?=
 =?utf-8?B?WnNuVm1zUTdOOGQ3TUpqRVF1eW5oRU5sbmtBSmZ4eEhRT3ZFdGdBQjVMVVp4?=
 =?utf-8?B?ZVdsejd3cS81RDlCSUpEMXRhZDlpS2d6Nk9WZnZCcWttQ3FHcXhDTWcxdUhn?=
 =?utf-8?B?TEZQYWlxVWN6Rm5Sc0p5Q2h5MURXKzJUVDFBYjdMRnVIU2huNXk1Z1hvd2hG?=
 =?utf-8?B?TXJWc2NuSE9pVmc1a1ZuN1FQWjRROElaWCtaZzZuYWQrdHhtTGdGMHlQQVRu?=
 =?utf-8?B?YSsyOFlBZ1daeTB6VXFVOHNFL0duaDQ4YUpNMzZUT1Q2OFJQWi9vU1dQYW8y?=
 =?utf-8?B?OEVidGJRa3I2RTBYYkJPWHlkT2J6U05CdzRzMDdHR21MbVVKbUdMUzdqSGZu?=
 =?utf-8?B?Qm1UelluWEtmaWFkbHJ3aFBZWWFjWHl5TDc4dGZTbDZZbjJVTU5ScjVBT2VC?=
 =?utf-8?B?SnU2SElVYThVL3pyckhDaVpqWlRzRjNzU2g4SVRrWUJEa0poSVdtazhDdHFP?=
 =?utf-8?B?ckVQSitWbno4cVZiWFJkOFNuR2wzanN2cThPL1kwb2cweVdCeGZaZm9KM25w?=
 =?utf-8?B?dG9wUERvTy96YlovT1ZreXpzVGhjSEdZYmVMSFFCZGZpcDhLUHVSRnE0bkZJ?=
 =?utf-8?B?Wk5Qd2pydlVVT3c5VHZ5VHN4VUFPNFRkU1BNOXF6eXhwbUNSUzBuZjhZdnBh?=
 =?utf-8?B?V3UwRWxBazhjYk1NVis2SjN0RzFiQmN5OHF4NDNPS0ptbFdFbjBnOWIweW5z?=
 =?utf-8?B?K09rV3U1NzNTRms4NyszMjZGeTBQa0JWQ202dWNZREljb2lqYmVKdE96aWVj?=
 =?utf-8?B?YkRNSnJydTMwVlRNNks3QWpHYWtpL28xU1EvRzFQMU9lRk1QcndvMTJTMFJm?=
 =?utf-8?B?dXVUeCsrM2dGNmx5NHQ2SGx1dmNvbzhwRjBnVmNYUTVPWVZRS3MvdUE4cnpR?=
 =?utf-8?B?bTgvTnQrWmc1L09nRGxxUHlMTHlOTnBIQ095QjNLdWxacXpNd05pQlZXdnZ5?=
 =?utf-8?B?c1V3cjhRS3BLcGF4L1I4NWhqeTk5S1N2ajVCNFVGUDI1by92cWV2YytpY1FC?=
 =?utf-8?B?dE5VcS91ZmU0dkpFWGVCSjYwSWZMM29aWldwL1p6WXVXOWdsejZYZFFaMHpt?=
 =?utf-8?B?OCtqU0tTenU1THpEbGlmT050RXpUUUlXdjBDajh1Tk5GNHhXVGEwSGQyc1g4?=
 =?utf-8?B?OTFhU3RWSzRZcjJsellWcm1VVTBLSTErM3Urcjg5b2RMNVNnYTJBbWxORzFj?=
 =?utf-8?B?MHBsYkxOd005MUJHMGpYODZNMTR0TDJ3Sk9rOVV1bEVyZGpPT1IzSHBOMEc2?=
 =?utf-8?B?VmFxTE5rOUxiTG5wanJuMTgvN2dLcUxmTjBXWktkaWFFZnZLTTVoclBBUnBu?=
 =?utf-8?B?Ymc1eE1wZ0FXZFVndURpS2RvWHN5K0JYWTNITXcrRlJoOXN4M3dualpML1FH?=
 =?utf-8?B?UUVHVUkyQ0RVeGtka0dCNmFRWTNwRVZyUUtHNXJjOGZKN2R3cmw4dDNMQzlM?=
 =?utf-8?B?ZXFZeGR1bWVmcTlpZXgrcFRWR1FMbjNKTHNHSjhnS0VNVWl6ZkVqNWVpYnZw?=
 =?utf-8?B?SnZDbFgyai9LemkvdmxwL3ZxWnFqTlhKbnRvbnczbkkraUhXYjB0M2g3TXNn?=
 =?utf-8?B?bnFHbDRhalpSK3daYTFOOWtKUkVUSEI2emFYY3ppZ2FEaWJyTDdiZ3BNZVN2?=
 =?utf-8?B?Q0ZnZjB2alJpMzg2V1J4V0dDV0hMd1lTbmZpZzNiL3dCeHozM0ZrSDBLYWNL?=
 =?utf-8?B?WXZMTldaZzJxTjJhUG54UU56K3d0MmtXQ0grYWFScGZtUXNkamVzdS9DT2tP?=
 =?utf-8?B?b0hKaTMrb2ttZEs4OXM0SkFKTm9acmNwM2lrcll6N1JXS3J3NjIyOHRWTWF4?=
 =?utf-8?B?UjZjWEhaa25GdjA2QlZtQ0cweFZRT3FrU043QXpFV3Q5N1ZuWk5MREhTaHRu?=
 =?utf-8?B?OTNvOXFaZXhnM2pNYWZRRDVTWmVPRitPMlRDUU1lOXEwRC93dEJ1ZnNsbXRK?=
 =?utf-8?Q?mKNkRKN4HSFtrf3jkiKddEUUsMSgRr3iKFmh+54fgFvj?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <554A8CC2C3CBEA4FBD0791392D98C6C9@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MW2PR12MB4667.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2892362d-c824-4d6f-9416-08d9ead7b2f2
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Feb 2022 07:50:38.9652 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: bbhrlHa6F4y/FzW+Eq27C7vo4s9ISqj6g3mn+EBcV1gYxer4vgpX0aK6LmdWtrZM1gW3KWw7wxlfcfVv6li0Tw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB3253
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

PiAtc3RhdGljIGlubGluZSBib29sIHBhZ2VfaXNfZGV2bWFwX21hbmFnZWQoc3RydWN0IHBhZ2Ug
KnBhZ2UpDQo+ICtib29sIF9fcHV0X2Rldm1hcF9tYW5hZ2VkX3BhZ2Uoc3RydWN0IHBhZ2UgKnBh
Z2UpOw0KPiArc3RhdGljIGlubGluZSBib29sIHB1dF9kZXZtYXBfbWFuYWdlZF9wYWdlKHN0cnVj
dCBwYWdlICpwYWdlKQ0KPiAgIHsNCj4gICAJaWYgKCFzdGF0aWNfYnJhbmNoX3VubGlrZWx5KCZk
ZXZtYXBfbWFuYWdlZF9rZXkpKQ0KPiAgIAkJcmV0dXJuIGZhbHNlOw0KPiAgIAlpZiAoIWlzX3pv
bmVfZGV2aWNlX3BhZ2UocGFnZSkpDQo+ICAgCQlyZXR1cm4gZmFsc2U7DQo+IC0Jc3dpdGNoIChw
YWdlLT5wZ21hcC0+dHlwZSkgew0KPiAtCWNhc2UgTUVNT1JZX0RFVklDRV9QUklWQVRFOg0KPiAt
CWNhc2UgTUVNT1JZX0RFVklDRV9GU19EQVg6DQo+IC0JCXJldHVybiB0cnVlOw0KPiAtCWRlZmF1
bHQ6DQo+IC0JCWJyZWFrOw0KPiAtCX0NCg0Kbml0Oi0gaG93IHNvbWUgdmFyaWFudCBvZiBmb2xs
b3dpbmcgdG8gbWFrZXMgYWxsIGNhc2VzIGV2aWRlbnQNCndpdGhvdXQgaGF2aW5nIHRvIGxvb2sg
aW50byBtZW1yZW1hcC5oIGZvciBvdGhlciBlbnVtIHZhbHVlcyA/DQoNCiAgICAgICAgIHN3aXRj
aCAocGFnZS0+cGdtYXAtPnR5cGUpIHsNCiAgICAgICAgIGNhc2UgTUVNT1JZX0RFVklDRV9QUklW
QVRFOg0KICAgICAgICAgY2FzZSBNRU1PUllfREVWSUNFX0ZTX0RBWDoNCiAgICAgICAgICAgICAg
ICAgcmV0dXJuIF9fcHV0X2Rldm1hcF9tYW5hZ2VkX3BhZ2UocGFnZSk7DQogICAgICAgICBjYXNl
IE1FTU9SWV9ERVZJQ0VfR0VORVJJQzoNCiAgICAgICAgIGNhc2UgTUVNT1JZX0RFVklDRV9QQ0lf
UDJQRE1BOg0KICAgICAgICAgICAgICAgICByZXR1cm4gZmFsc2U7DQogICAgICAgICBkZWZhdWx0
Og0KICAgICAgICAgICAgICAgICBXQVJOX09OX09OQ0UoMSk7DQogICAgICAgICAgICAgICAgIHJl
dHVybiBmYWxzZTsNCiAgICAgICAgIH0NCg0KDQo+IC0JcmV0dXJuIGZhbHNlOw0KPiArCWlmIChw
YWdlLT5wZ21hcC0+dHlwZSAhPSBNRU1PUllfREVWSUNFX1BSSVZBVEUgJiYNCj4gKwkgICAgcGFn
ZS0+cGdtYXAtPnR5cGUgIT0gTUVNT1JZX0RFVklDRV9GU19EQVgpDQo+ICsJCXJldHVybiBmYWxz
ZTsNCj4gKwlyZXR1cm4gX19wdXRfZGV2bWFwX21hbmFnZWRfcGFnZShwYWdlKTsNCg0Kbml0Oi0g
d2UgYXJlIG9ubHkgcmV0dXJuaW5nIHRydWUgdmFsdWUgZnJvbSBfX3B1dF9kZXZtYXBfbWFuYWdl
ZF9wYWdlKCkNCmluIHRoaXMgcGF0Y2guIFBlcmhhcHMgbWFrZSBpdCBfX3B1dF9kZXZfbWFwX21h
bmFnZWRfcGFnZSgpDQpyZXR1cm4gdm9pZCBhbmQgcmV0dXJuIHRydWUgZnJvbSBhYm92ZSA/DQoN
Cm9yIG1heWJlIHNvbWVvbmUgY2FuIHNlbmQgYSBjbGVhbnVwIG9uY2UgdGhpcyBpcyBtZXJnZWQu
DQoNCj4gICB9DQo+ICAgDQoNCklycmVzcGVjdGl2ZSBvZiBhYm92ZSBjb21tZW50KHMpLCBsb29r
cyBnb29kLg0KDQpSZXZpZXdlZC1ieTogQ2hhaXRhbnlhIEt1bGthcm5pIDxrY2hAbnZpZGlhLmNv
bT4NCg0K
