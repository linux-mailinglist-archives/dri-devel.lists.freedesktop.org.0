Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A279E349359
	for <lists+dri-devel@lfdr.de>; Thu, 25 Mar 2021 14:54:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7DCF56EB14;
	Thu, 25 Mar 2021 13:54:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2081.outbound.protection.outlook.com [40.107.93.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7DE4A6EB14
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Mar 2021 13:54:40 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LVwfINsggBvTR0HoGIlHgEBEHvzHGXSpPU3P1J2SIhbXU1oiJVaSjeoyJgSsBzUDFNkrWZWL+AXsDLed2pt9SrvgzD1lCc3IrTSTHnL5SMagnpiVAxrti7JZntpySFwbId+6DD6VK8qDOOFIHy1wazd5hl7VgJGyj8AvWRN1Y5y436B20y9t/d9B0ML5CvL1BP2a5ApnJjgLR8JVPrba79UYa89L5hTloH3Q8v5CNWrTfg0YTfMGjHCTqzGE0924FllLFABu88jTaRqfO8TTN4ByFhWADVPLGz3AtlU4XCcDSWVYJJsRjsgRH2Hh0YmJDCCGISc6+ooha2n5yDOhUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ErS6VkbXMbaQ4oeF02Zrp98JvYd8uWTDhyyQrh50eLw=;
 b=T8mzDM5aAOVfEbI0YORV4wLEwjVZ9e33VDwN7T/9cJQoPCg7hF6GTPxdU73IvTwjVPOWNPt4fEqxpxy4vPaGBpjLj5quEbI4n2MnBZAtke7rvPdrl4cmoZD08Ptp+ze5o1rYOF8LX60/NMKW4E5cjbmE5yxn1JI85e9zCYCv2hZzR0j3KgjaHseFSNL+ojKxdNMqCKboUv/uu+ejFDSRK2Ywpo16uDL6Xc0WQ1ciHYlVxT6T8ZIpOD25Nd5RA7mKGPBokOJF8g5WOjvdgtte/7o6sAxjGbz3mZK8hWOfFQ0DPYSS920QfVCW/TpXFGyyVOOU99keItRHU2MXhlWeBw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ErS6VkbXMbaQ4oeF02Zrp98JvYd8uWTDhyyQrh50eLw=;
 b=AZKlipjPrXAcpAdNG/z2ugsHg5vlkA0+opsiNucnTnMjtSeVXR5+FUii6jMBV2anrc2o87VxaJFzFS3wHI2CIXbyoHznXHKju88AJZchH6GuTL3IC4NwjpDGfhHpYPzGyZA8c0LCcKT7gUiTSrrOZU/r9qOeBiDhGwdvJHHKExE=
Authentication-Results: linux-foundation.org; dkim=none (message not signed)
 header.d=none;linux-foundation.org; dmarc=none action=none
 header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by MN2PR12MB4360.namprd12.prod.outlook.com (2603:10b6:208:266::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3977.26; Thu, 25 Mar
 2021 13:54:37 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::c1ff:dcf1:9536:a1f2]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::c1ff:dcf1:9536:a1f2%2]) with mapi id 15.20.3977.029; Thu, 25 Mar 2021
 13:54:37 +0000
Subject: Re: [RFC PATCH 1/2] mm,drm/ttm: Block fast GUP to TTM huge pages
To: Jason Gunthorpe <jgg@nvidia.com>
References: <fb74efd9-55be-9a8d-95b0-6103e263aab8@amd.com>
 <15da5784-96ca-25e5-1485-3ce387ee6695@shipmail.org>
 <20210325113023.GT2356281@nvidia.com>
 <afad3159-9aa8-e052-3bef-d00dee1ba51e@shipmail.org>
 <20210325120103.GV2356281@nvidia.com>
 <a0d0ffd7-3c34-5002-f4fe-cb9d4ba0279e@amd.com>
 <20210325124206.GA599656@nvidia.com>
 <00f79bae-75c4-d694-8dc9-35ac21cd1006@amd.com>
 <20210325131756.GX2356281@nvidia.com>
 <13227fd0-6c41-992e-63e7-877f718c1577@amd.com>
 <20210325133347.GY2356281@nvidia.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <8cf06da9-2a08-45c4-1339-bcc38fdd04df@amd.com>
