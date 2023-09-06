Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 35DB6793BA8
	for <lists+dri-devel@lfdr.de>; Wed,  6 Sep 2023 13:47:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 13E7510E616;
	Wed,  6 Sep 2023 11:47:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx08-00376f01.pphosted.com (mx08-00376f01.pphosted.com
 [91.207.212.86])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 69BF410E616
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Sep 2023 11:47:20 +0000 (UTC)
Received: from pps.filterd (m0168888.ppops.net [127.0.0.1])
 by mx08-00376f01.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id
 3866fpB6018775; Wed, 6 Sep 2023 12:47:01 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=imgtec.com; h=
 from:to:cc:subject:date:message-id:references:in-reply-to
 :content-type:content-id:content-transfer-encoding:mime-version;
 s=dk201812; bh=LTnyGqS6Gm9lZ1jLk1EToItu5YqLSvC0AYAjoZNSICI=; b=
 ttPv99TnilSrdFp9j8DnQ0wBnH00bRlHkdmIhFwm4tCBLoZ8Y4Ms+9MC/k+pgGsb
 mOvL8o26OVcZrPa+frJ98nkwGsqnTXcVzYH//+27kF+7C9O7ZbNxI/y8Lgx/qReB
 /MlYBBr1l8qkt21BPQr5TL8Z5iiWt6a5dzlVhMRQEQVdDBi0AQ4NDERsnYG+z1vC
 XF5dh44+I96Y7AQKq2sCPT3TGjdg5WrCpjKrqAY23gw0tNzQwCuZlV4XfIcpFJ9D
 jreHo9O65u62QknHcoDt9knMHY5674G6dbQju6L+o0nF7/6MtIl/S9kA8yIFmy63
 kllvEp/OZrwN659pYeF7Mg==
Received: from hhmail04.hh.imgtec.org ([217.156.249.195])
 by mx08-00376f01.pphosted.com (PPS) with ESMTPS id 3suuanu5b6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Wed, 06 Sep 2023 12:47:01 +0100 (BST)
Received: from HHMAIL04.hh.imgtec.org (10.100.10.119) by
 HHMAIL04.hh.imgtec.org (10.100.10.119) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.31; Wed, 6 Sep 2023 12:47:00 +0100
Received: from GBR01-LO4-obe.outbound.protection.outlook.com (104.47.85.107)
 by email.imgtec.com (10.100.10.121) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.31 via Frontend Transport; Wed, 6 Sep 2023 12:47:00 +0100
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FDcsNIj1Q0MNZj6nQIJP4AEVbNolT0AOAc8e0SqAq6tVvb+D1/fC5iAmAQ3dvImEsQ7cUhzp/0k1BqRUAZyYBFqpsicqch+bQs/ENZok4SpTeAeSgeXHcQaMuRO4F7R9cBigKdUYJKBU6v455LubP35dg6568ECGqNDmNLF4o0mmx7Dp9pn7pbWjSu05cIWTQF5G5Kw2ZRNaB5u3PtISmADAcfzToC6sS2OpUCB79rnaVL9JKQQ7IjP6b+u+D/EMr7BoFzUgZHJrEaRJkNHBF2PSJJaeVx5L2q/KFZUUeSNM1iGkAYOUN6hoSGJspUT662QQdBP1bB33QGj9Z6Lo+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LTnyGqS6Gm9lZ1jLk1EToItu5YqLSvC0AYAjoZNSICI=;
 b=FCy2/CG6NHaEjPhqRFfXgMJzBtbQlyYNL7gECB6wMIv+03rX4hzg9S5WKLhZJ5Hcurmgc8jEn82pSTcdD/AFXuEWTa+I68W/OIb73E7pCpvIK5wmPLq38MuR7+c7jT2UzuupWwg1+nMEQ7TUvTEcYz5JTFAGoOzlvuiW9GIdRnWDAg9kLTc9/SSn9Lse3rwVcN8CB5tf+1kug9lWiRdc45ikXrTXMR/00lc3gF8ZhDvlvdkG1mQyTIBtWbaoC47b2Zca2XfungFHzEJo+UdcPOFh948YHH31KA3Pz/edgMFaBhWTdP0AuyhY2uqvIG/Jr3yzWlDy3Hgvxm9PTKXbcg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=imgtec.com; dmarc=pass action=none header.from=imgtec.com;
 dkim=pass header.d=imgtec.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=IMGTecCRM.onmicrosoft.com; s=selector2-IMGTecCRM-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LTnyGqS6Gm9lZ1jLk1EToItu5YqLSvC0AYAjoZNSICI=;
 b=NIeKUNUNp4Q5vyHceSp7fHuMvtgmPICoz3zNgVUUQOVanIepokqoIGHzSrxGD9nqKS3OVmJ0IsYey8tUhn1V11JA9uCxdMNj+SC3EvyxFwxhxl4pfKUpIulM2EJjrktI9nDV07OxPx5/2Py2tt3S9U6xdqORvLZ9Ky7gy/JJ8JU=
