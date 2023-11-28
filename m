Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 24A1C7FB7F4
	for <lists+dri-devel@lfdr.de>; Tue, 28 Nov 2023 11:34:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6219F10E4B2;
	Tue, 28 Nov 2023 10:34:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx08-00376f01.pphosted.com (mx08-00376f01.pphosted.com
 [91.207.212.86])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BBC4F10E4B2
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Nov 2023 10:34:38 +0000 (UTC)
Received: from pps.filterd (m0168888.ppops.net [127.0.0.1])
 by mx08-00376f01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 3AS701jQ005591; Tue, 28 Nov 2023 10:34:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=imgtec.com; h=
 from:to:cc:subject:date:message-id:references:in-reply-to
 :content-type:content-id:content-transfer-encoding:mime-version;
 s=dk201812; bh=KEh9gVnOrUfU/0jZdd9rqXjoiO7xDa2TEpDdq/R7jpA=; b=
 g9mV9gC6SO0iKOnHtQSk4ag60UFel3zXNjI7ikYrH24Bsm7GwK/e+7KLdDdtVTlo
 MWeqnMLBG48nxXznb7cUzkA4jV6fgSDjCOHIoCK8OrwMunYKnks/B9hDUo0KXbLm
 nRJylVAwyrw5vXTebz4oxtZeB6SK6PrxX1C5REXfXxeRSQLiJRq8SKE8PSC6W8x4
 vwEhbJW1vkM3gTnD8IKywMF2FUPa2ahyH9IeD8QNRIXZxEmrM5bXmnPJ7VzrOdBQ
 m8EOvtzY/S7ESQFM3WbvY8olJFIM6WPHb0t28EYj8XbexeAlwAKXSrH28BG66zU0
 6M/blAjUOe+CvnJ373hrtA==
Received: from hhmail05.hh.imgtec.org ([217.156.249.195])
 by mx08-00376f01.pphosted.com (PPS) with ESMTPS id 3uk82sj1dp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Tue, 28 Nov 2023 10:34:30 +0000 (GMT)
Received: from HHMAIL04.hh.imgtec.org (10.100.10.119) by
 HHMAIL05.hh.imgtec.org (10.100.10.120) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Tue, 28 Nov 2023 10:34:29 +0000
Received: from GBR01-CWX-obe.outbound.protection.outlook.com (104.47.85.40) by
 email.imgtec.com (10.100.10.121) with Microsoft SMTP Server
 (version=TLS1_2, 
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.34 via Frontend
 Transport; Tue, 28 Nov 2023 10:34:29 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lbQ012RQnwk+/HEq6qVo0wlLuZnM/AjeyNHEA5FatzFMcDImhQWDwIJpQQ6nrjNKGCLTx1yV5erIpIML2LJOVcH1h12qNb+9V9fYiUwZetf9wjs+6lTbyBIxptP/D/zNi2LKet+KoWD3oL2YU6PkVyMFA9rSfgIm3dCPVL0/Mmyjl1rfkGGxdhH91Hu421Jp5NYLWkfGHhSRrKSFCXm9yw5drzt35KNgILNnD12VMIN83j8A3wXHjmb4s+KCmSP8VneedNlmvNoioZfufsdemeiVTMvFsOSwPhv0JrcyCfeosPPux86Nh93La9qh/1SppoekD8o4mxYEQfs+Rz1kGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KEh9gVnOrUfU/0jZdd9rqXjoiO7xDa2TEpDdq/R7jpA=;
 b=ntwABNmhFvkFwXh2CF/e3Bl/HgCbDBtwXppnKHK/ZCXzRf8RCcHWQ0AJmbvRiEA0ejleIP1htb13rukoxnanQfQ5oTfHj/4MyB9DEcEjdwgKbXEJNiWqUPMdoVt9Dj628SQAW5mA8pt6S/Z5ISmhrxl38QQ9bNpM89nuuO8oD1YAF8ELFpfVTdCKnMcdbLANk7cgGGiDFHGjJ1CvbIXoU+dQjWVzgcGrsUBsHm8wQYAU/tZ8euR7WDv79hQjr3Rj283HAk0EtZHUe+T42uhQrp3c4w0pcab6Y9Jol4oaWFgAIv5iVAghRVnx4XjsnLnK2gWnFOYUnYnKQ0Q0eNQBlw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=imgtec.com; dmarc=pass action=none header.from=imgtec.com;
 dkim=pass header.d=imgtec.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=IMGTecCRM.onmicrosoft.com; s=selector2-IMGTecCRM-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KEh9gVnOrUfU/0jZdd9rqXjoiO7xDa2TEpDdq/R7jpA=;
 b=hccNCXzyzWsX5SoZZNlJJNWs37FKCzO41MsS8LLPTMELy4OBO+HfDDAQByK34ghxaHCMTVDFo/kA6ziQq0vlnGiAwvd0jyUk81JOQkVCwglFFz2VFnouwnQc042JNXSB3rGR/AddwUxMg4C8zUOxUcnaM9UxzfRxN+TRD6ARwBw=
Received: from CWLP265MB5770.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:1a0::8)
 by CWLP265MB6036.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:1d2::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7025.28; Tue, 28 Nov
 2023 10:34:28 +0000
