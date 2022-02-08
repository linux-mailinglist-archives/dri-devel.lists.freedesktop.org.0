Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 275564AD32E
	for <lists+dri-devel@lfdr.de>; Tue,  8 Feb 2022 09:24:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E45D610E518;
	Tue,  8 Feb 2022 08:23:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2086.outbound.protection.outlook.com [40.107.237.86])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB7BA10E707;
 Tue,  8 Feb 2022 07:17:37 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fwOa21yprmSSBSa56OAbt5n3gmkMBmbkar+8LYdFd7UxKK1Wy0Dxmtt5swRWmWNPSQJl+DUKqMNB8l6jv47XIwVh2/VJ8wTrjrh+crpq4fw41tQ+Z9H8sq7QSH2LxxtGflhTX1IVG0/0gG2UVSPiFgxSl9MZ1kXVpMEDfjeckzXaX6+pTa3iWrenYlpD1W8qHeV4nZMZkGZEerAnjkRS7XCYHyBr+dNf7d/0D5rOargyNRcJ6Z5P4KDY/KSD/ovhZT2HHohC5bwbR/FutmDGiiq2JHl0+x3lWGJ+WybnXiXpdmNjbtjbYAFYItjcm3rJYqxRpTqpE259+wrHKxbSvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tNFOqf0seb7OGsE5TF+uG8DsOxHjqZpVB5pKzIjAU4I=;
 b=Idsa1wiJdOh/vifydWwBzb5Qxd8p/Vx40NFtZzS7E5yxix9dYImVgbZEFlmcCoFb3odPq34ZU+NJMTzu5OFMDT81WmOMAv/kqcSabLF6Twdd6SCzPJQG0JFXYwPWv+ZUL4Aq/F7/anfawKesfoVcELWK90+eLCUVy+fuyPETRIFF9+ly7XsEg7unuYl+3LLQyiggiLlpPEtrfFiiQ33rYyMHf/+Mo6agg0Zq8eWACo8tTSileNQON8pGfGbOS3s5VtFIQh5puCjkeaHFf6XdqnAKgxT+/8ZRiWCLKkI940efw2mjhKGKZqPGHf9a4GVeco/KbFUXcM11l/+EFgdW7A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tNFOqf0seb7OGsE5TF+uG8DsOxHjqZpVB5pKzIjAU4I=;
 b=mcBv3Oio9lzKGvxxhJByh7wtRNMagoG1zLcXDDGULh6k6ogI2ntBYs1IVNMxD60AQD6lasgJQC6T29K3hRfyWh9XGNsEGMjUD4wndYHp54trqsd8ExtVWooQ+3gg1npNggHa08rHF52dcYcXuXWrVufhK/UyOkaO+JfAPW7bMk6ff2bPWTfrtLt6aKI6hZhTUyAGSaB9qKlkyTVVZUBD8LMl6l+GO2fLthC8SE/UDN3L8DHYvIEB1PzRfhX7ulrI8ZAMdv8m1CWYLjYOKi+0UaHznvWYpuH9DSGSQY6Ryb3UY4lNmcuuL8yealNYrPJv5elE96km8B9ia4WF7MRW1Q==