Date: Thu, 25 Mar 2021 14:54:31 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
In-Reply-To: <20210325133347.GY2356281@nvidia.com>
Content-Language: en-US
X-Originating-IP: [2a02:908:1252:fb60:72d1:2a48:a80e:e149]
X-ClientProxiedBy: AM0PR10CA0083.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:208:15::36) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:72d1:2a48:a80e:e149]
 (2a02:908:1252:fb60:72d1:2a48:a80e:e149) by
 AM0PR10CA0083.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:208:15::36) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3977.25 via Frontend Transport; Thu, 25 Mar 2021 13:54:36 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 5a89d22c-cb1a-4fce-fe50-08d8ef958750
X-MS-TrafficTypeDiagnostic: MN2PR12MB4360:
X-Microsoft-Antispam-PRVS: <MN2PR12MB436063F32133C69879A99E6683629@MN2PR12MB4360.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: SXUcIYf1MfcwRYM4OHLfJ8xxn/ichgM/Je6D878IvfM1sR4sI9DgNUlFC60+BkDvwoTJ9KJDn9/OV7TqafJf4WettxIah0HNKfT6wFT8Ruh7lZ2UxbTdJkb4Apbn/dtBe6n+t1oW3t0Fio32NolESPfLEXgZ4OvW76lXTl6ULx7KlP3IYOl+hgvG/Uo6zwIlnCFaMhPjuxv5UHgbEqgNt3rye/yT3uxpGSPi+zmsw8xyn7czhqpS+ALPLuRkCE3fRWfp9yRJnwL2K2lyks1LQwmSDjmKjGE37vhHbsbXKoaTTfjU+QJkpgfbjTbn+/7vIXpBY8fvazQkS8kheOcyIzLdOUpNeL+9GG/VWb2hosZyPmg54LoZtlJSq9BowGIjajyLQdqz/THggkACQ/c5ZfZ0WcBS0/Awg+Dqs2nQ66J2JCoTHMGASAtLF/2MwkXI0aLBmySztPCc/A1OMKVrA0vrdGo2YP9sJOeEvwLwrs+KBOM0djp1J1I66fmTlP1QD9pUDifrYwbWtbPsvfmza6Zh/Q6k0R2r23Gt8/X2zNoQCwQWeGbuyrGgy8DwFx3iJx0fqCOHf37+9e59fRfCf6XxXx9EwZo0QGm2dzgWUeDYM2y7qB+vzqp9rbhxk7/Y7jydSFrJHGGYYp6Hxob6jcP6OrVVz8KpCDRlh2k9mV/Fzj9w5rGkh2V7fTBFI5xwG0fwk/0NiwCVfEGYOg8Vcc7uBrR3I/hn/KRgnPtQ0UuvmvJO1JO4QXzUCo3AIUN3
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(39860400002)(346002)(396003)(376002)(366004)(5660300002)(8936002)(4326008)(478600001)(2906002)(2616005)(316002)(54906003)(38100700001)(31686004)(186003)(8676002)(6916009)(6666004)(6486002)(36756003)(52116002)(86362001)(16526019)(31696002)(83380400001)(66946007)(66476007)(66556008)(14583001)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?aWlYcEQ4V0VtbEI5dGNocGJHc084cFFuVUVaYmxleVZrbVJGaE1ZZHRSRURv?=
 =?utf-8?B?TGt1Qnh2eGxSNGlPajdENUtNZ2wxeTUyVUFGVm9sUExFaTBhbDM5SUVOVXYz?=
 =?utf-8?B?NGRMdzF3REQwbmZFd21ZZTM3dEJQNUEwYkJuSkMrVHcxQzZoNGJNU0x1Y3FO?=
 =?utf-8?B?SFBaL2pISmdwKzJjSU5hZWZ3aHpzSVFJWGQ5UVRDSnJJV1hUeGNhcFNyRmRi?=
 =?utf-8?B?YUtHSGRGT1hiZjJHTWF1UFMvZ2d5UkVmU0dsSEdqQ1E5S2RQU0l0Q1ZDVFlh?=
 =?utf-8?B?bkRTUVJOV2REOGNPa0hnZ1ZuSUs5T1ZiUzhFcnd6blRlOHhRTmtEdkpvTW9I?=
 =?utf-8?B?UUZPTFZIMTJDNmU1d0t1RGZFTFFrVjJkYS9oU2hMWGtwMXFwdWFlcWJreFJH?=
 =?utf-8?B?MFdGbDdCbXEvZjhSV0pWYlFrbGdQUTlhelB1TTZ3dmlzOUR6SmlPZkwyV29m?=
 =?utf-8?B?bS9mdGJLRVdlZ29qcktneUQ3YzZxdStZSXVsaGFaVHE5WVhDOStmdU51MXEx?=
 =?utf-8?B?Z0ozbXVjZ1p4QnJsZitscUZaQUVoQnhCTjl3QlgySlREME9wcjV6VmVmVDBT?=
 =?utf-8?B?dTZvcUJTMEd5VFpyaVYxUUwySzA3Z2dkUi9uTFNPMUwrSEZYRWNsdmJLN0I4?=
 =?utf-8?B?VnE5UXFvV1U4c3JDbGp3STRBMVVKWVBibkVRcFY4TW5uZ1NTQ3MxbWtSSVlI?=
 =?utf-8?B?OFYwUU9XdktJMmR3eTRvUTlhbmEzVHpCdXVTTGdlYllqbW0zdjNFRzFXNkkr?=
 =?utf-8?B?dHVXTWZya242Tkc4Z0xDMWVrSFk1ZUlCa2RqN2loZ2pYRFA3amZhbFExajFs?=
 =?utf-8?B?RnYwWUpnUWJLMlFIdUNKeGgzL01zZ1NJQjVKQ3Q5bnd5cEs3VWlrNGVPdVVn?=
 =?utf-8?B?b0c2Zkl3L2pBNm1vNzV0Z2VlNzdrdHVMT0k4V3BGV29jU3lQZEFiTVk2cmd6?=
 =?utf-8?B?WEkvM2J5NThWeEVHeWZCclU5VWdPNm9QZ2VyaHpXbjQ2RGVuNm0wZzdpa2lz?=
 =?utf-8?B?VHlZSUZMRDFHcTVlcXpHL1dpbDJjOVllOVF4MHpGTW0zQ0JPaWFzSTc1dnNu?=
 =?utf-8?B?MUtIT2lyY0NWRVlHdHh3R09XYXVGYWtBSElZK0RTMGFMQVI1T1N1Y05ldEpN?=
 =?utf-8?B?cnA5THpRbVQ5L0haaUVEVHpVWG1LNEtFT1BkQVEzUXl3MkNVMTV4Qk00SUwx?=
 =?utf-8?B?U2cvNXVPSVJJb3pPN2gzK0w4K2tkdi9YY1JiUTZnRGFnM2h6VlNQWGVQdVlV?=
 =?utf-8?B?S0ZhdHlUOEU5bXFGMUh5WXJQYzlCcDBCQzdBOGpvSEdNeE12eFBOL1JLUmF1?=
 =?utf-8?B?d2dzSjRvVEVNeVRETGlHUkllQjdzYTB5bGRjcXI2TTdMblJ2UjliNkt1NzNM?=
 =?utf-8?B?ejE0MmVxTDArUzFLeWtTQks5OFZxa1RUM1lBc2xSWHhTaDMyeENRTTN2UGxE?=
 =?utf-8?B?YVROTkFlWnlFb0xyWGY1QktzeDJJaUFhY1IrSkt6QTRoREdUYnNHam13TE5s?=
 =?utf-8?B?b1pJcTVPSW1ZZFRUYzNqczV2dkVoaVJXUmpTaVNuL1JrOWlXK2VQQWl1VVFD?=
 =?utf-8?B?TGlrZ2Q4ajVWeVNvaHJRTUs0a1B1bTl0cno5MjR5T2N2cEVKY3pxNkRxc2NJ?=
 =?utf-8?B?bkl0cldBT04zcS90V1BSU24rN3pzMXNiSGtONjExWVY1T0xaZDJYMi9Pay95?=
 =?utf-8?B?MGE0SUhqZVRKd0xhVGlVR3RkVjRZOFNISWVxdVByUlk0eXZiUzE3cG85T0hy?=
 =?utf-8?B?ZEhGd0k5VFJwMnJoM0NpNGhQVENueVRFNnhXQ2lEV3NDSCt2YjUzd3FmN2hm?=
 =?utf-8?B?ZXYzK0doY3k3ME9jOVdIOFgvRG9mR1RIamZHanFNeks1cU9PV2FFWDNVZHpU?=
 =?utf-8?Q?RLNDsghjvFImy?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5a89d22c-cb1a-4fce-fe50-08d8ef958750
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Mar 2021 13:54:37.6400 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CETze1o8cvBvh7hmnM+WVhfHuW4n9CC26pArczoOMayxr6Ebhfwz9ltRSAz5UUs1
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4360
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
Cc: David Airlie <airlied@linux.ie>,
 =?UTF-8?Q?Thomas_Hellstr=c3=b6m_=28Intel=29?= <thomas_os@shipmail.org>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-mm@kvack.org, Andrew Morton <akpm@linux-foundation.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QW0gMjUuMDMuMjEgdW0gMTQ6MzMgc2NocmllYiBKYXNvbiBHdW50aG9ycGU6Cj4gT24gVGh1LCBN