Received: from CWLP265MB5770.GBRP265.PROD.OUTLOOK.COM
 ([fe80::a85a:76f7:c085:2b34]) by CWLP265MB5770.GBRP265.PROD.OUTLOOK.COM
 ([fe80::a85a:76f7:c085:2b34%3]) with mapi id 15.20.7025.022; Tue, 28 Nov 2023
 10:34:28 +0000
From: Donald Robson <Donald.Robson@imgtec.com>
To: "daniel@ffwll.ch" <daniel@ffwll.ch>, Frank Binns <Frank.Binns@imgtec.com>, 
 Matt Coster <Matt.Coster@imgtec.com>, "mripard@kernel.org"
 <mripard@kernel.org>, "airlied@gmail.com" <airlied@gmail.com>,
 "dakr@redhat.com" <dakr@redhat.com>, Sarah Walker <Sarah.Walker@imgtec.com>
Subject: Re: [EXTERNAL] [PATCH drm-misc-next 2/5] drm/imagination: vm: check
 for drm_gpuvm_range_valid()
Thread-Topic: [EXTERNAL] [PATCH drm-misc-next 2/5] drm/imagination: vm: check
 for drm_gpuvm_range_valid()
Thread-Index: AQHaHy8m8V15aqLP+E6gvCfwYoYaubCPjo6A
Date: Tue, 28 Nov 2023 10:34:28 +0000
Message-ID: <bcd3a9fb156c773ac942818213e6192fe36dc6ac.camel@imgtec.com>
References: <20231124233650.152653-1-dakr@redhat.com>
 <20231124233650.152653-3-dakr@redhat.com>