Received: from CWLP265MB4817.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:170::9)
 by LO0P265MB6711.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:30d::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.34; Wed, 6 Sep
 2023 11:46:59 +0000
Received: from CWLP265MB4817.GBRP265.PROD.OUTLOOK.COM
 ([fe80::b3c:3f6:e3d0:a81b]) by CWLP265MB4817.GBRP265.PROD.OUTLOOK.COM
 ([fe80::b3c:3f6:e3d0:a81b%6]) with mapi id 15.20.6745.034; Wed, 6 Sep 2023
 11:46:59 +0000
From: Sarah Walker <Sarah.Walker@imgtec.com>
To: "mripard@kernel.org" <mripard@kernel.org>
Subject: Re: [PATCH v6 02/20] drm/gpuva_mgr: Helper to get range of unmap from
 a remap op.
Thread-Topic: [PATCH v6 02/20] drm/gpuva_mgr: Helper to get range of unmap
 from a remap op.
Thread-Index: AQHZ4KhYEllkF+MchUKWORdViOvrhbANqzKAgAADLYA=
Date: Wed, 6 Sep 2023 11:46:59 +0000
Message-ID: <3aa9ad51c2a157f9256e908152ea2545a543a15f.camel@imgtec.com>
References: <20230906095542.3280699-1-sarah.walker@imgtec.com>
 <20230906095542.3280699-3-sarah.walker@imgtec.com>
 <7z6t4sudgits372e26f37gydfxxonsduiajurr7ztgvmh3crch@mbeb66xwin5s>