Received: from MW2PR12MB4667.namprd12.prod.outlook.com (2603:10b6:302:12::28)
 by DM6PR12MB3337.namprd12.prod.outlook.com (2603:10b6:5:118::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.17; Tue, 8 Feb
 2022 07:17:35 +0000
Received: from MW2PR12MB4667.namprd12.prod.outlook.com
 ([fe80::846c:d3cd:5a30:c35]) by MW2PR12MB4667.namprd12.prod.outlook.com
 ([fe80::846c:d3cd:5a30:c35%5]) with mapi id 15.20.4951.019; Tue, 8 Feb 2022
 07:17:35 +0000
From: Chaitanya Kulkarni <chaitanyak@nvidia.com>
To: Christoph Hellwig <hch@lst.de>, Andrew Morton <akpm@linux-foundation.org>, 
 Dan Williams <dan.j.williams@intel.com>
Subject: Re: [PATCH 1/8] mm: remove a pointless CONFIG_ZONE_DEVICE check in
 memremap_pages
Thread-Topic: [PATCH 1/8] mm: remove a pointless CONFIG_ZONE_DEVICE check in
 memremap_pages
Thread-Index: AQHYHLvxBBtwWc6HbkSSxqjiw8sbQQ==
Date: Tue, 8 Feb 2022 07:17:34 +0000
Message-ID: <8c6a8d6c-bc23-226e-44aa-c89ab7c070bb@nvidia.com>
References: <20220207063249.1833066-1-hch@lst.de>
 <20220207063249.1833066-2-hch@lst.de>
In-Reply-To: <20220207063249.1833066-2-hch@lst.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 53adfc12-c599-4e34-9990-08d9ead31465
x-ms-traffictypediagnostic: DM6PR12MB3337:EE_
x-microsoft-antispam-prvs: <DM6PR12MB3337CD41FBE197BD7B707052A32D9@DM6PR12MB3337.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:962;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: rEVTxhqr5iH9c3z2F/K+2Cl8/b7dBNjD35SIUbSS9BK/8B/yQLdBkpeEV8hfxJbCCECkEOYipfK2I5+sQWM5h4f7L/51mdbx+aCrmeSW7lfe0XRqV1z5qjc67UZK8t2TNcxES7MOorWErQTo/er89v6V/EkahcRRRsKEPDC1uOzzfV/BmBCVZhOHD2gCR9VzxH1TdRav8HZ4xpvrw8+ekWVRhHKJks+7mpORXbE8/luFm34zbRKa6FP+0Bv8xdMN58DwrZ+4clUz9+h9YXlyBLRIOLSe23aWrZi086FrqesM5OptThOX2jsHf4qRhSdKQsYswBYaJyoGcleqmkdWsmytUhS0Mjl1NpI4V1D9mKLm+Yf2oftJK19OXt2uuSg876Z+6I0A6vHn/zYuhWzET27JOzDPo2u6JOKkzusrURhTLnaXuL5gymuI+KjuBmimpBdXTdtQIohkv6hPcfc82m9hcWylwek0+XXTO+F0Fr+gMQqVAqXCiEWu7iDTppP+CzcOUYNMqz2TalONsEUyklZ9CVZSuq5swJyArXyQ2tUQg4EEEJKajb5batJyF48/tqHrl0199k6jw9HiLm7O9FlHUUXUesh5Zv/ilTOmnV/HEPGCu03qJI4JlXnhMveuGbz+qJU/50Ftp0XDxqYJanx1cN6RF8kuccw+4u//tCHV7RQRMOi2NDJoHkdM7LM5DQgNbhjF2WOrWXErPZBK6yMOiHSAIZjXZ1N2Z+VMTR2UMySQkLwMsA1AxxNHyATrNdgqBaZxLcblj3xYCD7J0A==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW2PR12MB4667.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(31696002)(110136005)(4744005)(54906003)(64756008)(8936002)(8676002)(66556008)(66946007)(76116006)(66446008)(66476007)(31686004)(316002)(91956017)(38100700002)(186003)(2616005)(122000001)(5660300002)(6506007)(86362001)(71200400001)(38070700005)(7416002)(53546011)(6512007)(83380400001)(36756003)(2906002)(508600001)(4326008)(6486002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?TXJJOU5lUXVKdVAvWlhKc0tTTnk5MHF0UHlQeFRibG41REphUFVHTlRLSmRk?=
 =?utf-8?B?Um9nM1NKNGhOaGpWYW5jOHRneVhwSnhoUGtVSlFDT3NmRG50dXVUTTN0Rjgy?=
 =?utf-8?B?Y0FkMmtmdzJ6MnhEeWZONmZqVjNKRGUvQkhubzhxcXliZGJLaGFKTnpjaHdv?=
 =?utf-8?B?bGQ5b0dYNWR3SWdHY2o2NWtHRGlablgwNDVhSFFrRzFDK0ZXL3U4bTdQTTN3?=
 =?utf-8?B?V0tBTU9wc1R1TU9MaU12bzFlOW5sV3UyQ1hIeUV2OHpPYUQxVjc4M1NlY3Uz?=
 =?utf-8?B?ckFER3BOMzVpbjJrYW0vYWo5UHVKRmg0aHhRcUtQWFRad21UK3B2WlFWT0No?=
 =?utf-8?B?N1lJcWVoYXo1NHlhWUNtYnVIK2luanRZRWhma3d5NUl1SlVmOEt6M1R6eVY3?=
 =?utf-8?B?TnBoVW0rL3kxNFoyRi9TU0dlK2YwYk4wdGZralc4eWx5UjZpZjBOcml5aTZk?=
 =?utf-8?B?Si9LdTdWczZnaGV4U3pubmlXRmU5NnAxK2RFVHRJSjF6SENlb09sbWdLVmYx?=
 =?utf-8?B?c3BrYTR3R25yQmdhdHNpZWtTOVVhRnJ5UTJQYTJMbS9hbmh6Q1Buc1Q0R25M?=
 =?utf-8?B?eWdxUGt1bmVZR3V5V3duZG4zUzkvc0Y5NDduT0FMaU5URjZ0UWZhNGNXWGh3?=
 =?utf-8?B?V0lpUUl4dkdYdXRxeWFVVVJJbXhZbnNGTmtmbGxKbERmendabFFrekpXT2Zh?=
 =?utf-8?B?QkJzdkd4V1hIRjczMHIzMWlQN1pyZHo3dk1KREhhaFNSOHdYb2hlcHBVMWpx?=
 =?utf-8?B?d1UrK0ZOeHRoZ0c4RGxVQ3B3dStIeTg2QnlJWFNscWg2SUZWL05BSGdTZ1I2?=
 =?utf-8?B?aVVHRHRtKzBpMjNsMmVpaDFBVzdNNEk1WXZSMmw1ZTVvK2pjVlhWRlJYN0NT?=
 =?utf-8?B?ZWhHQ0xNSUEzcEFHZVpsZ1M2R1RSL3lSVEw3Q2xqdGhpNktrd1NVcmdKa3Bt?=
 =?utf-8?B?ZWRzN0hISkoyNVN6dE1uVkptbytWYlI0UXJEYThkRXdqT1p6cER1eVZ5UUlZ?=
 =?utf-8?B?MVZMUk13bDIvWGlCS2t2RkpYZHJzS2FOc0FGT3Q3SjBWZkp2ZzcyS0tKdmVX?=
 =?utf-8?B?dVdHNVlwRVhuL3prenBSb29GamY3cm4xVzVSVUpwd1NydzQ5UGQ2ZS9kRDVM?=
 =?utf-8?B?ZkZkZnBUMU90VWRwc3RMZjVGcDA0YXlSaktiaXA2cGlnVitYelVOV1krUC8y?=
 =?utf-8?B?OW9jTTd3UytoQ3N1NndHc095cWRxVmpmT1R3bjVqQnAzZjl1Y1ZjMERSbGow?=
 =?utf-8?B?VWhEeERtZStqRDIwbkwwNDUzUTFTNU51N3BDUjVldEhrK3FOM2ZENE5vclRE?=
 =?utf-8?B?K2ZHRG0vNVhSa2hwazNrMXlMYU5ja0ZHUDRMRkdpU2RMSm4wMCtScCtYdFNs?=
 =?utf-8?B?c2xyVTVZN1IrV2JmTWhHUW8xVjBZQ1p1akhRYnE5RXNleXlLYjJUUHZueVNE?=
 =?utf-8?B?M1JkdXQvcS9TWXlpeWNKQkxNekp1K3hNSHN3bFYxRXZtSTdmOStBVXdCWExi?=
 =?utf-8?B?dVQrNUJ0Y3BQeVRCRXRHNkZnakF2M290V09OMG1lTnB3R0VRRXNJc05lR3ly?=
 =?utf-8?B?WDhQakM1MldseVZMdDQvMTFqVEhWTEpqMVFFTHUzM2VIcXkwNkxLdmFxOE43?=
 =?utf-8?B?clo0d1JwWmJVbTBidGFoNDUvenU3Z2VnSmJqeDJUR1liTDJ0ak5CdDVpWWQr?=
 =?utf-8?B?R2U5Q2hHdlIrOHQ2cW81eC9WOTRVbjI3MXNvbEpNNEZLQjcyWnpFMFI2ajRM?=
 =?utf-8?B?MWVwU0xkVDhIcEFwS3UybmF4NU0xSTRCU2pzMFVyMHFGRGJ2K3dqN3lhbnNh?=
 =?utf-8?B?OWMyVGpxdE14U3N1aFFmaG04VnpqZjJkSHBUVzBsd2QvLzFucUhQRnE2aitr?=
 =?utf-8?B?RGZ4UTM5TkVQaXI2MHRnUEVsUUZzTmNCd1hydVpXYWJFc0o4elFRaG52RS9u?=
 =?utf-8?B?RURZU3I3Mmc4TGhwS2owbmpJWUJQQzY2TmdvNmlIdWtXWldFODdjS1RWUW96?=
 =?utf-8?B?OFpPWWozWnRFaVAzT0JpZXMwYVF2cnljZkptTWlUV1V0Z2dUY0htKytsZkN0?=
 =?utf-8?B?RG1MWDRqckxtRGFVNEEzN29uM1ZnZ1ZRc01pcnNYNDdaaFdIM0xIam5sa3RK?=
 =?utf-8?B?K21FSFVZbHJ1S2c3cGtRT2pQZWUyQzBBbSt5azF2VU93MDhWT21QVzJxMUVB?=
 =?utf-8?Q?KwQaCsnPNM0gdxr/WV2ikVrzDs7YFhO3k0nny1Gi1cHO?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <C5248F9754CAFE45A3F64858FBC7AC77@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MW2PR12MB4667.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 53adfc12-c599-4e34-9990-08d9ead31465
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Feb 2022 07:17:34.9431 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 41PzyM7ypJzt6TtEFXBubpX2+02XfJ2CszR425QYHlgVv5Cs7NuusWK4MnwkIFSxF4du1Q2gz7MA7/JJwajd3A==
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

T24gMi82LzIyIDEwOjMyIFBNLCBDaHJpc3RvcGggSGVsbHdpZyB3cm90ZToNCj4gbWVtcmVtYXAu
YyBpcyBvbmx5IGJ1aWx0IHdoZW4gQ09ORklHX1pPTkVfREVWSUNFIGlzIHNldCwgc28gcmVtb3Zl
DQo+IHRoZSBzdXBlcmZsb3VzIGV4dHJhIGNoZWNrLg0KPiANCj4gU2lnbmVkLW9mZi1ieTogQ2hy
aXN0b3BoIEhlbGx3aWcgPGhjaEBsc3QuZGU+DQo+IC0tLQ0KPiAgIG1tL21lbXJlbWFwLmMgfCAz
ICstLQ0KPiAgIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMiBkZWxldGlvbnMoLSkN
Cj4gDQo+IGRpZmYgLS1naXQgYS9tbS9tZW1yZW1hcC5jIGIvbW0vbWVtcmVtYXAuYw0KPiBpbmRl
eCA2YWE1ZjBjMmQxMWZkYS4uNWYwNGEwNzA5ZTQzNmUgMTAwNjQ0DQo+IC0tLSBhL21tL21lbXJl
bWFwLmMNCj4gKysrIGIvbW0vbWVtcmVtYXAuYw0KPiBAQCAtMzI4LDggKzMyOCw3IEBAIHZvaWQg
Km1lbXJlbWFwX3BhZ2VzKHN0cnVjdCBkZXZfcGFnZW1hcCAqcGdtYXAsIGludCBuaWQpDQo+ICAg
CQl9DQo+ICAgCQlicmVhazsNCj4gICAJY2FzZSBNRU1PUllfREVWSUNFX0ZTX0RBWDoNCj4gLQkJ
aWYgKCFJU19FTkFCTEVEKENPTkZJR19aT05FX0RFVklDRSkgfHwNCj4gLQkJICAgIElTX0VOQUJM
RUQoQ09ORklHX0ZTX0RBWF9MSU1JVEVEKSkgew0KPiArCQlpZiAoSVNfRU5BQkxFRChDT05GSUdf
RlNfREFYX0xJTUlURUQpKSB7DQo+ICAgCQkJV0FSTigxLCAiRmlsZSBzeXN0ZW0gREFYIG5vdCBz
dXBwb3J0ZWRcbiIpOw0KPiAgIAkJCXJldHVybiBFUlJfUFRSKC1FSU5WQUwpOw0KPiAgIAkJfQ0K
PiANCg0KSW5kZWVkIGl0IGRvZXMgaGF2ZSBpdCBpbiB0aGUgbWFrZWZpbGU6LQ0KDQpyb290QGRl
diBtbSAoZm9yLW5leHQpICMgZ3JlcCBtZW1yZW1hcC5vIE1ha2VmaWxlDQpvYmotJChDT05GSUdf
Wk9ORV9ERVZJQ0UpICs9IG1lbXJlbWFwLm8NCg0KDQpMb29rcyBnb29kLg0KDQpSZXZpZXdlZC1i
eTogQ2hhaXRhbnlhIEt1bGthcm5pIDxrY2hAbnZpZGlhLmNvbT4NCg==