In-Reply-To: <20231124233650.152653-3-dakr@redhat.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CWLP265MB5770:EE_|CWLP265MB6036:EE_
x-ms-office365-filtering-correlation-id: c049d95c-696f-4bbd-c851-08dbeffd9953
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: LdaKXvprwrt60hDiEnFDPFU8CFb4dC49/wqA9zxh1U2OsiWlwFMLA4zKYeKwsRd1G1cO0GNsst3CIvI2OjAW0rWvBInRXLqTGLfzRnRqukSynEgxSPBMhwPZp5DnHb4o4G0x5mGZUhORJs4ZLbjBt6R2dX2nlDlYpHG7Td3lSAG6lO13iOhQkZYxiTsCXGB8wlvFR9uYr/Ni3jX/u5nLY2oh50omMIN74/UHSUSuf7ZwcfNudjT7bPWWzbndaAssm0/O32l65dVh+jCH/JRkuC9Kro25tNcsyzB77ouuF6z+HZoM697CWfRv6RQLR68gyWWXk1HrbfK+0EyrWFAcBWOgV+DhUiJeGtsOZ1I/Tko8DCNhE0RALK/6IrwxCYpKkYuyA2JRKV8fTOmjHO7/oXNqae7nXl7Hj8dVKN/FMVqdwf8bs4fveJT8Xf2iefnt70DEMpqSdnUysZ/0ejhy5fHJTADL1xtDJ1mNQuUL254ulRD9meKfs0JRJRVX0jh79BRid+TRzponkFoYOs7TEvaIxGo2h4hQpTUg2I9BpNWMUMgkHLUqWyMPjl6DZAlY/fTbY7Qiq+kFKI42KLHNCvbaA6X05Oel2kb1s20m9HDyJhHxiBCDvHzPc1Dx18VJ22M3VCaEQXs94JeKFencBsdroXvaNUR2wTeRSq5PU+8=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CWLP265MB5770.GBRP265.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(346002)(39850400004)(396003)(376002)(136003)(230273577357003)(230173577357003)(230922051799003)(1800799012)(186009)(451199024)(64100799003)(8676002)(91956017)(8936002)(5660300002)(4326008)(66946007)(64756008)(66556008)(54906003)(41300700001)(76116006)(6636002)(66476007)(66446008)(316002)(6512007)(71200400001)(6486002)(478600001)(4001150100001)(6506007)(110136005)(26005)(83380400001)(2616005)(2906002)(38100700002)(86362001)(122000001)(38070700009)(36756003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?dkkxd2oyZnY2YklucGV4OGhFTmR5RTJDbFVCYWlaOG4wOFlKMHhsS2Q5K2R6?=
 =?utf-8?B?UjFjNWE4RjVETlc3V3lKRCtUczgyeHYxSnpCRmVhNUVWbFExTnFRaWhmbHdK?=
 =?utf-8?B?SlFZeDJxTlB0REgxSFBqanJKaG90VWFLU3B0WExmaDBNUFM3d1RnS094eEM3?=
 =?utf-8?B?Vll3VEh5b0tvNnhicngzbngycGdIaXRETDNISFdxdU5RYitTVzF2RXR5bGd2?=
 =?utf-8?B?VDREa0RIZkJ2WHlDcmNzOWc4QjdFaE5vTTM5SGRuSHVwOEVSOUNlc0hMYUVo?=
 =?utf-8?B?WmN0ZmEzbnFNZWZuak1LRVcvcWZ6cForeG5EejZXL2w0VW1jcmJxc0UxeEJn?=
 =?utf-8?B?RGR1T3VpMklXN2FTeFZmNW1WY05qUzd6RjNrYjdVaWpjb1M3bStWS2RzVi8v?=
 =?utf-8?B?cGNuYzFYTmNGODNrUDZIOEpZanN1dXg3dGNRM2hjRUcxbE04R3pqd1ZUdEFy?=
 =?utf-8?B?MHlBWHpQdmtKNHVXZkEzbm43WUs3S1g3RmF4MFVyaStZYmlxQTJlblRSZG9a?=
 =?utf-8?B?RllJZnJTWlFxM0VsMkpmN2g0R0NGaVBTRlozWjVTSGczcnM2a0V5QXFOSGwv?=
 =?utf-8?B?NGkzQUF4MFVNbkx0OXdNeDd3bDFhbUVNeUlqV1lFU1gvL0ZabEtCQisyVUpq?=
 =?utf-8?B?Wkg3N2ZiUDd4SzcvaG5pRy9aaUZnc0F5MTFkWkFiOEpqTUxiUmsyZEJoMHNE?=
 =?utf-8?B?ZjRtQXUzMjIzNFAvbC84L21tTkhvdVVBSkJ3bHpWQk1EL1NZYm45MWUyZVNh?=
 =?utf-8?B?dlZKcHBPNmpDbE9nem5abWZmWncvanBWWWdlMWk4MklOdVQ4QnBGZkcwbE9H?=
 =?utf-8?B?bDJKVDI3OWJNYkJtaFlBenpTYzY3anhmUUFxMW92dERZSDg3VXZsa2ZEMXIv?=
 =?utf-8?B?L1RhMnRnMmI2WERCd0s2NXlIdUxtNHI3NnNaSUcvZEFuUit0amFZL0ZFbWVw?=
 =?utf-8?B?ZDVXei96eGJPNitVYmxwMnRhK2Voa21xUTVqenlmMkhUcXVmS2xZeVJZeE9P?=
 =?utf-8?B?Sm4rWjA4L251cDUyZExGR0l1RTUzYWRTM0NKL2ZvMk9MUWg2TlUzNktoYSt5?=
 =?utf-8?B?VGd6UnFMcHErOHg5elBiUHpNRzgyZGZBajlUcGhJb09IS0pTZFMzb3J0M0hI?=
 =?utf-8?B?UGV1VkpENzBHRU44aWVpK2JRYXVPVVJLeGZnZmNwMURqS3NZcXNEblhDajNh?=
 =?utf-8?B?K2hiZmdGSFN6Z0hUYk5qS1Y3NDRvenRwL0hrYkVNL3FyRkM5SlpmampPbEhi?=
 =?utf-8?B?NzRkcVE0YnpWWkloKzJLR1c5YWlCUGNHajZUSmJZR0t5R1h5OG5UQ0RqR1Av?=
 =?utf-8?B?endORWNCREtxaXZyUHE0enp3aElaSFVqMnFwN1ovbHdYR2MxSys4QjBkSmhJ?=
 =?utf-8?B?TnlJNTUwRlpBSHFtaFkvWVRTYWgwbzZza2JLTTNpVlBIRTdCRWZLTWprNDVR?=
 =?utf-8?B?cU00dHR2RFFyai9nc3dYZzY1SHdSWjByTWx5UGtGbTFoVjQ2OTJNVGg0NUpu?=
 =?utf-8?B?N1FiU0pNZjdWcjNpak44Ulp0KytuMnJyYjNaS2hiTWsxTUZWcjZvYTNBaWNq?=
 =?utf-8?B?TXAyUDB6dDl4d2Rydms3YnhSdkF2VHBQcTgyNjVRNkhFMFpBOXA2aUFYOXFL?=
 =?utf-8?B?bUNlQXFQSGsvbEYrOXZCRUtCZ1Y0R1JFSDREeXpGVGlRbDdPSlBXUTlpVVdn?=
 =?utf-8?B?ZnJMVy9pSGZvZEJoWHVhTDFzK0xUd2Fua0VzRFBLSndNYW1MQXlwL0h0bTNY?=
 =?utf-8?B?NkhxVTA3U3JOclU2d3YzMGpPWkIvV3VkcnpiOGk0bDBWRzhLWXhzaVRMWjBa?=
 =?utf-8?B?WkF3aG5XQjlSbVl5cUVtdEtPNE9UcHZNbWkzTU82ZStieWY3VVhkaTBpeW03?=
 =?utf-8?B?ZEZtbUl3RzVkUUtKTzFSNGNWZkVVeEJPMG9XNGNTem4vNWlYdFlPV2xnQ2dh?=
 =?utf-8?B?aC9zSFNYbUV4L0gvZXFxU2tiV2ZyNnJCZ1V2T285RWJYR0lxZCs1UUM1U0hi?=
 =?utf-8?B?WlJkeWlEb3JuWDdvZEtpdy81UHh3WU96KzZJNllSSTRkV3BaN3RqQlp2KzE3?=
 =?utf-8?B?WG94bnUwVW0xYVg4VTBTekFqUnpQcTVxaVk5bkNMa3JQSGJvem5MdWxMSCtv?=
 =?utf-8?B?dy9MRmplRGk0NnNGR1ZhbEVBREJqZXFQRGhoZ0lNUnA5c1kzZTVYTzMybm81?=
 =?utf-8?B?Y1E9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <1FEEA37C4687B64F8B3BB8C2FC126048@GBRP265.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CWLP265MB5770.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: c049d95c-696f-4bbd-c851-08dbeffd9953
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Nov 2023 10:34:28.1208 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 0d5fd8bb-e8c2-4e0a-8dd5-2c264f7140fe
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: McENsWLUjEWXSDfk5JG95W5C3+a03zu11WnzsU+GzbWyajFNZkP8XhdIEsYUgKR6R0cexGmC2yIastEDISorOprbUuGVgc/ZPs832rcs7MQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CWLP265MB6036
X-OriginatorOrg: imgtec.com
X-EXCLAIMER-MD-CONFIG: 15a78312-3e47-46eb-9010-2e54d84a9631
X-Proofpoint-ORIG-GUID: j1RaxkQ7zBoLlkOvDvdZuXHHmzCIyQ1l
X-Proofpoint-GUID: j1RaxkQ7zBoLlkOvDvdZuXHHmzCIyQ1l
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
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhhbmtzIERhbmlsby4NCg0KUmV2aWV3ZWQtYnk6IERvbmFsZCBSb2Jzb24gPGRvbmFsZC5yb2Jz
b25AaW1ndGVjLmNvbT4NCg0KT24gU2F0LCAyMDIzLTExLTI1IGF0IDAwOjM2ICswMTAwLCBEYW5p
bG8gS3J1bW1yaWNoIHdyb3RlOg0KPiAqKiogQ0FVVElPTjogVGhpcyBlbWFpbCBvcmlnaW5hdGVz
IGZyb20gYSBzb3VyY2Ugbm90IGtub3duIHRvIEltYWdpbmF0aW9uIFRlY2hub2xvZ2llcy4gVGhp
bmsgYmVmb3JlIHlvdSBjbGljayBhIGxpbmsgb3Igb3BlbiBhbiBhdHRhY2htZW50ICoqKg0KPiAN
Cj4gRXh0ZW5kIHB2cl9kZXZpY2VfYWRkcl9hbmRfc2l6ZV9hcmVfdmFsaWQoKSBieSB0aGUgY29y
cmVzcG9uZGluZyBHUFVWTQ0KPiBzYW5pdHkgY2hlY2tzLiBUaGlzIGluY2x1ZGVzIGEsIHByZXZp
b3VzbHkgbWlzc2luZywgb3ZlcmZsb3cgY2hlY2sgZm9yDQo+IHRoZSBiYXNlIGFkZHJlc3MgYW5k
IHNpemUgb2YgdGhlIHJlcXVlc3RlZCBtYXBwaW5nLg0KPiANCj4gRml4ZXM6IGZmNWY2NDNkZTBi
ZiAoImRybS9pbWFnaW5hdGlvbjogQWRkIEdFTSBhbmQgVk0gcmVsYXRlZCBjb2RlIikNCj4gU2ln
bmVkLW9mZi1ieTogRGFuaWxvIEtydW1tcmljaCA8ZGFrckByZWRoYXQuY29tPg0KPiAtLS0NCj4g
IGRyaXZlcnMvZ3B1L2RybS9pbWFnaW5hdGlvbi9wdnJfdm0uYyB8IDkgKysrKysrLS0tDQo+ICBk
cml2ZXJzL2dwdS9kcm0vaW1hZ2luYXRpb24vcHZyX3ZtLmggfCAzICsrLQ0KPiAgMiBmaWxlcyBj
aGFuZ2VkLCA4IGluc2VydGlvbnMoKyksIDQgZGVsZXRpb25zKC0pDQo+IA0KPiBkaWZmIC0tZ2l0
IGEvZHJpdmVycy9ncHUvZHJtL2ltYWdpbmF0aW9uL3B2cl92bS5jIGIvZHJpdmVycy9ncHUvZHJt
L2ltYWdpbmF0aW9uL3B2cl92bS5jDQo+IGluZGV4IDA5ZDQ4MWM1NzViMC4uMWU4OTA5MmMzZGNj
IDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vaW1hZ2luYXRpb24vcHZyX3ZtLmMNCj4g
KysrIGIvZHJpdmVycy9ncHUvZHJtL2ltYWdpbmF0aW9uL3B2cl92bS5jDQo+IEBAIC0yMzksNyAr
MjM5LDcgQEAgcHZyX3ZtX2JpbmRfb3BfbWFwX2luaXQoc3RydWN0IHB2cl92bV9iaW5kX29wICpi
aW5kX29wLA0KPiAgCQlyZXR1cm4gLUVJTlZBTDsNCj4gIAl9DQo+ICANCj4gLQlpZiAoIXB2cl9k
ZXZpY2VfYWRkcl9hbmRfc2l6ZV9hcmVfdmFsaWQoZGV2aWNlX2FkZHIsIHNpemUpIHx8DQo+ICsJ
aWYgKCFwdnJfZGV2aWNlX2FkZHJfYW5kX3NpemVfYXJlX3ZhbGlkKHZtX2N0eCwgZGV2aWNlX2Fk
ZHIsIHNpemUpIHx8DQo+ICAJICAgIG9mZnNldCAmIH5QQUdFX01BU0sgfHwgc2l6ZSAmIH5QQUdF
X01BU0sgfHwNCj4gIAkgICAgb2Zmc2V0ID49IHB2cl9vYmpfc2l6ZSB8fCBvZmZzZXRfcGx1c19z
aXplID4gcHZyX29ial9zaXplKQ0KPiAgCQlyZXR1cm4gLUVJTlZBTDsNCj4gQEAgLTI5NSw3ICsy
OTUsNyBAQCBwdnJfdm1fYmluZF9vcF91bm1hcF9pbml0KHN0cnVjdCBwdnJfdm1fYmluZF9vcCAq
YmluZF9vcCwNCj4gIHsNCj4gIAlpbnQgZXJyOw0KPiAgDQo+IC0JaWYgKCFwdnJfZGV2aWNlX2Fk
ZHJfYW5kX3NpemVfYXJlX3ZhbGlkKGRldmljZV9hZGRyLCBzaXplKSkNCj4gKwlpZiAoIXB2cl9k
ZXZpY2VfYWRkcl9hbmRfc2l6ZV9hcmVfdmFsaWQodm1fY3R4LCBkZXZpY2VfYWRkciwgc2l6ZSkp
DQo+ICAJCXJldHVybiAtRUlOVkFMOw0KPiAgDQo+ICAJYmluZF9vcC0+dHlwZSA9IFBWUl9WTV9C
SU5EX1RZUEVfVU5NQVA7DQo+IEBAIC01MDUsNiArNTA1LDcgQEAgcHZyX2RldmljZV9hZGRyX2lz
X3ZhbGlkKHU2NCBkZXZpY2VfYWRkcikNCj4gIC8qKg0KPiAgICogcHZyX2RldmljZV9hZGRyX2Fu
ZF9zaXplX2FyZV92YWxpZCgpIC0gVGVzdHMgd2hldGhlciBhIGRldmljZS12aXJ0dWFsDQo+ICAg
KiBhZGRyZXNzIGFuZCBhc3NvY2lhdGVkIHNpemUgYXJlIGJvdGggdmFsaWQuDQo+ICsgKiBAdm1f
Y3R4OiBUYXJnZXQgVk0gY29udGV4dC4NCj4gICAqIEBkZXZpY2VfYWRkcjogVmlydHVhbCBkZXZp
Y2UgYWRkcmVzcyB0byB0ZXN0Lg0KPiAgICogQHNpemU6IFNpemUgb2YgdGhlIHJhbmdlIGJhc2Vk
IGF0IEBkZXZpY2VfYWRkciB0byB0ZXN0Lg0KPiAgICoNCj4gQEAgLTUyMyw5ICs1MjQsMTEgQEAg
cHZyX2RldmljZV9hZGRyX2lzX3ZhbGlkKHU2NCBkZXZpY2VfYWRkcikNCj4gICAqICAqICVmYWxz
ZSBvdGhlcndpc2UuDQo+ICAgKi8NCj4gIGJvb2wNCj4gLXB2cl9kZXZpY2VfYWRkcl9hbmRfc2l6
ZV9hcmVfdmFsaWQodTY0IGRldmljZV9hZGRyLCB1NjQgc2l6ZSkNCj4gK3B2cl9kZXZpY2VfYWRk
cl9hbmRfc2l6ZV9hcmVfdmFsaWQoc3RydWN0IHB2cl92bV9jb250ZXh0ICp2bV9jdHgsDQo+ICsJ
CQkJICAgdTY0IGRldmljZV9hZGRyLCB1NjQgc2l6ZSkNCj4gIHsNCj4gIAlyZXR1cm4gcHZyX2Rl
dmljZV9hZGRyX2lzX3ZhbGlkKGRldmljZV9hZGRyKSAmJg0KPiArCSAgICAgICBkcm1fZ3B1dm1f
cmFuZ2VfdmFsaWQoJnZtX2N0eC0+Z3B1dm1fbWdyLCBkZXZpY2VfYWRkciwgc2l6ZSkgJiYNCj4g
IAkgICAgICAgc2l6ZSAhPSAwICYmIChzaXplICYgflBWUl9ERVZJQ0VfUEFHRV9NQVNLKSA9PSAw
ICYmDQo+ICAJICAgICAgIChkZXZpY2VfYWRkciArIHNpemUgPD0gUFZSX1BBR0VfVEFCTEVfQURE
Ul9TUEFDRV9TSVpFKTsNCj4gIH0NCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9pbWFn
aW5hdGlvbi9wdnJfdm0uaCBiL2RyaXZlcnMvZ3B1L2RybS9pbWFnaW5hdGlvbi9wdnJfdm0uaA0K
PiBpbmRleCBjZjhiOTc1NTNkYzguLmYyYTY0NjNmMmIwNSAxMDA2NDQNCj4gLS0tIGEvZHJpdmVy
cy9ncHUvZHJtL2ltYWdpbmF0aW9uL3B2cl92bS5oDQo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9p
bWFnaW5hdGlvbi9wdnJfdm0uaA0KPiBAQCAtMjksNyArMjksOCBAQCBzdHJ1Y3QgZHJtX2V4ZWM7
DQo+ICAvKiBGdW5jdGlvbnMgZGVmaW5lZCBpbiBwdnJfdm0uYyAqLw0KPiAgDQo+ICBib29sIHB2
cl9kZXZpY2VfYWRkcl9pc192YWxpZCh1NjQgZGV2aWNlX2FkZHIpOw0KPiAtYm9vbCBwdnJfZGV2
aWNlX2FkZHJfYW5kX3NpemVfYXJlX3ZhbGlkKHU2NCBkZXZpY2VfYWRkciwgdTY0IHNpemUpOw0K
PiArYm9vbCBwdnJfZGV2aWNlX2FkZHJfYW5kX3NpemVfYXJlX3ZhbGlkKHN0cnVjdCBwdnJfdm1f
Y29udGV4dCAqdm1fY3R4LA0KPiArCQkJCQl1NjQgZGV2aWNlX2FkZHIsIHU2NCBzaXplKTsNCj4g
IA0KPiAgc3RydWN0IHB2cl92bV9jb250ZXh0ICpwdnJfdm1fY3JlYXRlX2NvbnRleHQoc3RydWN0
IHB2cl9kZXZpY2UgKnB2cl9kZXYsDQo+ICAJCQkJCSAgICAgYm9vbCBpc191c2Vyc3BhY2VfY29u
dGV4dCk7DQo=