In-Reply-To: <7z6t4sudgits372e26f37gydfxxonsduiajurr7ztgvmh3crch@mbeb66xwin5s>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CWLP265MB4817:EE_|LO0P265MB6711:EE_
x-ms-office365-filtering-correlation-id: 840a07d0-e75d-43d1-f356-08dbaecefacc
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: nxlNyCXo7QxhzYM4OcSN7LNDPCjviRt4PtYDCun6tmABmmxfD/0dAv65jr3qc22shoLdeSv42Vw2+AtIp6MGVCA4on/WsD223Pv0G9GR96OSgO4rH7tVUl4XypgBfKM35H3g/IUlrK8pYGhuvoL3gSjCOD9xa8lsrgYZyIE+XZYKv5bEgE5P0koDw0lam4ihEDdFYngSBBMEWk2FHtXCHQGh3EsGx7wPFenyyTgGNk4g6pn8Fh1fnEAtFpStMyd22AOOVnzFszGGIAudXOMaNy9YIVatJb6qCLpl6A3OkAabYkdlJD1fet1W3BNNPpQASOP/1aTDp4wUNkiFT6HbNYbzJ6nMbY9xY8Vz4EYQTRIjtI/FnLQXtKXoO93og3nE6v1aYeyx4lbG/pHuccjcXaOVPcRILRz8jCZmMmfjj0Aq7Jf5YEaQSQw5/hhq3NQW7niHFgviHpmau8FxplIMvhOPICvJhIDUboNyeCoo3acHYIwG2H4W9v86C/VA3qzZ1GLe/kx6MEnEE/o3icLy3H/hmIpLs21ZE5x12QgJ85ALOzcpJrl/dqMoUxQIaF2cR1nAxv888IEZp4/C+UZ8fPqEh0VfJ3hfbBPu4yt6UKea/PU9hMD52DQL+DrmLhIG
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CWLP265MB4817.GBRP265.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230031)(39850400004)(136003)(366004)(346002)(396003)(376002)(451199024)(186009)(1800799009)(122000001)(6506007)(6486002)(71200400001)(6512007)(4744005)(2616005)(2906002)(26005)(478600001)(7416002)(66556008)(41300700001)(66446008)(6916009)(64756008)(66476007)(54906003)(66946007)(316002)(76116006)(5660300002)(4326008)(8676002)(8936002)(36756003)(38070700005)(38100700002)(86362001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?SDNVZTV6ZVdRM1RyMThFU3VUWkkxSkc3bFJmZmlUcDVKTkwzMW1JMCtFeHBl?=
 =?utf-8?B?TVo4QjcxQWNFRDRhSFVoY2RoZWQ3RFRiYTFxcVhsby9BVUZZTU82V1NrdFl6?=
 =?utf-8?B?SFZZM3NOdVlxS0IycDZFYi9mNXdsclFmN0NCeG5lajBrQ0ZxKzV0TUJTZXEx?=
 =?utf-8?B?ZzNSaDFXb1o3WWZXWUsxdmFFaVhURWFRdW9ac1Yrb28vVlRDOTg1eWJkd2FP?=
 =?utf-8?B?L0xKSS9pUkxxNE1nNS9CdnN4YzZsMWhodDBOWTZkYlAxbkxzd1FqcmJYVlpY?=
 =?utf-8?B?T01tME9EOVZxZkgrMG4vckovb2dudG5sY0VaRHBQMHJMMlJrVUhodGpsdkhJ?=
 =?utf-8?B?MHY3V0VpYTFHRWZUNm9uRy9yVTB3TWdRNzVJcER6ejZNWVAvVVZGNktMcXAv?=
 =?utf-8?B?V2lnTDRZMmQ3R2k5ZGM0S2haOUtMSjllZjQxR2RuUncwdm1vR0JlN3Y5RE9t?=
 =?utf-8?B?bGFUUldzUjlkVkNZZ1J6NUFsaXp5a2cyaFZ0YXFJVFVhR0ZiNFFaZzMrNnhj?=
 =?utf-8?B?b1JrYTZ5L2JabXpiK0h4Uk13b08yZndDS1ByQ3lIR3BiODVXVVdmR3Fja1JW?=
 =?utf-8?B?MFpKc0hrMDFXcjZxejJmblBSNEhDWktTdDVDTkdlTDQzLy9zbjVUeWgvSk1x?=
 =?utf-8?B?eHcwREt2Sm5HcGNUK1RCU0NhUlhKUC9UTlpTMWl0K0JnRmJ6aFErS1JRelIr?=
 =?utf-8?B?U2VBeFJqQWNHMGVTMzZtcnRtV0szSnNOVXVvRThoTCtqaUxVbEhNbUJwdE5C?=
 =?utf-8?B?TndrL0NwNjlZM1BMTjN5dVB5T1hKQnZiVmFZVHFYcFVOUzF6aFNaRnhFdTdV?=
 =?utf-8?B?OXNHcm15ZXNKa1hjWUJta0ExcldpUmhvZlpIMmdqRHZxK2NucWMyOUhqNXdo?=
 =?utf-8?B?dVZhRHIwRHBLRVRqOGt4QzF5RS8rTWVlVjE0cEw2M250aVl1TTBMaVFudzdF?=
 =?utf-8?B?N3loZHJqVWlmNE5FMWQyUTEvbzJIcFo3WWU0TnJxMjByUjFrU1QzaXNCWENH?=
 =?utf-8?B?WE9ab3NaSUE3U0xqQ29mZDVVL205dGtxSlIrT0YzdG1ZRWVBT2ZSRnRiZlJl?=
 =?utf-8?B?M0ladDZ1c3FHNk9UaElLeWJkNWl6Rnl3RCs1Z0JlOEpiWnVqVkF2Q3Q1YlYw?=
 =?utf-8?B?Qk5ZMDRvR1VBdzExZ2d2RTBjbzY4ZU1MS1hZUE1yeGJMOFlsbFlSWU9KUVZn?=
 =?utf-8?B?TkFlZDR0RlFuUkJzVnpvNzI1RUIrMXN0NWhKclRhd0hSR0NnSnNiM2xIczQw?=
 =?utf-8?B?UEIzZnViS0pxU2UvN3BmRTVLL1RwSVR6c215RnU3Z2Q1SWR3b091NmpaVzg2?=
 =?utf-8?B?dWhtWDgxR1ovMU9ob3N1QWpRZmZMak9uUUxDUkUvRGJQTDZmZmJGdmdUZzV4?=
 =?utf-8?B?WjRPTklsTG52ajMvb25DNUlFUFA2YlBZSk5RbWtxN1E1OUZRQzUvZDEyb3lS?=
 =?utf-8?B?LzRldkp6MC8xNmI1L002ODZIMEdoQndPaHhKNWZKSDd3ZS82VWtRWGpHMlg4?=
 =?utf-8?B?U201ekJpMGl1RWtEZ0h1bFN0L0RSZjNMa1NHeFNZaUREZlhZeW5lRXpQQ3U1?=
 =?utf-8?B?U2N0QXR3UXlhM3c1bWJQWTRWVDYycE5BcndZQnpvZ3ZGUU51cTN2MCtjcXZn?=
 =?utf-8?B?SFlIWWs0elNYRnZiODl1OGFNUGFCb2VaSGVLK3NCV0NQYlF6T1FabEVmNGVG?=
 =?utf-8?B?Ynl2QWxrMUJyWno0Slk0YXFKcnRua0Fqa3pOS0ZYSU9CWFlxYzBKMTJ6UnNs?=
 =?utf-8?B?TnZ3elRrMmVPcW5iKzlXVnk4QjdQMnFJa2NTMUFIa0hqRjU0TDNNMVlZTDMx?=
 =?utf-8?B?UXZsMVRmcnlyYVVRRzR0clphckVkRm1Kc2YwY3AzWHBDRzByVTI1NEhqQ1Nl?=
 =?utf-8?B?Tmk5ZG1BRGxHOHlhbWxzSUJ5djQvMUFoalNCZm54M1Vla29FSUQ2TXBVRUxH?=
 =?utf-8?B?eEg4ZWJHR2lzcHNNbDNHYVJBNEx3N0JhQy93OVlmWklMTE16ZEErZnFUL2RJ?=
 =?utf-8?B?OUFsVUl5M29UMHNFNmhPK0RSRkZnQnd1THZ1V21tMkVUSkI5L21UMWtCeEVt?=
 =?utf-8?B?Nk9LZ0RRL2RqaUJPYmhseE5HM1Nid1dXaGVvNVAvdDB6bUFGQmJZREVBTnht?=
 =?utf-8?B?bHc1c3VvaG5QTC8yZ0VOYWpxbmltSlM3UktTMjBqWU1SQnBzaXU2Y2hRNXI3?=
 =?utf-8?B?Z1E9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <6157F0151803424783D46B1825B89F72@GBRP265.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CWLP265MB4817.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 840a07d0-e75d-43d1-f356-08dbaecefacc
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Sep 2023 11:46:59.6684 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 0d5fd8bb-e8c2-4e0a-8dd5-2c264f7140fe
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: GYkqfFIvP964OCihJPjq7KplUE18AUXBlccappmOtn3cRQSQMOXDhJdC6XdQpsnHMPV8seC7OzXXDo0b1gDalg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO0P265MB6711
X-OriginatorOrg: imgtec.com
X-EXCLAIMER-MD-CONFIG: 15a78312-3e47-46eb-9010-2e54d84a9631
X-Proofpoint-GUID: U_-mj3QUQvpWCf-ZMHo7EBVtbDYrk-9p
X-Proofpoint-ORIG-GUID: U_-mj3QUQvpWCf-ZMHo7EBVtbDYrk-9p
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
Cc: "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
 "hns@goldelico.com" <hns@goldelico.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "krzysztof.kozlowski+dt@linaro.org" <krzysztof.kozlowski+dt@linaro.org>,
 "matthew.brost@intel.com" <matthew.brost@intel.com>,
 "corbet@lwn.net" <corbet@lwn.net>,
 "luben.tuikov@amd.com" <luben.tuikov@amd.com>,
 "dakr@redhat.com" <dakr@redhat.com>, Donald Robson <Donald.Robson@imgtec.com>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "conor+dt@kernel.org" <conor+dt@kernel.org>,
 Matt Coster <Matt.Coster@imgtec.com>,
 "robh+dt@kernel.org" <robh+dt@kernel.org>,
 "faith.ekstrand@collabora.com" <faith.ekstrand@collabora.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "afd@ti.com" <afd@ti.com>,
 "boris.brezillon@collabora.com" <boris.brezillon@collabora.com>,
 "tzimmermann@suse.de" <tzimmermann@suse.de>,
 "christian.koenig@amd.com" <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCAyMDIzLTA5LTA2IGF0IDEzOjM1ICswMjAwLCBNYXhpbWUgUmlwYXJkIHdyb3RlOg0K
PiBIaSBTYXJhaCwNCj4gDQo+IE9uIFdlZCwgU2VwIDA2LCAyMDIzIGF0IDEwOjU1OjI0QU0gKzAx
MDAsIFNhcmFoIFdhbGtlciB3cm90ZToNCj4gPiBGcm9tOiBEb25hbGQgUm9ic29uIDxkb25hbGQu
cm9ic29uQGltZ3RlYy5jb20+DQo+ID4gDQo+ID4gU2lnbmVkLW9mZi1ieTogRG9uYWxkIFJvYnNv
biA8ZG9uYWxkLnJvYnNvbkBpbWd0ZWMuY29tPg0KPiANCj4gU29ycnksIHRoaXMgYXBwbGllZCB0
byB5b3VyIHByZXZpb3VzIHZlcnNpb25zIHRvbyBidXQgSSBvbmx5IGNhdWdodCBpdA0KPiByaWdo
dCBub3cuIFdoZW4geW91IHN1Ym1pdCBhIHBhdGNoIG9uIHNvbWVvbmUgZWxzZSdzIGJlaGFsZiwg
eW91IG5lZWQgdG8NCj4gYWRkIHlvdXIgU2lnbmVkLW9mZi1ieS4gVGhhdCdzIGFsc28gdHJ1ZSB3
aGVuIHlvdSdyZSB0aGUgY29tbWl0dGVyIG9mIGENCj4gcGF0Y2ggeW91IGRpZG4ndCB3cml0ZS4N
Cj4gDQo+IFRoaXMgb25lLCBhbmQgcGF0Y2ggMSwgYXJlIGFmZmVjdGVkLg0KPiANCj4gQWxzbywg
Z2VuZXJhbGx5IHNwZWFraW5nLCBpdCdzIGEgZ29vZCB0byB3cml0ZSBhIGNvbW1pdCBsb2cgZm9y
IGEgcGF0Y2gNCj4gdG8gYXQgbGVhc3QgcHJvdmlkZSBzb21lIGNvbnRleHQgb24gd2hhdCB5b3Ug
d2FudCB0byBhY2hpZXZlLg0KDQoNClNvcnJ5IGZvciB0aGlzLCB3aWxsIGdldCB0aGVzZSBpc3N1
ZXMgYWRkcmVzc2VkIGJlZm9yZSB0aGUgbmV4dCBwYXRjaHNldC4NCg0KU2FyYWgNCg==
