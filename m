Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C63C32D8C8
	for <lists+dri-devel@lfdr.de>; Thu,  4 Mar 2021 18:42:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AEB2C6EA5E;
	Thu,  4 Mar 2021 17:42:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2047.outbound.protection.outlook.com [40.107.93.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 23A0D6EA56;
 Thu,  4 Mar 2021 17:42:29 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TWEH04FZtanj5ankI7cJFnIAQaVvfOyLV4tZKCokR/gol4AY+UYAVmEU/bJaJpOw8H7Atf2Dt1orN4K5RUb+CmhDP6SxUgv8G4a6UMcHQrmi1eKjS1CvrMh99lSQCenl6u5DuuLpln7o+Zr+i6sgwcbckpUYHWq1uQ1orAAi4pDY2FCqk5oyWNJn3LyHmaIxHOA6uV4U1v9Xruk2kYdEO6i4nXK1ZcTf6FdMlIGY2fuWV0vPLTvWAumGnRi/UsJhiDNwIuXgEzDAXksx7WdDHJepqflTxeqQXqUTrtr3iMsMokYEKBBc9AkSQVsMiOoXfZymYl2gUJ5wo4oHmSyxKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FuCTdFruX/hNTlCbVVQsTE2rH1DSKwjSxvhj/FRSsBg=;
 b=aTL9ads85KK3rh6thCCj7whs6kvXTRoi18hPDDTQWO4aEBUknzxRNjOk641OLDUmqyLr7bduoUCTO3uVAjho9Ytj8rU7BhwfTCk+1Udg78Dt39rDS8RHWzGUJUp9adwLFoy8jhyBEWop5Py/4IdobAZ7G9RdP8IF+q0vi0+l7R7rIsvo/wfcixVal3JNDSxGGeib9sfa+jOmPWGTGS9EEDzvmoljR1UP1mhbYRWjqa/DwzqyjTx/usf9VFNYVlEZ9Gy+SEoUzYgPthJkQsnIbOD52+S25y5p4PQT06wPznbhof0YDuKX6ec6x/YaO4KcH7jqDpm8nYEISHl5h5wK4w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FuCTdFruX/hNTlCbVVQsTE2rH1DSKwjSxvhj/FRSsBg=;
 b=jybahngfkdfRXniDCCsF29WN5y41MUAya422nxSKg87yMZfAALrwWlZKXfRfGdKEnLi4TrgNvy+zABPjwZaabMn+aLP2kSCZRIplTjfHawkCuYYsECwDf8V6zEPI89s4nS2x5LLAICz5Wu5K8BAtLcCz0dU6BOSr1WFtJtOrrcE=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by MN2PR12MB4358.namprd12.prod.outlook.com (2603:10b6:208:24f::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3912.19; Thu, 4 Mar
 2021 17:42:27 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::c1ff:dcf1:9536:a1f2]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::c1ff:dcf1:9536:a1f2%2]) with mapi id 15.20.3912.017; Thu, 4 Mar 2021
 17:42:27 +0000
Subject: Re: [patch 1/7] drm/ttm: Replace kmap_atomic() usage
To: Thomas Gleixner <tglx@linutronix.de>, LKML <linux-kernel@vger.kernel.org>
References: <20210303132023.077167457@linutronix.de>
 <20210303132711.340553449@linutronix.de>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <404173f2-62ff-7953-2ce1-20ac9fde2aed@amd.com>
Date: Thu, 4 Mar 2021 18:42:13 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
In-Reply-To: <20210303132711.340553449@linutronix.de>
Content-Language: en-US
X-Originating-IP: [2a02:908:1252:fb60:3d04:4b7c:635f:3a0]
X-ClientProxiedBy: AM0PR10CA0105.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:208:e6::22) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:3d04:4b7c:635f:3a0]
 (2a02:908:1252:fb60:3d04:4b7c:635f:3a0) by
 AM0PR10CA0105.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:208:e6::22) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3912.17 via Frontend Transport; Thu, 4 Mar 2021 17:42:24 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 0a810a88-a751-4f52-0bc2-08d8df34e03a
