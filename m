Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CB7A17768E4
	for <lists+dri-devel@lfdr.de>; Wed,  9 Aug 2023 21:39:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E66C910E430;
	Wed,  9 Aug 2023 19:39:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0DD4110E430;
 Wed,  9 Aug 2023 19:39:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1691609948; x=1723145948;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=iaNy82or1+2I7ufz/xE9r0Yho5cRz+hwuum5dPAduaM=;
 b=AuViKKeUvTHf6W014fylPNvNGhhK/8eWiFWW/LgiUSiiCfISxI6gAQ7a
 /HQ8ZvQBGH/GqB6IYvIrnCzyneaQZtNUyR+gTXj1yZMy077e855sj7Mnh
 trY1jcXgjykgV7EwJGUNXmf4x9zm+IPApMAecdyZ8+attWJSB26FzRbZn
 Q/eP++oJ2Wn8YJFeboo4t5SOh88w290UcRce3Bm7y+wSIYMIWLJ1lBXeq
 /KHatZo08dUDJ69DJAtJkLJZOt55zXdpQp5DBYUV9eqW3LPdg1b4uhw1f
 a6PFPTCg8Np/RAjp4AXrbLkvA2gkaxXnH8RA8aUt2srpNtGzRab6m0/tJ w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10797"; a="350791321"
X-IronPort-AV: E=Sophos;i="6.01,160,1684825200"; d="scan'208";a="350791321"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Aug 2023 12:38:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10797"; a="725509079"
X-IronPort-AV: E=Sophos;i="6.01,160,1684825200"; d="scan'208";a="725509079"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga007.jf.intel.com with ESMTP; 09 Aug 2023 12:38:48 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Wed, 9 Aug 2023 12:38:48 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Wed, 9 Aug 2023 12:38:48 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.177)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Wed, 9 Aug 2023 12:38:48 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WwZDbOK4jvifB7fCguKngPxBJkrVp3vGdeArq4UPE/ZV8aqmd/wmSSmYzjMvBSzpHichanOQ0IztbDj9EQ+gweR8rviilEESZ+acwnMeyrW6du4rSAqfMEiW5foYSDTjK939yNXVBm5HrY+gwWKP4CIQAfN58odG+YbDGHFkzUtLsg+mSeGsCX9+c6egaC+F+jNqV696hgbqaMD8KlEcdRXLq6Xeru0jtByvG8gGLPyoytGX4W8FwBYKxrJs2mKFU2jR17kxI+UPtNlVIfZtmLDtV2/TfXfZdxDuUBCnb3Z7fbfKMTVH+iHj7M1gaK2htAtRTDUuZq75DhbJC3zqLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iaNy82or1+2I7ufz/xE9r0Yho5cRz+hwuum5dPAduaM=;
 b=huvlBFxzvhjiXK3IlY05AjIbjlxWMow/jSQluYRb+Ttwh1kXyUIAiwLfpVRydb+t2mvfZMToE89+Ef8w6QVvcXiiKvHOVtAgEKcTKiK6R2cqBE8iKBTjhi/ibXfimksz615LIenD1GTWtJke9Mt3aEuhKly5cNuQnuX36YeAPtDcBTE8Tcxtm8BHwa3HjYwbkYeRQheGiwEeMUWi7yEI+3ZO/dU3dRZNnGWdWeg3xcyS4//OpIAr47U2VN750CnEhGYrY+vaDjrzXuFVnVldYPg1fAfMW5jjslMQChqoFKk5hPCqjhJP/dDxfTfejN7Y3V4RgL17TuaiHcp2RW6KyQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM8PR11MB5751.namprd11.prod.outlook.com (2603:10b6:8:12::16) by
 CY8PR11MB7108.namprd11.prod.outlook.com (2603:10b6:930:50::21) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6652.30; Wed, 9 Aug 2023 19:38:46 +0000
Received: from DM8PR11MB5751.namprd11.prod.outlook.com
 ([fe80::542d:f32a:14b:1531]) by DM8PR11MB5751.namprd11.prod.outlook.com
 ([fe80::542d:f32a:14b:1531%3]) with mapi id 15.20.6652.028; Wed, 9 Aug 2023
 19:38:46 +0000
From: "Teres Alexis, Alan Previn" <alan.previn.teres.alexis@intel.com>
To: "Vivi, Rodrigo" <rodrigo.vivi@intel.com>
Subject: Re: [Intel-gfx] [PATCH v1 3/3] drm/i915/gt: Timeout when waiting for
 idle in suspending
Thread-Topic: [Intel-gfx] [PATCH v1 3/3] drm/i915/gt: Timeout when waiting for
 idle in suspending
