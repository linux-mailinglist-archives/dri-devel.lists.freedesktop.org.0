Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E519F8388DE
	for <lists+dri-devel@lfdr.de>; Tue, 23 Jan 2024 09:27:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF35710EE9F;
	Tue, 23 Jan 2024 08:27:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com
 [68.232.153.233])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A6FA10EE5C
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Jan 2024 08:27:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1705998420; x=1737534420;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=vVpq5cfuaf5M6nzQnFE0eQf6lwLrK18Zv1czv4LLxyU=;
 b=p2qF5othLgOZRk+xC9ec+NvdPNbvtPq+8E7m4rHi6BgslDJceo5ooq7X
 tiVlGt6ga9BSpDcVxZkswNVi0oylkG8x07oBkVfHXadS9Y+Jq/qM2AJZE
 z0K/SLN7wqf+BaVbAkwMZGP4QOr2Jh9yq3KokqhVIoCXJtpiYD3GAn1M/
 LwsXjYmU11Ut8nnzKyvWWla9S6QVQybz5KBwkK0jpRG2uq8cnhG9OMFpC
 +MIKWwM2JEZcS+mRuROaiN76LcywuNPNdg6ZxDJk4MeEk2SqyaXg8AOM/
 8cGdwdJjOQClNasV+/UJ0MilUJhQuA/pujnK/DMx1ZxvcAG1y3LFXpxJr g==;