X-MS-TrafficTypeDiagnostic: MN2PR12MB4358:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MN2PR12MB435822A425E234BFB42E95AE83979@MN2PR12MB4358.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2089;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 4x105muguRyANhtP/sRsG2fwn9kbm/JsWUi3A4GbUZpeDVCJIdB5biplzk9vWGowG9EBE3uV+ZWM47dEHmF4UgebcbRBTVrsL6b/Iho5Fg6wbWNuRRYfU6PvCRMl7CItKjALPNWTQzkXPILIxs8X81EI6gcuXw0iez3RUYdNz5dPdHVWZWKKnD8YqjKoJlnxhx7rf3isIkMdt/q5Yo+oAw6YbrsZtqAD7HzTuYG0+/s24572i0nGX6DW6t+OM2KBWyaF5TflcoKbSa0fyK3LkMoC7C0zSH/gao1U2mregeocqTlptd36vCHDZlbCsJbKMqVdx9BFmj89pMsr/9iGp9LYr8/nR6vVZGvrwuo3Mxaz11r02heHPf0UvWZXQ+GK7C4U0qpNGqyVDCy+ARSGKA0uy9VZoiNKC9Iy3pxKAz20ZX01W9lP/6lyeMWD7Z1mibTbNwETnk/66CMV1ngiUdewSXWzuhDbKzRqHG4s/FntlhM2/Ej5eaLjF4a5CUdp/ZTise55y/UsXXnIIOgw3iehKJDoq1MxGc0Rzx2WTygmc6MUTQ+YX6BMzo4LZ+z/5vUkLSPOnFeLenGFz8X5+OiNWPrYrdjcFNVgd+YeaHI=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(376002)(346002)(136003)(39860400002)(366004)(66946007)(7416002)(66476007)(66556008)(16526019)(8676002)(2616005)(186003)(8936002)(83380400001)(6486002)(5660300002)(478600001)(31686004)(316002)(31696002)(36756003)(52116002)(86362001)(54906003)(110136005)(4326008)(6666004)(2906002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?RXRqRXVKMGFTaEEwQjFqUjA3T3FTSmVBaUFFTWwweUZDK1lQaTVFcStBcTZm?=
 =?utf-8?B?R3FzcndFNTF3TUhLQTNuZFZiSVpleDVrSHlZR0l0Rko4Mmd3K2hIb0VWVDZU?=
 =?utf-8?B?N0pDd3RmaVNDdHpiZFY3b25nQ01uYXNmUldoTm5TY2tjd1loeXcyZUZTSWto?=
 =?utf-8?B?MnliUDIyL05JOWpMNDJIMjJ0U08yTG8xU3hERlg3elNhVVhqVFRvd1FZaWVh?=
 =?utf-8?B?SFMybjJ4WllPZHhVL3prMStBbnRCaFgxWFk5dFZuUytsRFUxQUpYUEoxemph?=
 =?utf-8?B?T21lYUJBZXVjRWtjMkFIeTZvbDhJUmUvckV4MFQra0srWVgvUkNvSVAyUjRL?=
 =?utf-8?B?S0VBTUJIQXdzR0tuRXh6SlExektyZXhIOTBLUFdyK2pYNTRGaC9mdVl1R250?=
 =?utf-8?B?RXQ4SDNUODV5QUE3MlJiOGRqbGlZYXA4RWtzZGZZY3laRGNDMzBCR0VsaVZm?=
 =?utf-8?B?VHlmWVpmZVZpSnI3QU9qeU9EZ1M2M2V2T1cwS2w4TlpLb2VBalhuOC80S1Z3?=
 =?utf-8?B?RytLdEpScWU1bzYxcTlvNDZua2hYU2MxMmZZSjNnOGx0Qnp3UDFtaVRtWEhm?=
 =?utf-8?B?UU4xZU9XSjBud1lJOUlOSnZlalFQTDdCbmlidVAzN3FnajNDS2crZHVCOS9k?=
 =?utf-8?B?STBGVTdtY3RobFFXZW5MeWdseEw2YWNFT3BFRDFGR1NrSHE4VjhDQWxFeTRt?=
 =?utf-8?B?T0tVcGZXWTJMQ2YvTENEZ3NYeTJEYkpZOWtkVmpVRS8xbEllbzd6THdxbDF5?=
 =?utf-8?B?cDB0SWpyMnFtZWEvSVpUUnBmMXROUDFmNy9ZaW01T3B3WG5rMkVQZi9HSG9l?=
 =?utf-8?B?b1RmM3h3Z0V3cmNCNWllNXJaSUtSZG9hd0ZSc0w2dEN5YnFTR3dlMkJwWUUw?=
 =?utf-8?B?LzQ4SzJvNU10VTVlWWtadzFnZVlqTHhoWXh2akJyWFRNekp5MmNpcWZsUG1r?=
 =?utf-8?B?dVJNU3JIQTNoeDd0by9GQjkwSWlPdEkrSlkyTnhxUWxKYXRDUloxdHlHaThM?=
 =?utf-8?B?K2VxMnlqQWhqWi9JNldEWDAzSFhQaVF4em1tazNOUWNDMVEzTklkTnhiVlJn?=
 =?utf-8?B?RDhOb1dCOHZQOU1ZRG9USHNGSnh4azZRVXkxN2VENHBYSXJMSnBMRUxLMCtK?=
 =?utf-8?B?cjU0ek5TUEQ3WXFGQkM0bEd6cDhxV2dJNkIzazFHcnVtdDArcWV4L2xVc0Ri?=
 =?utf-8?B?Zzl2UGcwSXFlYXN1N3hVZERpUDh6Ujd2bm9wR01ONGVqSFJrRkZLLzJ3TDNH?=
 =?utf-8?B?N0ZIZEVRUUFJN0VMSG5HRkw3a24yK05ocmw4ZHpnZTRxVEdlN0NycEVSTm1S?=
 =?utf-8?B?ZGUvOGtCcEdmVWNJN0JRVnBzTmlGY0hhdUlDSlRyWExpNXM5cDlBd3FnTW4y?=
 =?utf-8?B?SkhZdW5KMkFHbkRLTnlpYTF6SlVOM3pKaXdndytUSjhIZnAwN3JaRVl5ZkNv?=
 =?utf-8?B?WmVRZ0NsS2J0NDkzVlkyaDg4RkFyOWFBUWU2N0pXYm4wWHczc1RpN1ZYRzdw?=
 =?utf-8?B?Q1pyU2tURDlJaHFKdW5ySzBabWtsZVA2VEVQTVczeVowVGlJWGtpUmN0cFMv?=
 =?utf-8?B?eDRCWU81Mk4rWFJESmI4TFBnaml4OEVkaXl5cmZDa29ZOFRiY2w4M2lZdkFJ?=
 =?utf-8?B?UTZOcW1HK1VUOGhKekI1Uk1uVFdaUkNRam5vNDVlRkNFdFJrdnVQZFpzVGEx?=
 =?utf-8?B?b3hNZk51TE5lVy91MVdKekxLRWR5cHlKMjV1R1VkWnE4UEcvbitZMGxVOFl3?=
 =?utf-8?B?Y1hCd2tSS1h6WE53cnM5Vkp6V2pmWFEvWWROeFc4Ums1L0JYUmdIWTdnZ3JU?=
 =?utf-8?B?STZxUW84WExEYkRkcitRTTZ2RHlxMWFrcnhKcG5pMUsrWm81ek5MNFlvUENr?=
 =?utf-8?Q?sr1ev8N8jOCfL?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0a810a88-a751-4f52-0bc2-08d8df34e03a
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Mar 2021 17:42:27.0896 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rGR8CC9O4Cu+fJtQ1v/lKcc6hV/F1RvbCHsnkkTORnQFLHiRsiIsRi6RMf8wx7BZ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4358
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
Cc: David Airlie <airlied@linux.ie>, nouveau@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, Roland Scheidegger <sroland@vmware.com>,
 dri-devel@lists.freedesktop.org, virtualization@lists.linux-foundation.org,
 linux-mm@kvack.org, Huang Rui <ray.huang@amd.com>,
 VMware Graphics <linux-graphics-maintainer@vmware.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 spice-devel@lists.freedesktop.org, Andrew Morton <akpm@linux-foundation.org>,
 Chris Wilson <chris@chris-wilson.co.uk>, Ben Skeggs <bskeggs@redhat.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

CgpBbSAwMy4wMy4yMSB1bSAxNDoyMCBzY2hyaWViIFRob21hcyBHbGVpeG5lcjoKPiBGcm9tOiBU
aG9tYXMgR2xlaXhuZXIgPHRnbHhAbGludXRyb25peC5kZT4KPgo+IFRoZXJlIGlzIG5vIHJlYXNv
biB0byBkaXNhYmxlIHBhZ2VmYXVsdHMgYW5kIHByZWVtcHRpb24gYXMgYSBzaWRlIGVmZmVjdCBv
Zgo+IGttYXBfYXRvbWljX3Byb3QoKS4KPgo+IFVzZSBrbWFwX2xvY2FsX3BhZ2VfcHJvdCgpIGlu
c3RlYWQgYW5kIGRvY3VtZW50IHRoZSByZWFzb25pbmcgZm9yIHRoZQo+IG1hcHBpbmcgdXNhZ2Ug
d2l0aCB0aGUgZ2l2ZW4gcGdwcm90Lgo+Cj4gUmVtb3ZlIHRoZSBOVUxMIHBvaW50ZXIgY2hlY2sg
Zm9yIHRoZSBtYXAuIFRoZXNlIGZ1bmN0aW9ucyByZXR1cm4gYSB2YWxpZAo+IGFkZHJlc3MgZm9y
IHZhbGlkIHBhZ2VzIGFuZCB0aGUgcmV0dXJuIHdhcyBib2d1cyBhbnl3YXkgYXMgaXQgd291bGQg
aGF2ZQo+IGxlZnQgcHJlZW1wdGlvbiBhbmQgcGFnZWZhdWx0cyBkaXNhYmxlZC4KPgo+IFNpZ25l
ZC1vZmYtYnk6IFRob21hcyBHbGVpeG5lciA8dGdseEBsaW51dHJvbml4LmRlPgo+IENjOiBDaHJp
c3RpYW4gS29lbmlnIDxjaHJpc3RpYW4ua29lbmlnQGFtZC5jb20+Cj4gQ2M6IEh1YW5nIFJ1aSA8
cmF5Lmh1YW5nQGFtZC5jb20+Cj4gQ2M6IERhdmlkIEFpcmxpZSA8YWlybGllZEBsaW51eC5pZT4K
PiBDYzogRGFuaWVsIFZldHRlciA8ZGFuaWVsQGZmd2xsLmNoPgo+IENjOiBkcmktZGV2ZWxAbGlz
dHMuZnJlZWRlc2t0b3Aub3JnCj4gLS0tCj4gICBkcml2ZXJzL2dwdS9kcm0vdHRtL3R0bV9ib191
dGlsLmMgfCAgIDIwICsrKysrKysrKysrKy0tLS0tLS0tCj4gICAxIGZpbGUgY2hhbmdlZCwgMTIg
aW5zZXJ0aW9ucygrKSwgOCBkZWxldGlvbnMoLSkKPgo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS90
dG0vdHRtX2JvX3V0aWwuYwo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS90dG0vdHRtX2JvX3V0aWwu
Ywo+IEBAIC0xODEsMTMgKzE4MSwxNSBAQCBzdGF0aWMgaW50IHR0bV9jb3B5X2lvX3R0bV9wYWdl
KHN0cnVjdCB0Cj4gICAJCXJldHVybiAtRU5PTUVNOwo+ICAgCj4gICAJc3JjID0gKHZvaWQgKiko
KHVuc2lnbmVkIGxvbmcpc3JjICsgKHBhZ2UgPDwgUEFHRV9TSElGVCkpOwo+IC0JZHN0ID0ga21h
cF9hdG9taWNfcHJvdChkLCBwcm90KTsKPiAtCWlmICghZHN0KQo+IC0JCXJldHVybiAtRU5PTUVN
Owo+ICsJLyoKPiArCSAqIEVuc3VyZSB0aGF0IGEgaGlnaG1lbSBwYWdlIGlzIG1hcHBlZCB3aXRo
IHRoZSBjb3JyZWN0Cj4gKwkgKiBwZ3Byb3QuIEZvciBub24gaGlnaG1lbSB0aGUgbWFwcGluZyBp
cyBhbHJlYWR5IHRoZXJlLgo+ICsJICovCgpJIGZpbmQgdGhlIGNvbW1lbnQgYSBiaXQgbWlzbGVh
ZGluZy4gTWF5YmUgd3JpdGU6CgovKgogwqAqIExvY2FsbHkgbWFwIGhpZ2htZW0gcGFnZXMgd2l0
aCB0aGUgY29ycmVjdCBwZ3Byb3QuCiDCoCogTm9ybWFsIG1lbW9yeSBzaG91bGQgYWxyZWFkeSBo
YXZlIHRoZSBjb3JyZWN0IHBncHJvdCBpbiB0aGUgbGluZWFyIAptYXBwaW5nLgogwqAqLwoKQXBh
cnQgZnJvbSB0aGF0IGxvb2tzIGdvb2QgdG8gbWUuCgpSZWdhcmRzLApDaHJpc3RpYW4uCgo+ICsJ
ZHN0ID0ga21hcF9sb2NhbF9wYWdlX3Byb3QoZCwgcHJvdCk7Cj4gICAKPiAgIAltZW1jcHlfZnJv
bWlvKGRzdCwgc3JjLCBQQUdFX1NJWkUpOwo+ICAgCj4gLQlrdW5tYXBfYXRvbWljKGRzdCk7Cj4g
KwlrdW5tYXBfbG9jYWwoZHN0KTsKPiAgIAo+ICAgCXJldHVybiAwOwo+ICAgfQo+IEBAIC0yMDMs
MTMgKzIwNSwxNSBAQCBzdGF0aWMgaW50IHR0bV9jb3B5X3R0bV9pb19wYWdlKHN0cnVjdCB0Cj4g
ICAJCXJldHVybiAtRU5PTUVNOwo+ICAgCj4gICAJZHN0ID0gKHZvaWQgKikoKHVuc2lnbmVkIGxv
bmcpZHN0ICsgKHBhZ2UgPDwgUEFHRV9TSElGVCkpOwo+IC0Jc3JjID0ga21hcF9hdG9taWNfcHJv
dChzLCBwcm90KTsKPiAtCWlmICghc3JjKQo+IC0JCXJldHVybiAtRU5PTUVNOwo+ICsJLyoKPiAr
CSAqIEVuc3VyZSB0aGF0IGEgaGlnaG1lbSBwYWdlIGlzIG1hcHBlZCB3aXRoIHRoZSBjb3JyZWN0
Cj4gKwkgKiBwZ3Byb3QuIEZvciBub24gaGlnaG1lbSB0aGUgbWFwcGluZyBpcyBhbHJlYWR5IHRo
ZXJlLgo+ICsJICovCj4gKwlzcmMgPSBrbWFwX2xvY2FsX3BhZ2VfcHJvdChzLCBwcm90KTsKPiAg
IAo+ICAgCW1lbWNweV90b2lvKGRzdCwgc3JjLCBQQUdFX1NJWkUpOwo+ICAgCj4gLQlrdW5tYXBf
YXRvbWljKHNyYyk7Cj4gKwlrdW5tYXBfbG9jYWwoc3JjKTsKPiAgIAo+ICAgCXJldHVybiAwOwo+
ICAgfQo+Cj4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpo
dHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