Thread-Index: AQHZxZn9han6q19Qa0aoF2Q+JkS7M6/fJeaAgANBHAA=
Date: Wed, 9 Aug 2023 19:38:46 +0000
Message-ID: <25f190410ea83378ef5ef676f4eebc5f3d326e05.camel@intel.com>
References: <20230802233501.17074-1-alan.previn.teres.alexis@intel.com>
 <20230802233501.17074-4-alan.previn.teres.alexis@intel.com>
 <ZNEwZzp6KPEwEpsv@intel.com>
In-Reply-To: <ZNEwZzp6KPEwEpsv@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.46.1-0ubuntu1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR11MB5751:EE_|CY8PR11MB7108:EE_
x-ms-office365-filtering-correlation-id: 210fbfd5-2155-472e-83e6-08db99103f79
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: ujms49eQ3XHRwD4nZ8DXXFyXyHc2IAlkObIeOB3J8NaUviyYBoeARqzmBMj9tXxrLNxjOyd9wRa4Vj0gUer1+IdGDtGEyMwdN3o4xFr9Zyjsoicsc6+7W1b9qAZ5S0zLrT2cejJXATmHch3/vgyhwj906YbvMzC6BXzxMoBe/mfDXURTlpw6Xgzx2kkn/A5xDDYtKks5wiZvHdMGr0C6vI+6oUNVxoRlREYeNgrQ0+2ems2Jtp618lt1j2/mq9E5niYTZQeIgEe4WHZf6EPreD9UtvYO0w/+1izljEcYF9ejt/4+2+//5HVWKO/Kn1Y/MsXnMdg6Ut3V/Bba4ArOaaKUaTbFH8eFBpp/lYo1c+kSyVoMN97NDqVhbLBB1kR9KjeYlPIqyc0KJhZpaU+CNdbvARM1laYsAW348vn7KrJqp3AalP/CJfbexEA1QEC1v/laiT1Me2gmB5s9FrWygaUCT3ySRMD/iq8IyVYBowUp/nI5cDNvxA0Ogo4QXYnoXJDCIlEAu14wxLZ93Ua8+IU9LJY5HTCU6zRNBh0hS1aP+4rK/wqSFcSwJ+yv7/22eQUopBlCY4Z2NaDxBHktSS2dNmr+Bs0XPJNtkaA/B5DRQ6ZAizuLkkkOtx0iR6hs
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5751.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(346002)(136003)(366004)(376002)(39860400002)(396003)(1800799006)(451199021)(186006)(2906002)(2616005)(66446008)(64756008)(66476007)(316002)(4326008)(6636002)(83380400001)(41300700001)(71200400001)(26005)(6486002)(6512007)(6506007)(91956017)(450100002)(66556008)(66946007)(76116006)(478600001)(37006003)(54906003)(38070700005)(82960400001)(36756003)(15650500001)(86362001)(5660300002)(6862004)(122000001)(38100700002)(8936002)(8676002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?MVVJcktjWUgybW5PQkhaOG1RcmU5QzFlZW1tVjVLeHdmS0gvYWpXelJQZmhu?=
 =?utf-8?B?RWFqaStDR2Q0R3VJeXJnUlZQTG0ycHdMc01CMWdOaFlKQmlJVDdvYkNPaWZh?=
 =?utf-8?B?ZlU4UzYwenV1WHYrR0t0WGlxZVNSTXdPS3JOa0NSbkpORFJuZGlJQkZhcFhX?=
 =?utf-8?B?U0JKbzZpQVA2NHFCQUVwakQ1MSsreWlJeG5QREJhTjJ4ZThXbXEzOXlPdU85?=
 =?utf-8?B?WS9zTG9IOExRTlRCSGhRN2tuWnB2WHV5SXZpcU54QWtHRjNiUWpkemFGQ1NR?=
 =?utf-8?B?OExldHdrU0hBSm9IdXlqYzNvdlJMQ0N4dkpSZmM1TU5MZEp4cXdQT0k5R1ln?=
 =?utf-8?B?MzY2c3BUZ09XSEF6MWhDVHVZVXcvdDB6emU0R0lPQndtT2tuSjBnZVlxU0Fv?=
 =?utf-8?B?RnhFZUtEMzQzeVNxWmZ2QTRubmE3YVltbyt6RGNuNlhjNFFUNVZLZ2VOVUdU?=
 =?utf-8?B?bWNzZjRXS0FldmU1NFAyMXdNRUJkeU9TUzFLcFBuS1E0NUpjZ3RSbFFKTXBp?=
 =?utf-8?B?QnA3djhna1BqV1E4dXp6UkdxNWdIWHR2RDg0eUR2Nnp0c1AwSG9yaFFBVUZm?=
 =?utf-8?B?NmdmWXFaTGtObEVEY0RHVDgvNVF0Umo4eWNuYjZMZk14Q0dBbWd2TVFHVEVa?=
 =?utf-8?B?amNTZ25uQlRpengzbTFjYTU5d3JiN3BqK1MxLzNnTi9FN2JYbldqNXpUTGtD?=
 =?utf-8?B?OVhaNzBNSlkwTmkvSmFJQVFOZEZjWnU0KzBXYkFaL29hUnFjdFg4U1FaTUFq?=
 =?utf-8?B?cDJGckM3V3c5Y3o2N2Z2djFuRGVYNkR2N3lVbGJrSDVyOFJFcHpCd0twMEtO?=
 =?utf-8?B?cndNOW9rNW1rM2NsUmMvR21VYUdCTGVSWllYSmFzRHV5S2l2OVE4QlduMUdP?=
 =?utf-8?B?d1NrV1BFampjOEMyZjFMTEgzazVkOG9NdmlaYytqZEM4ZTlVT0Z6djY4T1hJ?=
 =?utf-8?B?WEE2Q0lCNVhzdU9TVmN0ZDhxTTlqODBnSGV1b0o2Qks1S0xXMGE2OFFXNkxq?=
 =?utf-8?B?bUVpZnFIWWllVW53RmphekZ6NUZ5TVgrZ2ptVmVJbkZ1RHJzbkRtbDJ1UXha?=
 =?utf-8?B?VkRmZC9VQjhSRzJhaDZIbXZDTWVucUVtejhxTnlaUjFZUG9nLzZvTWN0V1hj?=
 =?utf-8?B?NFQrRmFVMlE1b3ZYdmNDSUw0WGNsUmNJL3AzaDhlOThFQ1QxZlU3OHprYnpz?=
 =?utf-8?B?ZlNrYy9aM3dWOENHYmdqQ1pBdnhBYUpnMHgzWk1FWnd1NzFEbWN5UlRKWTVE?=
 =?utf-8?B?N2p6OWo5OE11RnF2UUlTRk1reVhqUFR2WG1IVndrZXVYcUxKWk9JTStTMGh6?=
 =?utf-8?B?ZzlkNCtFSjFFTE1UNDZqRkJwK1dhcENUTEtsNm5yTzZ1MUdVWHZ3Tlc4KzEx?=
 =?utf-8?B?QjY3VDB6YVdCNnhTVThweStOQU9pWFBBZ0x2V0lkc09GaVliM0NBa09yVURT?=
 =?utf-8?B?NUlLWEh5NEc3alV6aktzU3pGcEVQVEFqNXFrSEM2b2gxWVJHRUNjSUV0ekd6?=
 =?utf-8?B?bTdyejNGUEVmVXErbElDTHdVMzdROHRULzRndTZPQ1FPMWNKNGpqVjZTeHVP?=
 =?utf-8?B?N25PdFVZaXo3TG5lbVc5RW5CbUVaSnhYUHhKcjVERmRKN3RuU1dEWmZ1OXN0?=
 =?utf-8?B?LzNkMlBTbDJVazhLSVZhY0w1Z2RzMTJPVlBTRHZNdnM4L3R2cmJGTWhDaGt2?=
 =?utf-8?B?RzZibzJqazg0YUphR2tpTnU2R0o1b0R3elJ3aUsvTFVzRjlPbEN2bHI1Sndm?=
 =?utf-8?B?Rlg3NFo0c1JYZkdOczFjcXlXWGpVY2tLVEFKb1Z3czd4RGpmR2VLR2hwQzY3?=
 =?utf-8?B?VXBlWXFBZDlpMWhzMDVIU3NwSEd5V1dpTStUTE54OXJLNjJNcEJhTzkxTzM1?=
 =?utf-8?B?eVJUdHl2TnF3TXBuUzNUelE2cDA1bWhOdC9vQnh1Z2Nra2dzbXBRckY3c3Jv?=
 =?utf-8?B?RmE0NVBUU2M5VGsxeWMxQVgxcW04MzFqVFNMSEFpMXdqY2VQdUdicW9KY1lZ?=
 =?utf-8?B?ZGRPZm00ZjhPMm1xK3BsRWk1cWpGcnpoZUp5Y3FRNDFQRXRpbjd4SVo3dDVy?=
 =?utf-8?B?VjZXd3dUdHE3TmZTUFhGd1cwNFRVT3NZVklUaWg3KzBEaysyR1dESVpqNGRl?=
 =?utf-8?B?eVlMd3NzM3NkZEdKc2QzRzdNUUdyZ0ZzS012Qk5GbGhRU25WNElXejVyYXl1?=
 =?utf-8?Q?MK7ctzsi5CnzwKM1K/T7LeM=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <35688D07E4DECD4EAC05F3045164B093@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5751.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 210fbfd5-2155-472e-83e6-08db99103f79
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Aug 2023 19:38:46.6327 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: joqV7oQgyLZFvp0CvbP39dQU05CW6QlFy4dZ4A7t6eqBfOyRE43NusTVwbXBB6CCU5zjpy9wLFw2OzvBlmRSTCUwcD45lZ3tZirz+Gv3WyI53Lcs91MsQoBp7XFe8qrH
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7108
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
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhhbmtzIFJvZHJpZ28gZm9yIHJldmlld2luZyB0aGlzLg0KDQpPbiBNb24sIDIwMjMtMDgtMDcg
YXQgMTM6NTYgLTA0MDAsIFZpdmksIFJvZHJpZ28gd3JvdGU6DQo+IE9uIFdlZCwgQXVnIDAyLCAy
MDIzIGF0IDA0OjM1OjAxUE0gLTA3MDAsIEFsYW4gUHJldmluIHdyb3RlOg0KPiA+IFdoZW4gc3Vz
cGVuZGluZywgYWRkIGEgdGltZW91dCB3aGVuIGNhbGxpbmcNCj4gPiBpbnRlbF9ndF9wbV93YWl0
X2Zvcl9pZGxlIGVsc2UgaWYgd2UgaGF2ZSBhIGxvc3QNCj4gPiBHMkggZXZlbnQgdGhhdCBob2xk
cyBhIHdha2VyZWYgKHdoaWNoIHdvdWxkIGJlDQo+ID4gaW5kaWNhdGluZyBvZiBhIGJ1ZyBlbHNl
d2hlcmUgaW4gdGhlIGRyaXZlciksIHdlDQo+ID4gZ2V0IHRvIGNvbXBsZXRlIHRoZSBzdXNwZW5k
LXJlc3VtZSBjeWNsZSwgYWxiZWl0DQo+ID4gd2l0aG91dCBhbGwgdGhlIGxvd2VyIHBvd2VyIGh3
IGNvdW50ZXJzIGhpdHRpbmcNCj4gPiBpdHMgdGFyZ2V0cywgaW5zdGVhZCBvZiBoYW5naW5nIGlu
IHRoZSBrZXJuZWwuDQo+ID4gDQphbGFuOnNuaXANCg0KPiA+IC1pbnQgaW50ZWxfd2FrZXJlZl93
YWl0X2Zvcl9pZGxlKHN0cnVjdCBpbnRlbF93YWtlcmVmICp3ZikNCj4gPiAraW50IGludGVsX3dh
a2VyZWZfd2FpdF9mb3JfaWRsZShzdHJ1Y3QgaW50ZWxfd2FrZXJlZiAqd2YsIGludCB0aW1lb3V0
X21zKQ0KPiA+ICB7DQo+ID4gLQlpbnQgZXJyOw0KPiA+ICsJaW50IGVyciA9IDA7DQo+ID4gIA0K
PiA+ICAJbWlnaHRfc2xlZXAoKTsNCj4gPiAgDQo+ID4gLQllcnIgPSB3YWl0X3Zhcl9ldmVudF9r
aWxsYWJsZSgmd2YtPndha2VyZWYsDQo+ID4gLQkJCQkgICAgICAhaW50ZWxfd2FrZXJlZl9pc19h
Y3RpdmUod2YpKTsNCj4gPiArCWlmICghdGltZW91dF9tcykNCj4gPiArCQllcnIgPSB3YWl0X3Zh
cl9ldmVudF9raWxsYWJsZSgmd2YtPndha2VyZWYsDQo+ID4gKwkJCQkJICAgICAgIWludGVsX3dh
a2VyZWZfaXNfYWN0aXZlKHdmKSk7DQo+ID4gKwllbHNlIGlmICh3YWl0X3Zhcl9ldmVudF90aW1l
b3V0KCZ3Zi0+d2FrZXJlZiwNCj4gPiArCQkJCQkhaW50ZWxfd2FrZXJlZl9pc19hY3RpdmUod2Yp
LA0KPiA+ICsJCQkJCW1zZWNzX3RvX2ppZmZpZXModGltZW91dF9tcykpIDwgMSkNCj4gPiArCQll
cnIgPSAtRVRJTUU7DQo+IA0KPiBpdCBsb29rcyB0byBtZSB0aGF0IC1FVElNRURPVVQgd291bGQg
YmUgYSBiZXR0ZXIgZXJyb3IuDQphbGFuOiBva2F5IC0gd2lsbCBkbywgdGhhbmtzLg0KDQo=