X-CSE-ConnectionGUID: bcpERFkeSFydA/zpZ4nMcA==
X-CSE-MsgGUID: bv7CuGxQRamGWI4t0DFDJQ==
X-IronPort-AV: E=Sophos;i="6.05,213,1701154800"; d="scan'208";a="16393920"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
 by esa1.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 23 Jan 2024 01:26:59 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 23 Jan 2024 01:26:37 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (10.10.215.250)
 by email.microchip.com (10.10.87.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 23 Jan 2024 01:26:37 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OzkOx9QhlhuZtWnYHxz/jDspXRCraiYJ24aAFnpQZVtoVjQWxoa4Tg3u6lr3BPRvT9oIfBQxtMhSMPkZCrkxW8P00cxzJAaM4k6N2nYxUGoSjYLy7Bz2Sd+niPQ2Dmub4Zt4nadJVijlkK4RoJLwijLHcaDvT9nwKf1KBu407EMGb/dE/LsZ6hLQ+zTngS+TemsmSsRJbRsL6+uEICu+dx8Dpi4UaENuy9vWkZ9yr3y9kwD7iA7/OaJYaHvnOzrn+fDEZH2CNM0hd8tnQxBvoz8LUGkAx7WuuIGeaLQOOvEtYQDUvFPIKyqpUdxs6LUOK7oJVLYcaJ55eXwgq1Knww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vVpq5cfuaf5M6nzQnFE0eQf6lwLrK18Zv1czv4LLxyU=;
 b=beGtuKwrsPg8Kjkt0jdV0IeJLtK78Z2PtH975asayPPxHgLYcSfc19kgJIGODUVu3uMlhTl9xZNNju+W1HKTaaNROGjjI/EdHJg45WTmRxQOC3H/n8ER60zUA5i3itjNF/t+OXyqCZ4diEUV7bzncgeqWoEGs2HU50DaTIkZYah41iEhdSGBkUp2KVp0ntyt8E5UWJMh62UuV958KEdJ6pOxNr8ZbCqos0KWpv+z3Ltxt+nKwWrGhm8k5m+/w9vspv/z4pQCOEy//l24gEImL3UnGsi7eQjY95Wn5jo1Vib1ooyPdOX5WQEMdN4rO9o5KRuivib7gw30U3WBqtyGjQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=microchip.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vVpq5cfuaf5M6nzQnFE0eQf6lwLrK18Zv1czv4LLxyU=;
 b=wvqBkod03fFp0QpnwTaaw7bcFRLyMxZIyT5qtyfezB80uRVRg6WZdFYRdFauIddlkvnibsiIDa/RUZSy2VUX8TFT1GoWDq5QIM715tWQ2tgZ7HF0IOpReo4Lyi7c/ORL/UoskjRZ3ro9Qmwq1i+q4BvbDuSg9dhqXsBcfFBGkzKL+Km9JwVmK1aHtJBoL2amDnLBzY8tUgYOCPc5xDxKnU7sIFgTMPXbTJmdCscEoTHg8KVcrkl8bUyS4O6vSx3N231if7VN037OvgrdVcCNkEvlqAfynxCm/M6z59XmAn8cdosfIo77bktXb5lVN96bXd4+jWiY2hKD7VHxlXMr/w==
Received: from PH7PR11MB6451.namprd11.prod.outlook.com (2603:10b6:510:1f4::16)
 by CH3PR11MB7250.namprd11.prod.outlook.com (2603:10b6:610:149::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7202.37; Tue, 23 Jan
 2024 08:26:33 +0000
Received: from PH7PR11MB6451.namprd11.prod.outlook.com
 ([fe80::80b9:80a3:e88a:57ee]) by PH7PR11MB6451.namprd11.prod.outlook.com
 ([fe80::80b9:80a3:e88a:57ee%3]) with mapi id 15.20.7228.022; Tue, 23 Jan 2024
 08:26:33 +0000
From: <Dharma.B@microchip.com>
To: <krzk@kernel.org>, <Manikandan.M@microchip.com>,
 <andrzej.hajda@intel.com>, <neil.armstrong@linaro.org>, <rfoss@kernel.org>,
 <Laurent.pinchart@ideasonboard.com>, <jonas@kwiboo.se>,
 <jernej.skrabec@gmail.com>, <airlied@gmail.com>, <daniel@ffwll.ch>,
 <maarten.lankhorst@linux.intel.com>, <mripard@kernel.org>,
 <tzimmermann@suse.de>, <robh+dt@kernel.org>,
 <krzysztof.kozlowski+dt@linaro.org>, <conor+dt@kernel.org>,
 <dri-devel@lists.freedesktop.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 2/3] drm/bridge: add lvds controller support for sam9x7
Thread-Topic: [PATCH 2/3] drm/bridge: add lvds controller support for sam9x7
Thread-Index: AQHaTQ1L01WABVFxSUCss4ZVndmRU7Dl+vQAgAEWrgA=
Date: Tue, 23 Jan 2024 08:26:33 +0000
Message-ID: <eb873f4e-7804-4460-ad0a-619689e2786e@microchip.com>
References: <20240122082947.21645-1-dharma.b@microchip.com>
 <20240122082947.21645-3-dharma.b@microchip.com>
 <7cd4d9f9-e14a-4cd4-92f7-51c43acd23e2@kernel.org>
In-Reply-To: <7cd4d9f9-e14a-4cd4-92f7-51c43acd23e2@kernel.org>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH7PR11MB6451:EE_|CH3PR11MB7250:EE_
x-ms-office365-filtering-correlation-id: 99363b56-9666-4e5b-e9b8-08dc1bed01dd
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: pjHx/ZJ+tCdRCforf7urFQ/GAPKmomtha/iy3ndSReKqJk8K9bMz/9z+dU7+UMCTWzDD2OblozivWmARYirTeGVSbNJBWj670DJKBUCkfhdG0uTIMZnNgd6ST6MWNGIgI81DRXik283UC2ipIiWOm3UComIQa28iMfWuL1TGxzz7qtRpDW5jlVU2a5d4ehEtOlbX/LqTcFM8/PE3uJJPyxgbdIbf7EvG8jWjNKMBjqCMXxzOIEpI2BkRicm1HaVbLzBgwxihg87KMVsTCE0Bx1mj71eZ83VK+y3X7VRlmWzH8rry9UYmO+aWU803pn1ZLcT6MOmQ7BBFmpTws5UkykTtb9urrqgfFXhZ60WVUBWrgTGf7qzKmPBRdVBvlbzkxbjFFPWQqtPD6qYe2A8WnK/pBom8a/58SEX8hRZAVFd1+gJRG8HAVh3EnTD8CKdzqNKUUsb35o3AZ6OC/3nkx5+aetqSDFiD0utU+cmu/7yI4nzDcuedfcPeo1ndhiAwFkct2PKXR2EgjwWTv3+q2jaNMeRQ+hM9uyOtSpjdQL/RF05+RhwqNsTitVBLO8xPUOHyX6KO6nBpPhmJmReB54Ul+PjF2ny+IhZe9wUZd4MGmK5ykoOa9wey9x2DWOKjGcKtvbRNQz6O/7VMC2NtaxyLTZQsfHQOOgdSUQQT4MSxP+E3dPW6tj0jOg/oWc31uPw67WCbYxGmrjs/msKSkiiewbqOir/sUQFG7Wa3FFt6/3DnJsdYf6yYsf90dQGL
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6451.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(346002)(366004)(396003)(39860400002)(136003)(376002)(230173577357003)(230273577357003)(230922051799003)(451199024)(1800799012)(64100799003)(186009)(2906002)(31696002)(6512007)(86362001)(26005)(122000001)(2616005)(4326008)(8936002)(8676002)(478600001)(41300700001)(38070700009)(107886003)(36756003)(38100700002)(31686004)(71200400001)(83380400001)(66556008)(66476007)(66446008)(64756008)(66946007)(316002)(921011)(5660300002)(53546011)(7416002)(6486002)(76116006)(91956017)(110136005)(6506007)(138113003)(45980500001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?VVBvVlFvc21USDJGdjRPYlBPNFFYam9XVmsrTWVtL1VuZjlDcjl3M0JrNGls?=
 =?utf-8?B?Y2dQUW1ibzRCVlRPaEFPb1R5WW5vczkySFNYMnU1MEhXYjNtM3o5ZFQya1lr?=
 =?utf-8?B?dUlYZjlJZFYyNmZ1cmJNbThPUkNCTmhkdFU4WFJFZU5mSFM5bFFZSVkwQzZS?=
 =?utf-8?B?dTZDYTNEc3pMalBvR0E5SmZEY2lJemtmRDU4THdoMG9JRk9YYVYrV0FFSVFk?=
 =?utf-8?B?T0VxZ3p3N3ZLc2IybXAwanVtNER2V292ckg0MU5ZMk5iMnBNSEt6MXB0c1pM?=
 =?utf-8?B?UlgzS0laNjFiVGt1dmQ1eFFzejBEcHc5QWNmZzdIeVpFUUhQV1VQTXdSQkh4?=
 =?utf-8?B?ZVNxOUJ4ajY0R3BrTmRta21aNmUxY2ZleFR1SnpjTjRJcFIxU1huRCtEUnIx?=
 =?utf-8?B?SjRrQ3p3ekQ4Qy9qL2Z6NWM0azlRL2JuMGRGMURjSGpuV1FBQjh0bjdIc2dR?=
 =?utf-8?B?N0dkYXI5WXRjbStLKzlPOUJ2Sm5Xa2hQUXlETWhYVmpReSsyaDgzcFphUHZU?=
 =?utf-8?B?N0VLRmpOMU9MMFFxTVhJbjdjUklEaGF5TTJQTi90WW5XWG5QSm5ReUh2bmh0?=
 =?utf-8?B?NjNaYjhmZGFXR3ovOStVRmUrTWRrL1NIbzUyYkNHQ0pydmc0TmVTZXlhcTdQ?=
 =?utf-8?B?UUtSRk82ZWxPUEh3N0JPWUhrUEdrZkViUlBUS3gxUzdQdGhmRWJkR2hLc0xR?=
 =?utf-8?B?M0pvN05PcEhNTHR1VDNBcUNvNDBoYlUzd0NDbXZvSFZLUnBTTlppTzE4Wlpr?=
 =?utf-8?B?R0JUa1AwMVZYVmwzMXVCZXdvNVlzZG92T1lpK0xFRnk0MXpRbElaRE9SS21M?=
 =?utf-8?B?ZnZrcjY0ck9SK2FFNDNIeTlqS0tHTmFzbkZBWXg1TG5TVkVENjc0Snd5djJR?=
 =?utf-8?B?cXFXQU9VVFE0MzV2ODV1TXRrZ1JhZVQ2d2FLVmZMOGlEK2tQaC9tcEV3NFBo?=
 =?utf-8?B?UldibllBRWw5ZzFZeWNhNnpFeGx0d0QwM1VxcUZpdFJ1dnpnNmhHS2Y1djNn?=
 =?utf-8?B?VkoybnpOd2xzM3R0Z3BwckllUW9jaGY5dzJPczczaXkvYkZyQ0h2QXlXOFRJ?=
 =?utf-8?B?NHU4VVNDWXJFVG5ZaHRneWh6N2laK1NTb3Y2YnJTTEtoVmwvNmVBYmxoQXBy?=
 =?utf-8?B?dHQvYkRPWEFsaUZqWkpBY2ZUVEhUM3kyNDd5ZDIyYmFEYmUvWGVkSVM5TEg1?=
 =?utf-8?B?YUF3V2Q1RWZRaUVMaXpTdmtMSk9lQmp3R3FNb3FRd1dSQVM4bjkwTnZhbm1a?=
 =?utf-8?B?cXN5Q0FOc20yTXBTaXZVR0NZdEo0dE1JbU8xOFZ2NXhNYk9GWkpreTZWVGtD?=
 =?utf-8?B?RVhIQXNoV0l4UjlHL29IaU9mblppYXRqS1hsZTlycDdSdHQyZU1RdUcvNzBB?=
 =?utf-8?B?L3hCZERHOVA4ZXd1MVV5cU8xck5OcnJGcGN0Mk5XMkhwRGVRSU12SDVLY3V4?=
 =?utf-8?B?RHgvOGlCMFpXNEtvWGxvZGZUTnlucVErODROQnMvTTZMR1hWbGxZVEQ1U0FR?=
 =?utf-8?B?L1A3T1c4dm4xMklzVWNtWmVFWnMzanFZUURKVjBBQm5tSVhDcCtiTDA1R0VY?=
 =?utf-8?B?d2IyTUV3LzVZKzRvRFVCUEw5dko4elh1MXkzRUdtUEhCc04xdDNrSzJRMUpi?=
 =?utf-8?B?MTJQR1JZaXo1Q2VnWlpWanA0a0h3cnlNdS9yS3JNWGhwU2FDenFObkJwdWt3?=
 =?utf-8?B?V1lYZ0ViZS9BYm5wNjFJTDdaOGJQN3NraTk3K2YwSWxsSGRtcE56NitwQ3RD?=
 =?utf-8?B?M0xFN0tFallqbjJwZnJSM1NwQVZZZ2RFcUI4NWR2TzlITUZDZ1U0ZE5pREtN?=
 =?utf-8?B?Zmc0dE5TSzFLM1VxVSt2RGJZa1pDQk1GV3EzNlJLcVFaMmlGNlFHbzZJaEtF?=
 =?utf-8?B?ejhSWEtCMjRUNnZpNmRsNGlnek95QnFTVENkWmlVT1hhaW42N0pReXVmMVZi?=
 =?utf-8?B?eXlwbDF5SWRoSWNNZmt3QVJSTFFLRzY4aHoyY2Vrei8zVkNqTmtEbVdXTkgv?=
 =?utf-8?B?N0F4dEdCWUxFNmdPMkozMjZqZHN1eURYRzlrd05ZaC9tVmZSQy9LamFXMUVy?=
 =?utf-8?B?SjljVml0MXNhK3VrdWc0Z1JGZzhmd25VWjFML2VQQTkybVJmc1MyV3NuRXhS?=
 =?utf-8?Q?foJu6jzTqQkWZ90jVASMOuWP1?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <F2A766434F41AF4E83A5F0E4A706EBCA@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6451.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 99363b56-9666-4e5b-e9b8-08dc1bed01dd
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Jan 2024 08:26:33.1796 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: pC1fTJ2CEaeNR+LtuqbbHnSbNvO1qSJq/1oL6ZOzDwHO/7WxNi/Kfa+DUmA5ksqQyxFWDM9v1lx+I2lw5Nx8ig==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7250
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
Cc: Linux4Microchip@microchip.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgS3J6eXN6dG9mLA0KDQpPbiAyMi8wMS8yNCA5OjE5IHBtLCBLcnp5c3p0b2YgS296bG93c2tp
IHdyb3RlOg0KPiBFWFRFUk5BTCBFTUFJTDogRG8gbm90IGNsaWNrIGxpbmtzIG9yIG9wZW4gYXR0
YWNobWVudHMgdW5sZXNzIHlvdSBrbm93IHRoZSBjb250ZW50IGlzIHNhZmUNCj4gDQo+IE9uIDIy
LzAxLzIwMjQgMDk6MjksIERoYXJtYSBCYWxhc3ViaXJhbWFuaSB3cm90ZToNCj4+IEFkZCBhIG5l
dyBMVkRTIGNvbnRyb2xsZXIgZHJpdmVyIGZvciBzYW05eDcgd2hpY2ggZG9lcyB0aGUgZm9sbG93
aW5nOg0KPj4gLSBQcmVwYXJlcyBhbmQgZW5hYmxlcyB0aGUgTFZEUyBQZXJpcGhlcmFsIGNsb2Nr
DQo+PiAtIERlZmluZXMgaXRzIGNvbm5lY3RvciB0eXBlIGFzIERSTV9NT0RFX0NPTk5FQ1RPUl9M
VkRTIGFuZCBhZGRzIGl0c2VsZg0KPj4gdG8gdGhlIGdsb2JhbCBicmlkZ2UgbGlzdC4NCj4+IC0g
SWRlbnRpZmllcyBpdHMgb3V0cHV0IGVuZHBvaW50IGFzIHBhbmVsIGFuZCBhZGRzIGl0IHRvIHRo
ZSBlbmNvZGVyDQo+PiBkaXNwbGF5IHBpcGVsaW5lDQo+PiAtIEVuYWJsZXMgdGhlIExWRFMgc2Vy
aWFsaXplcg0KPj4NCj4+IFNpZ25lZC1vZmYtYnk6IE1hbmlrYW5kYW4gTXVyYWxpZGhhcmFuIDxt
YW5pa2FuZGFuLm1AbWljcm9jaGlwLmNvbT4NCj4+IFNpZ25lZC1vZmYtYnk6IERoYXJtYSBCYWxh
c3ViaXJhbWFuaSA8ZGhhcm1hLmJAbWljcm9jaGlwLmNvbT4NCj4+IC0tLQ0KPiANCj4gLi4uDQo+
IA0KPj4gKw0KPj4gK3N0YXRpYyBpbnQgbWNocF9sdmRzX3Byb2JlKHN0cnVjdCBwbGF0Zm9ybV9k
ZXZpY2UgKnBkZXYpDQo+PiArew0KPj4gKyAgICAgc3RydWN0IGRldmljZSAqZGV2ID0gJnBkZXYt
PmRldjsNCj4+ICsgICAgIHN0cnVjdCBtY2hwX2x2ZHMgKmx2ZHM7DQo+PiArICAgICBzdHJ1Y3Qg
cmVzb3VyY2UgKnJlczsNCj4+ICsgICAgIHN0cnVjdCBkZXZpY2Vfbm9kZSAqcG9ydDsNCj4+ICsg
ICAgIGludCByZXQ7DQo+PiArDQo+PiArICAgICBpZiAoIWRldi0+b2Zfbm9kZSkNCj4+ICsgICAg
ICAgICAgICAgcmV0dXJuIC1FTk9ERVY7DQo+PiArDQo+PiArICAgICBsdmRzID0gZGV2bV9remFs
bG9jKCZwZGV2LT5kZXYsIHNpemVvZigqbHZkcyksIEdGUF9LRVJORUwpOw0KPj4gKyAgICAgaWYg
KCFsdmRzKQ0KPj4gKyAgICAgICAgICAgICByZXR1cm4gLUVOT01FTTsNCj4+ICsNCj4+ICsgICAg
IGx2ZHMtPmRldiA9IGRldjsNCj4+ICsNCj4+ICsgICAgIHJlcyA9IHBsYXRmb3JtX2dldF9yZXNv
dXJjZShwZGV2LCBJT1JFU09VUkNFX01FTSwgMCk7DQo+PiArICAgICBsdmRzLT5yZWdzID0gZGV2
bV9pb3JlbWFwX3Jlc291cmNlKGx2ZHMtPmRldiwgcmVzKTsNCj4gDQo+IFdoeSBub3QgY29tYmlu
aW5nIHRoZXNlIHR3bz8NCg0KSXQgc2VlbXMgcmVhc29uYWJsZSB0byBjb21iaW5lIHRoZXNlIHR3
byBsaW5lcyBzaW5jZSB0aGUgcmVzb3VyY2UgDQp2YXJpYWJsZSAocmVzKSBpcyBvbmx5IHVzZWQg
YXQgdGhpcyBwb2ludC4gSSdsbCBwcm9jZWVkIHdpdGggDQpjb25zb2xpZGF0aW5nIHRoZXNlIGxp
bmVzIGZvciBzaW1wbGljaXR5Lg0KDQo+IA0KPj4gKyAgICAgaWYgKElTX0VSUihsdmRzLT5yZWdz
KSkNCj4+ICsgICAgICAgICAgICAgcmV0dXJuIFBUUl9FUlIobHZkcy0+cmVncyk7DQo+PiArDQo+
PiArICAgICBsdmRzLT5wY2xrID0gZGV2bV9jbGtfZ2V0KGx2ZHMtPmRldiwgInBjbGsiKTsNCj4+
ICsgICAgIGlmIChJU19FUlIobHZkcy0+cGNsaykpIHsNCj4+ICsgICAgICAgICAgICAgRFJNX0RF
Vl9FUlJPUihsdmRzLT5kZXYsICJjb3VsZCBub3QgZ2V0IHBjbGtfbHZkc1xuIik7DQo+IA0KPiBI
YW5kbGUgcHJvcGVybHkgZGVmZXJyZWQgcHJvYmUuIFdoYXQncyBEUk0gd3JhcHBlciBvdmVyIGRl
dl9lcnJfcHJvYmUoKT8NClN1cmUsIEkgd2lsbCB1c2UgZGV2X2Vycl9wcm9iZSgpDQoNCnJldHVy
biBkZXZfZXJyX3Byb2JlKGx2ZHMtPmRldiwgUFRSX0VSUihsdmRzLT5wY2xrKSwgImNvdWxkIG5v
dCBnZXQgDQpwY2xrX2x2ZHNcbiIpOw0KDQo+IA0KPj4gKyAgICAgICAgICAgICByZXR1cm4gUFRS
X0VSUihsdmRzLT5wY2xrKTsNCj4+ICsgICAgIH0NCj4+ICsNCj4+ICsgICAgIHJldCA9IGNsa19w
cmVwYXJlKGx2ZHMtPnBjbGspOw0KPj4gKyAgICAgaWYgKHJldCA8IDApIHsNCj4+ICsgICAgICAg
ICAgICAgRFJNX0RFVl9FUlJPUihsdmRzLT5kZXYsICJmYWlsZWQgdG8gcHJlcGFyZSBwY2xrX2x2
ZHNcbiIpOw0KPj4gKyAgICAgICAgICAgICByZXR1cm4gcmV0Ow0KPj4gKyAgICAgfQ0KPj4gKw0K
Pj4gKyAgICAgcG9ydCA9IG9mX2dyYXBoX2dldF9yZW1vdGVfbm9kZShkZXYtPm9mX25vZGUsIDEs
IDApOw0KPj4gKyAgICAgaWYgKCFwb3J0KSB7DQo+PiArICAgICAgICAgICAgIERSTV9ERVZfRVJS
T1IoZGV2LA0KPj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICJjYW4ndCBmaW5kIHBvcnQg
cG9pbnQsIHBsZWFzZSBpbml0IGx2ZHMgcGFuZWwgcG9ydCFcbiIpOw0KPj4gKyAgICAgICAgICAg
ICByZXR1cm4gLUVJTlZBTDsNCj4+ICsgICAgIH0NCj4+ICsNCj4+ICsgICAgIGx2ZHMtPnBhbmVs
ID0gb2ZfZHJtX2ZpbmRfcGFuZWwocG9ydCk7DQo+PiArICAgICBvZl9ub2RlX3B1dChwb3J0KTsN
Cj4+ICsNCj4+ICsgICAgIGlmIChJU19FUlIobHZkcy0+cGFuZWwpKSB7DQo+PiArICAgICAgICAg
ICAgIERSTV9ERVZfRVJST1IoZGV2LCAiZmFpbGVkIHRvIGZpbmQgcGFuZWwgbm9kZVxuIik7DQo+
PiArICAgICAgICAgICAgIHJldHVybiAtRVBST0JFX0RFRkVSOw0KPiANCj4gT0ssIHRoYXQncyBm
b3Igc3VyZSB3cm9uZy4gRG9uJ3QgcHJpbnQgYW55dGhpbmcgb24gZGVmZXJyZWQgcHJvYmUuDQpT
dXJlLCBJIHdpbGwgZHJvcCB0aGUgcHJpbnQgaGVyZS4NCj4gDQo+PiArICAgICB9DQo+PiArDQo+
PiArICAgICBsdmRzLT5wYW5lbF9icmlkZ2UgPSBkZXZtX2RybV9wYW5lbF9icmlkZ2VfYWRkKGRl
diwgbHZkcy0+cGFuZWwpOw0KPj4gKw0KPj4gKyAgICAgaWYgKElTX0VSUihsdmRzLT5wYW5lbF9i
cmlkZ2UpKQ0KPj4gKyAgICAgICAgICAgICByZXR1cm4gUFRSX0VSUihsdmRzLT5wYW5lbF9icmlk
Z2UpOw0KPj4gKw0KPj4gKyAgICAgbHZkcy0+YnJpZGdlLm9mX25vZGUgPSBkZXYtPm9mX25vZGU7
DQo+PiArICAgICBsdmRzLT5icmlkZ2UudHlwZSA9IERSTV9NT0RFX0NPTk5FQ1RPUl9MVkRTOw0K
Pj4gKyAgICAgbHZkcy0+YnJpZGdlLmZ1bmNzID0gJm1jaHBfbHZkc19icmlkZ2VfZnVuY3M7DQo+
PiArDQo+PiArICAgICBkZXZfc2V0X2RydmRhdGEoZGV2LCBsdmRzKTsNCj4+ICsgICAgIHBtX3J1
bnRpbWVfZW5hYmxlKGRldik7DQo+PiArDQo+PiArICAgICBkcm1fYnJpZGdlX2FkZCgmbHZkcy0+
YnJpZGdlKTsNCj4+ICsNCj4+ICsgICAgIHJldHVybiAwOw0KPj4gK30NCj4+ICsNCj4+ICtzdGF0
aWMgaW50IG1jaHBfbHZkc19yZW1vdmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikNCj4+
ICt7DQo+PiArICAgICBzdHJ1Y3QgbWNocF9sdmRzICpsdmRzID0gcGxhdGZvcm1fZ2V0X2RydmRh
dGEocGRldik7DQo+PiArDQo+PiArICAgICBwbV9ydW50aW1lX2Rpc2FibGUoJnBkZXYtPmRldik7
DQo+PiArICAgICBjbGtfdW5wcmVwYXJlKGx2ZHMtPnBjbGspOw0KPj4gKw0KPj4gKyAgICAgcmV0
dXJuIDA7DQo+PiArfQ0KPj4gKw0KPj4gK3N0YXRpYyBjb25zdCBzdHJ1Y3Qgb2ZfZGV2aWNlX2lk
IG1jaHBfbHZkc19kdF9pZHNbXSA9IHsNCj4+ICsgICAgIHsNCj4+ICsgICAgICAgICAgICAgLmNv
bXBhdGlibGUgPSAibWljcm9jaGlwLHNhbTl4Ny1sdmRzIiwNCj4+ICsgICAgIH0sDQo+PiArICAg
ICB7fSwNCj4+ICt9Ow0KPj4gKw0KPj4gK3N0cnVjdCBwbGF0Zm9ybV9kcml2ZXIgbWNocF9sdmRz
X2RyaXZlciA9IHsNCj4+ICsgICAgIC5wcm9iZSA9IG1jaHBfbHZkc19wcm9iZSwNCj4+ICsgICAg
IC5yZW1vdmUgPSBtY2hwX2x2ZHNfcmVtb3ZlLA0KPj4gKyAgICAgLmRyaXZlciA9IHsNCj4+ICsg
ICAgICAgICAgICAgICAgLm5hbWUgPSAibWljcm9jaGlwLWx2ZHMiLA0KPj4gKyAgICAgICAgICAg
ICAgICAub2ZfbWF0Y2hfdGFibGUgPSBtY2hwX2x2ZHNfZHRfaWRzLA0KPj4gKyAgICAgfSwNCj4+
ICt9Ow0KPj4gK21vZHVsZV9wbGF0Zm9ybV9kcml2ZXIobWNocF9sdmRzX2RyaXZlcik7DQo+PiAr
DQo+PiArTU9EVUxFX0FVVEhPUigiTWFuaWthbmRhbiBNdXJhbGlkaGFyYW4gPG1hbmlrYW5kYW4u
bUBtaWNyb2NoaXAuY29tPiIpOw0KPj4gK01PRFVMRV9BVVRIT1IoIkRoYXJtYSBCYWxhc3ViaXJh
bWFuaSA8ZGhhcm1hLmJAbWljcm9jaGlwLmNvbT4iKTsNCj4+ICtNT0RVTEVfREVTQ1JJUFRJT04o
IkxvdyBWb2x0YWdlIERpZmZlcmVudGlhbCBTaWduYWxpbmcgQ29udHJvbGxlciBEcml2ZXIiKTsN
Cj4+ICtNT0RVTEVfTElDRU5TRSgiR1BMIik7DQo+PiArTU9EVUxFX0FMSUFTKCJwbGF0Zm9ybTpt
aWNyb2NoaXAtbHZkcyIpOw0KPiANCj4gWW91IHNob3VsZCBub3QgbmVlZCBNT0RVTEVfQUxJQVMo
KSBpbiBub3JtYWwgY2FzZXMuIElmIHlvdSBuZWVkIGl0LA0KPiB1c3VhbGx5IGl0IG1lYW5zIHlv
dXIgZGV2aWNlIElEIHRhYmxlIGlzIHdyb25nIChlLmcuIG1pc3NlcyBlaXRoZXINCj4gZW50cmll
cyBvciBNT0RVTEVfREVWSUNFX1RBQkxFKCkpLiBNT0RVTEVfQUxJQVMoKSBpcyBub3QgYSBzdWJz
dGl0dXRlDQo+IGZvciBpbmNvbXBsZXRlIElEIHRhYmxlLg0KDQpPa2F5LCBJIHdpbGwgcmVtb3Zl
IHRoZSBNT0RVTEVfQUxJQVMgYW5kIHVwZGF0ZSB0aGUgbWNocF9sdmRzX2R0X2lkc1tdIA0KYXMg
YmVsb3cgYWxvbmcgd2l0aCBNT0RVTEVfREVWSUNFX1RBQkxFKCkNCg0Kc3RhdGljIGNvbnN0IHN0
cnVjdCBvZl9kZXZpY2VfaWQgbWNocF9sdmRzX2R0X2lkc1tdID0gew0KICAgICAgICAgew0KICAg
ICAgICAgICAgICAgICAuY29tcGF0aWJsZSA9ICJtaWNyb2NoaXAsc2FtOXg3Mi1sdmRzIiwNCiAg
ICAgICAgIH0sDQogICAgICAgICB7DQogICAgICAgICAgICAgICAgIC5jb21wYXRpYmxlID0gIm1p
Y3JvY2hpcCxzYW05eDc1LWx2ZHMiLA0KICAgICAgICAgfSwNCiAgICAgICAgIHt9LA0KfTsNCk1P
RFVMRV9ERVZJQ0VfVEFCTEUob2YsIG1jaHBfbHZkc19kdF9pZHMpOw0KDQotLSANClRoYW5rcywN
CkRoYXJtYSBCLg0KPiANCj4gDQo+IEJlc3QgcmVnYXJkcywNCj4gS3J6eXN6dG9mDQo+IA0KDQoN
Cg0K