YXIgMjUsIDIwMjEgYXQgMDI6MjY6NTBQTSArMDEwMCwgQ2hyaXN0aWFuIEvDtm5pZyB3cm90ZToK
Pj4gQW0gMjUuMDMuMjEgdW0gMTQ6MTcgc2NocmllYiBKYXNvbiBHdW50aG9ycGU6Cj4+PiBPbiBU
aHUsIE1hciAyNSwgMjAyMSBhdCAwMjowNToxNFBNICswMTAwLCBDaHJpc3RpYW4gS8O2bmlnIHdy
b3RlOgo+Pj4+IEFtIDI1LjAzLjIxIHVtIDEzOjQyIHNjaHJpZWIgSmFzb24gR3VudGhvcnBlOgo+
Pj4+PiBPbiBUaHUsIE1hciAyNSwgMjAyMSBhdCAwMTowOToxNFBNICswMTAwLCBDaHJpc3RpYW4g
S8O2bmlnIHdyb3RlOgo+Pj4+Pj4gQW0gMjUuMDMuMjEgdW0gMTM6MDEgc2NocmllYiBKYXNvbiBH
dW50aG9ycGU6Cj4+Pj4+Pj4gT24gVGh1LCBNYXIgMjUsIDIwMjEgYXQgMTI6NTM6MTVQTSArMDEw
MCwgVGhvbWFzIEhlbGxzdHLDtm0gKEludGVsKSB3cm90ZToKPj4+Pj4+Pgo+Pj4+Pj4+PiBOb3Bl
LiBUaGUgcG9pbnQgaGVyZSB3YXMgdGhhdCBpbiB0aGlzIGNhc2UsIHRvIG1ha2Ugc3VyZSBtbWFw
IHVzZXMgdGhlCj4+Pj4+Pj4+IGNvcnJlY3QgVkEgdG8gZ2l2ZSB1cyBhIHJlYXNvbmFibGUgY2hh
bmNlIG9mIGFsaWduZW1lbnQsIHRoZSBkcml2ZXIgbWlnaHQKPj4+Pj4+Pj4gbmVlZCB0byBiZSBh
d2FyZSBvZiBhbmQgZG8gdHJpY2tlcnkgd2l0aCB0aGUgaHVnZSBwYWdlLXRhYmxlLWVudHJ5IHNp
emVzCj4+Pj4+Pj4+IGFueXdheSwgYWx0aG91Z2ggSSB0aGluayBpbiBtb3N0IGNhc2VzIGEgc3Rh
bmRhcmQgaGVscGVyIGZvciB0aGlzIGNhbiBiZQo+Pj4+Pj4+PiBzdXBwbGllZC4KPj4+Pj4+PiBP
ZiBjb3Vyc2UgdGhlIGRyaXZlciBuZWVkcyBzb21lIHdheSB0byBpbmZsdWVuY2UgdGhlIFZBIG1t
YXAgdXNlcywKPj4+Pj4+PiBnZXJuYWxseSBpdCBzaG91bGQgYWxpZ24gdG8gdGhlIG5hdHVyYWwg
cGFnZSBzaXplIG9mIHRoZSBkZXZpY2UKPj4+Pj4+IFdlbGwgYSBtbWFwKCkgbmVlZHMgdG8gYmUg
YWxpZ25lZCB0byB0aGUgcGFnZSBzaXplIG9mIHRoZSBDUFUsIGJ1dCBub3QKPj4+Pj4+IG5lY2Vz
c2FyaWx5IHRvIHRoZSBvbmUgb2YgdGhlIGRldmljZS4KPj4+Pj4+Cj4+Pj4+PiBTbyBJJ20gcHJl
dHR5IHN1cmUgdGhlIGRldmljZSBkcml2ZXIgc2hvdWxkIG5vdCBiZSBpbnZvbHZlZCBpbiBhbnkg
d2F5IHRoZQo+Pj4+Pj4gY2hvb3Npbmcgb2YgdGhlIFZBIGZvciB0aGUgQ1BVIG1hcHBpbmcuCj4+
Pj4+IE5vLCBpZiB0aGUgZGV2aWNlIHdhbnRzIHRvIHVzZSBodWdlIHBhZ2VzIGl0IG11c3QgaW5m
bHVlbmNlIHRoZSBtbWFwCj4+Pj4+IFZBIG9yIGl0IGNhbid0IGZvcm0gaHVnZSBwZ2Flcy4KPj4+
PiBObywgdGhhdCdzIHRoZSBqb2Igb2YgdGhlIGNvcmUgTU0gYW5kIG5vdCBvZiB0aGUgaW5kaXZp
ZHVhbCBkcml2ZXIuCj4+PiBUaGUgY29yZSBtbSBkb2Vzbid0IGtub3cgdGhlIHBhZ2Ugc2l6ZSBv
ZiB0aGUgZGV2aWNlLCBvbmx5IHdoaWNoIG9mCj4+PiBzZXZlcmFsIHBhZ2UgbGV2ZWxzIHRoZSBh
cmNoIHN1cHBvcnRzLiBUaGUgZGV2aWNlIG11c3QgYmUgaW52b2xldmQKPj4+IGhlcmUuCj4+IFdo
eT8gU2VlIHlvdSBjYW4gaGF2ZSBhIGRldmljZSB3aGljaCBoYXMgZm9yIGV4YW1wbGUgMjU2S2lC
IHBhZ2VzLCBidXQgaXQKPj4gc2hvdWxkIHBlcmZlY3RseSB3b3JrIHRoYXQgdGhlIENQVSBtYXBw
aW5nIGlzIGFsaWduZWQgdG8gb25seSA0S2lCLgo+IFRoZSBnb2FsIGlzIHRvIG9wdGltaXplIGxh
cmdlIHBhZ2Ugc2l6ZSB1c2FnZSBpbiB0aGUgcGFnZSB0YWJsZXMuCj4KPiBUaGVyZSBhcmUgdGhy
ZWUgY3JpdGVyYSB0aGF0IGltcGFjdCB0aGlzOgo+ICAgMSkgVGhlIHBvc3NpYmxlIENQVSBwYWdl
IHRhYmxlIHNpemVzCj4gICAyKSBUaGUgdXNlZnVsIGNvbnRpZ3VpdHkgdGhlIGRldmljZSBjYW4g
Y3JlYXRlIGluIGl0cyBpb21lbW9yeQo+ICAgMykgVGhlIFZBJ3MgYWxpZ25tZW50LCBhcyB0aGlz
IHNldHMgYW4gdXBwZXIgYm91bmQgb24gMSBhbmQgMgo+Cj4gSWYgYSBkZXZpY2UgaGFzIDI1Nmsg
cGFnZXMgYW5kIHRoZSBhcmNoIHN1cHBvcnRzIDJNIGFuZCA0ayB0aGVuIHRoZSBWQQo+IHNob3Vs
ZCBhbGlnbiB0byBzb21ld2hlcmUgYmV0d2VlbiA0ayBhbmQgMjU2ay4gVGhlIGlkZWFsIGFsaWdu
bWVudAo+IHdvdWxkIGJlIHRvIG9wdGltaXplIFBURSB1c2FnZSB3aGVuIHN0dWZmaW5nIDI1Nmsg
YmxvY2tzIGJ5IGZ1bGx5Cj4gcG9wdWxhdGluZyBQVEVzIGFuZCBkZXBlbmRzIG9uIHRoZSBhcmNo
J3MgIyBvZiBQVEUncyBwZXIgcGFnZS4KCkFoISBTbyB5b3Ugd2FudCB0byBhbHNvIGF2b2lkIHRo
YXQgd2Ugb25seSBoYWx2ZSBwb3B1bGF0ZSBhIFBURXMgYXMgCndlbGwhIFRoYXQgcmF0aGVyIG5p
ZnR5LgoKQnV0IHlvdSBkb24ndCBuZWVkIHRoZSBkZXZpY2UgcGFnZSBzaXplIGZvciB0aGlzLiBK
dXN0IGxvb2tpbmcgYXQgdGhlIApzaXplIG9mIHRoZSBtYXBwaW5nIHNob3VsZCBiZSBlbm91Z2gu
CgpJbiBvdGhlciB3b3JkcyB3ZSB3b3VsZCBhbGlnbiB0aGUgVkEgc28gdGhhdCBpdCB0cmllcyB0
byBhdm9pZCBjcm9zc2luZyAKcGFnZSB0YWJsZSBib3VuZGFyaWVzLgoKQnV0IHRvIGJlIGhvbmVz
dCBJJ20gcmVhbGx5IHdvbmRlcmluZyB3aHkgdGhlIGhlY2sgd2UgZG9uJ3QgYWxyZWFkeSBkbyAK
dGhpcyBpbiB2bV91bm1hcHBlZF9hcmVhKCkuIFRoYXQgc2hvdWxkIGJlIGJlbmVmaWNpYWwgZm9y
IGJhc2ljYWxseSAKZXZlcnkgc2xpZ2h0bHkgbGFyZ2VyIG1hcHBpbmcuCgpDaHJpc3RpYW4uCgo+
Cj4gSWYgYSBkZXZpY2UgaGFzIDI1NmsgcGFnZXMgYW5kIHRoZSBhcmNoIHN1cHBvcnRzIDI1Nmsg
cGFnZXMgdGhlbiB0aGUKPiBWQSBzaG91bGQgYWxpZ24gdG8gMjU2ay4KPgo+IFRoZSBkZXZpY2Ug
c2hvdWxkIG5ldmVyIGJlIHRvdWNoaW5nIGFueSBvZiB0aGlzLCBpdCBzaG91bGQgc2ltcGx5Cj4g
aW5mb3JtIHdoYXQgaXRzIG9wZXJhdGluZyBwYWdlIHNpemUgaXMgYW5kIHRoZSBNTSBzaG91bGQg
dXNlIHRoYXQgdG8KPiBhbGlnbiB0aGUgVkEuCj4KPiBKYXNvbgoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmkt
ZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
L21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
