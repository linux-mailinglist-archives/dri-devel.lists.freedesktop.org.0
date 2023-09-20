Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2679C7A9242
	for <lists+dri-devel@lfdr.de>; Thu, 21 Sep 2023 09:45:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5286410E580;
	Thu, 21 Sep 2023 07:45:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2075.outbound.protection.outlook.com [40.107.92.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C103610E546;
 Wed, 20 Sep 2023 21:28:48 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cGn93liVcsgOmX8c3yfHEz+lqRUIpjsP7kCzRP9aGXXIKi7nUgqEHK811nCRlh9H/nmqAaWzgcNy6gZoM8vNW6UiUJYlxhIEo7fOkISSN10ha3Yg0lIbJSG3EonTgn2HmRTb8Ug+u2Bc9XLw/UZPtzmXnWwNavdgaTdIh+5naMXhXvb/7F4r9MDRArXApCxhQfS5XxuL+VQGKoRAVwrNoIiOLnhxs5yJaiA3mxMnLwrsbZWc4+EeTrfLdxiMzTF9ZYTym9i9SmdJEnlI91S1xhv86Rv3+M/EMNG3l2I0+y0wfpi8hdfpx6C9uehMULOwhQ6uHozj2jVd6GJLewDFKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=86dOaVjJZAMdwfE9J8iK9hSH1oDbMYibZ/pfD1yc4Ds=;
 b=Hn8URyfJTR1ifq8mcUWIfEPgg0P0jGBisJuUIEZJ3ElJZNOO4lVMGGk6atMDSwEDioCJDeyYM8KNd3VXdtRAIIUlQznkADpiqlYaoJx6JfN2Xv/oG4olwH1ZjpZvZv5fDAHpJUFf+6bu5pbJAC0eZule98mLp6SS16GU1edCpT7JrUDHd+zf9QYq/erFBPO7EGd69FY9yQmqKsakbLy1DRvH5D+nhb/Fdf5oOQ/COOS52ySpIJxTaRGWo12gw6Qk+3URVWfTgfwKGD8txx3HuqSyz3JSUo7LbsASpEjwk0KTaYu3tSAnYcyU7KwWPb4xmMEddFq8QecbLm9Dap6k2g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=86dOaVjJZAMdwfE9J8iK9hSH1oDbMYibZ/pfD1yc4Ds=;
 b=ekHzbljfpuJtj14hbFNByS51du5C/0WL658AWb+Q9Vt7UwN7N5H3BiKtROTAREXE5x0oCa5KBTRzxh6yThpCuGJx0gfNLNY+gs3L5Cn2U7rPokW2gbxWZNktJggtJBzZKIAvyzxH2fRRZMO2mkOEiaIoJiGoygfNjqhSb3M07Pdk5f/NJew2yiL3PR1zNsbC2kmkTfiHWED4oWx0CdTN8nwC2muenJuPps0cwFifS16TUfj7ovLrH1SraOtJKM0/wQSWfTd6ISoldR+V1sTQv3yMEbxReMFzGn7JM5WOdiLbL1Z46EOxEGjG7hA6J+vmwyiWup+8dJVZX1BmneRiaA==
Received: from DS0PR12MB6391.namprd12.prod.outlook.com (2603:10b6:8:cd::16) by
 MW4PR12MB7384.namprd12.prod.outlook.com (2603:10b6:303:22b::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6792.28; Wed, 20 Sep
 2023 21:28:44 +0000
Received: from DS0PR12MB6391.namprd12.prod.outlook.com
 ([fe80::76bc:2a16:6e0f:72b6]) by DS0PR12MB6391.namprd12.prod.outlook.com
 ([fe80::76bc:2a16:6e0f:72b6%4]) with mapi id 15.20.6792.026; Wed, 20 Sep 2023
 21:28:42 +0000
From: Timur Tabi <ttabi@nvidia.com>
To: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>,
 "lyude@redhat.com" <lyude@redhat.com>
Subject: Re: [Nouveau] [PATCH v3 40/44] drm/nouveau/kms/nv50-: create heads
 after outps/conns
Thread-Topic: [Nouveau] [PATCH v3 40/44] drm/nouveau/kms/nv50-: create heads
 after outps/conns
Thread-Index: AQHZ60W3PLn3lFdil0KsTsoWtikiMbAkPE0A
Date: Wed, 20 Sep 2023 21:28:42 +0000
Message-ID: <68cfb267a5df3bbc0223bddc1c68c08ebbb61bd6.camel@nvidia.com>
References: <20230919220442.202488-1-lyude@redhat.com>
 <20230919220442.202488-41-lyude@redhat.com>
In-Reply-To: <20230919220442.202488-41-lyude@redhat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.44.4-0ubuntu2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS0PR12MB6391:EE_|MW4PR12MB7384:EE_
x-ms-office365-filtering-correlation-id: afea3c4c-63b1-47e8-d6f1-08dbba209058
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: sCagGFTLL1231YPabLi9GOJmK9FMegpib8Ma6Kpx9un/M3Nu2jdB3FxTkqd8Y7GDyRmWWVc6t4i4wQkRlF5k58xs8NqmsyxxpgJ9lKM8ZVAkcrkkVxSabParZsYEGDdszMat9ob1T0GXPD6lrc9BM+8mAcsG7l5s+RjWWDZykdt7RR0lpPEGyiOOzv1A6QPUAyhOsyvuLW/O50gek5EbeChdYVIINgG8ZNeS2UEbyh/HNKlIxu1/HP3JB4Xbwcw7DzX96K2hEmhJgtgtqPI8/RXrB+7Pm1TStF2LyeSwL7dk/36f7tCGdFuM2AbCBW3f6dNRXyRQwuxAIRd+gNb1F/oTu3zpMF050ro0Z1CELTXjuWF2p5gD6/F4O9c0WBh1HHXNuYKTaFcDrtrfqylEpeNZh3qsNDb/YZgmApwKqzds28h8k/1jtYTfk+LQRwl1z7G+YtEl/41xSWjhWe/6ckodhR8/XXK8Wdar4MtYiU5T7o7ThdlT8bFgSAeLv3rHjlFW2lJO+OoofhvtT0fOMhVCno5g3QrxmWUtNHZvduvKTuIAR+xxQk5NZaJkQwxbLY+c89/hF0wUfdl5MnQ2sHQp/H9c1gHEdZU+5S1A5oLqjvH9DIsK4gbOhKhESvro4CfwABgsRlylaBlbMW/NwA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR12MB6391.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(136003)(396003)(366004)(346002)(376002)(39860400002)(1800799009)(186009)(451199024)(6506007)(6486002)(478600001)(6512007)(71200400001)(83380400001)(5660300002)(966005)(26005)(4326008)(2906002)(4744005)(2616005)(76116006)(316002)(66476007)(54906003)(66446008)(8676002)(66556008)(66946007)(64756008)(8936002)(91956017)(110136005)(41300700001)(38100700002)(36756003)(38070700005)(86362001)(122000001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ckdVOTRPblEzK0tCSkhPTm1HR2tvdG9EbGdEUjk3eVNESnhGTmtGV3JKS2tM?=
 =?utf-8?B?MVBXV3FrVWw4OEdLWE03ajBCZm9Id3JSeUZnNVJhNmZ3RThnU2c3OGFUMTZa?=
 =?utf-8?B?MGJrcE90OXQ5Zi9Zd2F4YlJndDl1NzRTNDU0b0N3R1RXaEFva0lONnJLQVF5?=
 =?utf-8?B?YWR2WU1GNDhEc2tZc1lWbHBqWkdVTitVaUdVNkxjNEhSWmZXWEZTMWtXWEk5?=
 =?utf-8?B?RVErWUpyVVpweDc5SUVwWjRkR2E2VC9mMXp1MTZFNVdZL1U0ZjJUQlNmMTlt?=
 =?utf-8?B?TmRsVnhoSXVKa0VsK0UzYlVVVWxHQS9HSFZpYlQrV1BwcnhGd1Vhd2NrNkF6?=
 =?utf-8?B?T1BNbmVLQ1FHMUJJdEo1bkdLMXB1T1M4L2pRRWdxMy9PZ0tGVkJlN3FiSDVn?=
 =?utf-8?B?Nmppc0R3SUxNWG9KdzhCbXVlVmNERzdDOXk5T1BLYjdwWXB5ZWdxbTE1NjZG?=
 =?utf-8?B?OXVuTWN6Z29NZjRhOU43N1VCclZvWmowem56QUpuVW9UejN3cllYejRxN0RJ?=
 =?utf-8?B?bHhsTUVFejJneE83MSszeS9OU1hqdllyN0MxbnpraFFTcDlqVFNPdUh2RDNa?=
 =?utf-8?B?cXZpOWFUQ0xrNXhaa3FrR1l4UmJUNk5HRmRiazBIeThUQ25LSExJV3QvdXpa?=
 =?utf-8?B?L2VGbkVqRUZQcE05SVl1VnprUzFxL0pUeHRYeUhxVFBVdmhydUxUOUZKZHRj?=
 =?utf-8?B?VnU5VTlqZVZXcmQ5cnpSRlJUNm52TGRkNFQxbmpqSFpzRnE3cHFUdGVRd2pF?=
 =?utf-8?B?OTdVY00ydG5tV09TeHBjRGZwYytTWFVyUXU1UmFZNHllWVNSZUQ5QkxyM2Ir?=
 =?utf-8?B?NVM2SmJJM3JEY1o4ODFJbHg0eWVKQUF2eGY0QUdES2YxeVlDVkVKZWpwVjR2?=
 =?utf-8?B?bzdCV3hYVHdGaDBjMnVUU1ZvTS9Ra3NKSW5DVkd5azBqVEVlWU05ZHhLajF3?=
 =?utf-8?B?cjN4TjJ3QjNST1M0Y3FNTWo5eG92T0xyajEyU3B2TDFSMTVZNDQ0aXUyMVha?=
 =?utf-8?B?T28wck90aW5mR0gvcG16WGlpMmcrQlR1a0pxR3lHSmozTEY1K0NoSFhVbzNF?=
 =?utf-8?B?TFVMTlhOZ3lPZjl4RkpGQk9BUkZHL1VvTnRXRW56ZkJidnoyRmNOT1JKRVI1?=
 =?utf-8?B?OWkxT3QvZDg4bEpscFhLakhFVnRsV3FRNnV6UjZMUE9xaVJyR0FlWloyb09C?=
 =?utf-8?B?cGpVcFlIbFlPOHQ2bW1pQ2dXUVAySUhSUFJid0Z1dzdOZGNPaDdvZkJJYWRX?=
 =?utf-8?B?Y0hZdUhrdHJ3aFJSWkpkaVhRMjJPM1RURUNCZzNuY2prWmdOazdjeEUxOGF6?=
 =?utf-8?B?V282M1RnTm5JclMwRmFpYjJTYUFKclNwN2VUVU9WR0ZEZ01mS0xIV3lNR1BT?=
 =?utf-8?B?YU5LYmdCQk5Wci9nZHdxSmlPL2JGNXBxc1dHQ0RQSHJxaGREaG9kdXVKcm9N?=
 =?utf-8?B?SU1Qd2EwRERXM0dFMnhsc2JnNGRyNWZ0SVdDM2kxeTluU2dkby9tV3hTWjB5?=
 =?utf-8?B?LzhzZFY3L1pXOXlkTEZJb1BTd0lWa3pkOEgyaTUzeGVwWTBXcEkwSnpldFRM?=
 =?utf-8?B?bG5keXlUdDE5UHdGVElaV0xxdkFPeURjMzgwc3dEdVF2ZmdyNFZZQ2gzR0J6?=
 =?utf-8?B?VlBFZFB6Tlh2eDJ2ZEhVMXMrTytDTkRuU1I4YUhCcTR3R2dHT3lhRlhlL2tP?=
 =?utf-8?B?Sk9wdmhydWFrY01sbWJsUW05dGJmV0xJTnIvc3VLaFFFbW9OOUozdHdrVVBG?=
 =?utf-8?B?L0IxSkw5MXhRTzBVb09vRXhtVEtQYUZlSlp1MERxRjRHTjcyQXN0My9od21K?=
 =?utf-8?B?NlkxTnJIU1Z1ZGlsSDNYa2R4Q1MwRi9WRGpkK1M1OFpzeGxVZkdLTHBUd3dt?=
 =?utf-8?B?a1NJc2lvcnlZWndkeElBYVpMMWZTRDdPVVJIcUVDcm4yWkUvQjFxUzRKcHdK?=
 =?utf-8?B?TXRtM095THljb2hpWlREU0RxQk8zSzR5UHVja0d3d1FhaE5sdVkzQStTa2JZ?=
 =?utf-8?B?ZGdyeGxkcjZIYVNIaDFXcUlxd3F3OWdyYjNVNnQwbkQxMEpSY29OVEZRRkE2?=
 =?utf-8?B?VjdrcklrZnlxaDhLQUUvNnNPZS82bXhCc1BocHhSWVo5ajVUYjJiVXJFdjlk?=
 =?utf-8?Q?lW1/zzSADhEOodAtI+GOJ4Lx1?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <87D496B9565BEB4C8F628F08B56F2C11@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB6391.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: afea3c4c-63b1-47e8-d6f1-08dbba209058
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Sep 2023 21:28:42.6486 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: a7zXClp+6krbzDdmnSnfjQgQhxuH5wAUJq6OB9loQpOnfyzvVdB4spTRqO9vz84QqKkQpFQYglHJRayFWVszng==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB7384
X-Mailman-Approved-At: Thu, 21 Sep 2023 07:45:12 +0000
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
Cc: "bskeggs@redhat.com" <bskeggs@redhat.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "Wayne.Lin@amd.com" <Wayne.Lin@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCAyMDIzLTA5LTE5IGF0IDE3OjU2IC0wNDAwLCBMeXVkZSBQYXVsIHdyb3RlOgo+ICvC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgLyoKPiArwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAqIEZJWE1FOiBUaGlzIGlz
IGEgaGFjayB0byB3b3JrYXJvdW5kIHRoZQo+IGZvbGxvd2luZwo+ICvCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgICogaXNzdWVzOgo+ICvCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgICoKPiArwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAqCj4gaHR0cHM6Ly9naXRsYWIuZ25vbWUub3Jn
L0dOT01FL211dHRlci9pc3N1ZXMvNzU5Cj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqAgKgo+IGh0dHBzOi8vZ2l0bGFiLmZyZWVkZXNrdG9wLm9yZy94b3Jn
L3hzZXJ2ZXIvbWVyZ2VfcmVxdWVzdHMvMjc3Cj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqAgKgo+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgICogT25jZSB0aGVzZSBpc3N1ZXMgYXJlIGNsb3NlZCwgdGhpcyBzaG91
bGQgYmUKPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAq
IHJlbW92ZWQKPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oCAqLwo+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgaGVh
ZC0+bXN0by0+ZW5jb2Rlci5wb3NzaWJsZV9jcnRjcyA9IGRpc3AtPmRpc3AtCj4gPmhlYWRfbWFz
azsKClRoaXMgYnVnIGlzIDQgeWVhcnMgb2xkLCBhbmQgaXQgbG9va3MgbGlrZSBhIGZpeCB3YXMg
bWVyZ2VkIGluIDMgeWVhcnMgYWdvLgpTaG91bGRuJ3QgdGhlIGJ1ZyBiZSBjbG9zZWQgYnkgbm93
Pwo=
