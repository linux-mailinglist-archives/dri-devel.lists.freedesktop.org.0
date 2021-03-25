Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DB75349308
	for <lists+dri-devel@lfdr.de>; Thu, 25 Mar 2021 14:27:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1CD786ED42;
	Thu, 25 Mar 2021 13:26:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2049.outbound.protection.outlook.com [40.107.92.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F23A86ED42
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Mar 2021 13:26:57 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UdDp6kR6zTjkoObC0KT6H8NJFTKoEXBfUUn0OubxH05t0Iiov8BPFsBCAgloYHDKKB6QYarb4C6aTIYfkpdihLv6drsT7uT+Ojbq0RjdsNR6QF8I69uYRg3ly6p6VFmCeE2Y2NkZ4vFbxvKUJyE8f0pANdUNmlsrKT4hNjTZVpV2Qy3Bc7tVWaLlnl4WPzYKumpee6aYR0hM3lAyve413k+YDwuI9OJQLpZ70mfHkgN/99aN2QXgNCa1sbbcuK2FQxKtH/uD4iZ8Lrl1n18X/clbsyVOoGt+MP+QlVjfHCkXTbGyxg7Je27zo8Weiwd+pLIcNVKdMYOE8+6phLCdeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7UZTcIHiQ+LtA7iqpIKlKMGadbVPmq0VrJ61079kSzY=;
 b=UpUTPFT27uWQLK79r2xSUkPwpcDonmGI01CN17anficV0gSuSTv4+AYGrhJQ5QIT1uZUGkj4e5Yji1b/Estk2QMTGTQLArsNYu5QUcewz1PW1qZBg/98Zz4UaH/QwgXgeqiri22Y+F+Rcrt6DzG015qa6BQ15ydUCfEAsShhmcw0qQ59psQZAc11ZiTZVFJcfLuqrsv1rcQC7m8Q1Ja+Mo2N/u9WEoXj3E5wUIqSjGQ0RDngNBpDcBDIMuYdqsb7lVC3vwCn+LPaDjcAKglszeJAmDf5oHIAZ25MBvXbVSf+U11Y0EpZQT71mnhvNiwFuI/80oYg/gvpPa+xdfDRBA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7UZTcIHiQ+LtA7iqpIKlKMGadbVPmq0VrJ61079kSzY=;
 b=xu7OfRZAfE08hS1S/mu22aUCeGQbJDLKfJR95PQGGTgnv3pY+14bbxPvma9niV85IPqqEsR4bVM1/usatcDZijVRD7FS5Ll6yqIMyLUioIBFJlKw6dYJyU8XNOCMKvgnZ3QayMNHxr/T9llXC88CDgH9hpBZgwjIEKEdy8m9wXA=
Authentication-Results: linux-foundation.org; dkim=none (message not signed)
 header.d=none;linux-foundation.org; dmarc=none action=none
 header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by BL0PR12MB4930.namprd12.prod.outlook.com (2603:10b6:208:1c8::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3977.26; Thu, 25 Mar
 2021 13:26:55 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::c1ff:dcf1:9536:a1f2]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::c1ff:dcf1:9536:a1f2%2]) with mapi id 15.20.3977.029; Thu, 25 Mar 2021
 13:26:55 +0000
Subject: Re: [RFC PATCH 1/2] mm,drm/ttm: Block fast GUP to TTM huge pages
To: Jason Gunthorpe <jgg@nvidia.com>
References: <20210324231419.GR2356281@nvidia.com>
 <607ecbeb-e8a5-66e9-6fe2-9a8d22f12bc2@shipmail.org>
 <fb74efd9-55be-9a8d-95b0-6103e263aab8@amd.com>
 <15da5784-96ca-25e5-1485-3ce387ee6695@shipmail.org>
 <20210325113023.GT2356281@nvidia.com>
 <afad3159-9aa8-e052-3bef-d00dee1ba51e@shipmail.org>
 <20210325120103.GV2356281@nvidia.com>
 <a0d0ffd7-3c34-5002-f4fe-cb9d4ba0279e@amd.com>
 <20210325124206.GA599656@nvidia.com>
 <00f79bae-75c4-d694-8dc9-35ac21cd1006@amd.com>
 <20210325131756.GX2356281@nvidia.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <13227fd0-6c41-992e-63e7-877f718c1577@amd.com>
Date: Thu, 25 Mar 2021 14:26:50 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
In-Reply-To: <20210325131756.GX2356281@nvidia.com>
Content-Language: en-US
X-Originating-IP: [2a02:908:1252:fb60:72d1:2a48:a80e:e149]
X-ClientProxiedBy: AM4PR0701CA0015.eurprd07.prod.outlook.com
 (2603:10a6:200:42::25) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:72d1:2a48:a80e:e149]
 (2a02:908:1252:fb60:72d1:2a48:a80e:e149) by
 AM4PR0701CA0015.eurprd07.prod.outlook.com (2603:10a6:200:42::25) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3999.16 via Frontend
 Transport; Thu, 25 Mar 2021 13:26:54 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: cc12e295-250b-4592-5396-08d8ef91a8a9
X-MS-TrafficTypeDiagnostic: BL0PR12MB4930:
X-Microsoft-Antispam-PRVS: <BL0PR12MB493010CF9E30901B2BC404DA83629@BL0PR12MB4930.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: cFzZVoFl6SHXnekXFTuY9L/1PMHvj8PbKZAk9Tsh03JbnrYIKNlikpjI887JnhlrlrHT+ddMMcN66pcCWgnjECIyG1YNiC548k2Soq0o3Ln+JCQDjtr80pJS1VSbFqfY9NlSvsatZDTI/AHfKOD3LMPrJVPRpPIwvK1MLMkXzoiDmeY07QBYR30P1MOegRxwQOC8T0bHhe3YgZVmVBsdnt8gGredgaVe1lkN9ydoNEMRcanAmsC358D/OJUCUJA8U8ydbfs/ruiPNgSxqEF8bXRq5fc7iBtSrTYc+AqCyDdQ678THeqFHoCoX3mD9ujGxgvqkEB+mnIj+7/2Ev2JjiiJAXnREFg0cjfGbuBvFcqIDlEFFtK8gIBWOfFwo8WdCLhzHKVgceVyX3V/7Fu8zJ4eE9DnTB+cB2f+z/XJsPj7VusuxVmSARHNY+Nvt8oC73luE5eVVmJgk5PPu3NKwSWXB3cHVzvKmQAunT06Fb4wTJTTzpMdqkgyRMrGXyyfB/wZgv3G/3OVwdY/OF5mOyVT2RrfhDjgGCojWDEs6Shb/dX3+Sd6P/22B4A4dPGsQsplv5f/KNqsohTcRcRGJw+8nkaWh3sZb0qccmnO+KEJzPnN+zpkNYCb5OUvMZRL2ZXoDAO2Vvz5Ks92u3gn1vn8e2aPuJFNNH4GTZYinEiLs5Pa06sqVVDjHzcsbssUKKNHfnTSKhNvtd6ZfdDONxWIBjZ8xjn735fuEMIqrTVATEdrP9u6B6qL4cSn4ygM
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39860400002)(136003)(396003)(366004)(346002)(376002)(4326008)(8936002)(31686004)(16526019)(86362001)(316002)(186003)(38100700001)(52116002)(5660300002)(54906003)(6486002)(478600001)(66476007)(66556008)(6916009)(6666004)(8676002)(66946007)(36756003)(31696002)(2616005)(2906002)(14583001)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?OWRsTm42WE5ZUnAvdDR4b3luQjN3ay91clh5SXFPK0pJbEkyZFkwK2pRQUM0?=
 =?utf-8?B?d3d1eDl4V2ttUFdIK3lDQ1Z3cGNCWEcvQ1YzVHNXNEJVS0MrekFKSFJsbHlZ?=
 =?utf-8?B?VHdRK0ZNR20yN3dCOHFzRGZ1TkJKOFhaK25CSDcvWEhiNjR3N2tadk8zaWYy?=
 =?utf-8?B?MEZYYjNJUWVUYUkvSm81elIwQjNjYkozMGxZRE1OWlVVSFdlVC9DcWtBTE9k?=
 =?utf-8?B?emlnNjFRVEFCRW91emR1TW1NZ3liTHgyaDVNMngzUjVWQUJWdjNRTFkweUgv?=
 =?utf-8?B?Q2ZBKzF5WnkxdzVaM0Y3YWRmczFTaDRDSmJMUWpGVXpEMElIQ2FWeGNUa0E3?=
 =?utf-8?B?OFJOU09nSTFrSC9GTUV3clRjUkQ0Q0dnV2ZPbzIvVG1EMFo3bm5mOFFPZEYr?=
 =?utf-8?B?cHBTRStMUkRONm1ISXpGY0VuczNNOXcvb0p3K2w3K3lzbkt2WVJHK1FlcW03?=
 =?utf-8?B?YU1EaWROSVgvZzRmWEhhUVRRR3laSnNGUjJHZ3hIZGF5dEJRQnBhZ1IwbkJ3?=
 =?utf-8?B?cTY3T3AwdDgrUjY3M3gzcmFOd3Bzc2tud0xaZ3M5VWNDQ01JM3p2a0J0L1I4?=
 =?utf-8?B?WFFVT3NhOUdRVzY5czFmejZaTnhyNzlkaHJITUhFdzc1L2dFNE80NlN2ZHA2?=
 =?utf-8?B?ejcvcTBwVjYxY1JHbHJ3YzZkS0dOYW9FU2RlUXltc0xQTTZoaEZ1SlR1WkJL?=
 =?utf-8?B?b1ZUdUNhSHoxYlo2MHdSVVpIOTVCT0lFWERDMGtoWUFKeHBTN0pyaVBucHFP?=
 =?utf-8?B?SUd4RFJOSkM1UFcvOCtFdUFYN2MyTTBSU0tsSzNZb3g4WXhCQ2JYek95UWFO?=
 =?utf-8?B?T0lxQkYyZ3B5Rm9OZ3hFVXVaREFyeFBUYUkrbXVuWVpxTGwvMTJ5QUlaZmpX?=
 =?utf-8?B?MDM4UnBQcWFaTGlmNDA1WUp6Q2czZC9SMGEvWUFUWm5KZSt4R1ZIZ0FJVGN5?=
 =?utf-8?B?S1pEc2lZYkZTSEY5OHpjUDR2QXQyRlJrM3ZsZjZ4dk5UaWE0dStJNmlqYkwz?=
 =?utf-8?B?aWdxdk94RVhiODdHYVNFT2M1dG5pYTAvSjk5NmQ2MlVkTXRLTVlYdTJXdHM4?=
 =?utf-8?B?TWJTV0NJZCtFQndIN0RpWEl4alhDNUlUNXZJUTUvYWVLeFZ1OFBoUGw3OXdn?=
 =?utf-8?B?UDRJcU9WWEt2akN3YW5QTWRHM2tvQWZCbjU0YUJvVm9vampMQ0JhTVFZTTNM?=
 =?utf-8?B?RGVRblEzby9yYnJid0ExRnJPS2s0cGxPUW9xdE9JaldPSVZNSmMxcWZ0NWVw?=
 =?utf-8?B?UElBdWEvTVFZMHVoY05UOVNVZVRtOGZxL2pDd3VaYzYvalVwZUhqMzFEZDZr?=
 =?utf-8?B?SVJCamN3UjNuV2YwU2N4OG02L0tHYkNEQUZNM2N3clk5TjkwOUVzQm1hU09k?=
 =?utf-8?B?Y2R0SU41a00wS0NOcVpQN2tSZUJORzVpQlJUc1JtcVdrbGYwdzBGUXAxWDdG?=
 =?utf-8?B?SWl3TmRneFd6SkR2U3BYREYzSXJXdWMrRWkvL0luQUJIbTd6bWFGZHdkNGhI?=
 =?utf-8?B?d1phZVNIK1ZJY0orWFBXS3BhSUxzY3o4ZVF2czMvcjBWbk4razh2VTlQSnVX?=
 =?utf-8?B?bU9kOVVxVlJrMXNVTzNrOUZCYmh6TStXY3NVb2JPUkxaMFExeGlOMkdnejJK?=
 =?utf-8?B?M2dxbnB0SDVSODl6SDk4RzgzK0hacjlMRlJaZk91ak8vYXMwTXpyL3NUUFZ0?=
 =?utf-8?B?UVFjRitPMXJrUGNmcEhBSmhvZGExNWtFRVozWjI1ei9VckVHODh6L1FBSWZu?=
 =?utf-8?B?Qk1OMHJySjUzZFVLaHpEeGx5WlN0ZHdxV1NuSzZvdVpZVSt1TTR2alpuQjl6?=
 =?utf-8?B?RTE4YUwzVmV6cWR5aVU1RDJ3ZkhoZDc3Yk82MU1vbjJ6YU4xYWdpVlhHMUM5?=
 =?utf-8?Q?0NDo8xeh8pk92?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cc12e295-250b-4592-5396-08d8ef91a8a9
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Mar 2021 13:26:55.5258 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HO9aF+CrPl+RBQ7FzXRL47LLeaU3KSSU3U4S9nAy5UT1Q6t2Wx1D+e+oXt6MsHg9
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR12MB4930
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

QW0gMjUuMDMuMjEgdW0gMTQ6MTcgc2NocmllYiBKYXNvbiBHdW50aG9ycGU6Cj4gT24gVGh1LCBN
YXIgMjUsIDIwMjEgYXQgMDI6MDU6MTRQTSArMDEwMCwgQ2hyaXN0aWFuIEvDtm5pZyB3cm90ZToK
Pj4KPj4gQW0gMjUuMDMuMjEgdW0gMTM6NDIgc2NocmllYiBKYXNvbiBHdW50aG9ycGU6Cj4+PiBP
biBUaHUsIE1hciAyNSwgMjAyMSBhdCAwMTowOToxNFBNICswMTAwLCBDaHJpc3RpYW4gS8O2bmln
IHdyb3RlOgo+Pj4+IEFtIDI1LjAzLjIxIHVtIDEzOjAxIHNjaHJpZWIgSmFzb24gR3VudGhvcnBl
Ogo+Pj4+PiBPbiBUaHUsIE1hciAyNSwgMjAyMSBhdCAxMjo1MzoxNVBNICswMTAwLCBUaG9tYXMg
SGVsbHN0csO2bSAoSW50ZWwpIHdyb3RlOgo+Pj4+Pgo+Pj4+Pj4gTm9wZS4gVGhlIHBvaW50IGhl
cmUgd2FzIHRoYXQgaW4gdGhpcyBjYXNlLCB0byBtYWtlIHN1cmUgbW1hcCB1c2VzIHRoZQo+Pj4+
Pj4gY29ycmVjdCBWQSB0byBnaXZlIHVzIGEgcmVhc29uYWJsZSBjaGFuY2Ugb2YgYWxpZ25lbWVu
dCwgdGhlIGRyaXZlciBtaWdodAo+Pj4+Pj4gbmVlZCB0byBiZSBhd2FyZSBvZiBhbmQgZG8gdHJp
Y2tlcnkgd2l0aCB0aGUgaHVnZSBwYWdlLXRhYmxlLWVudHJ5IHNpemVzCj4+Pj4+PiBhbnl3YXks
IGFsdGhvdWdoIEkgdGhpbmsgaW4gbW9zdCBjYXNlcyBhIHN0YW5kYXJkIGhlbHBlciBmb3IgdGhp
cyBjYW4gYmUKPj4+Pj4+IHN1cHBsaWVkLgo+Pj4+PiBPZiBjb3Vyc2UgdGhlIGRyaXZlciBuZWVk
cyBzb21lIHdheSB0byBpbmZsdWVuY2UgdGhlIFZBIG1tYXAgdXNlcywKPj4+Pj4gZ2VybmFsbHkg
aXQgc2hvdWxkIGFsaWduIHRvIHRoZSBuYXR1cmFsIHBhZ2Ugc2l6ZSBvZiB0aGUgZGV2aWNlCj4+
Pj4gV2VsbCBhIG1tYXAoKSBuZWVkcyB0byBiZSBhbGlnbmVkIHRvIHRoZSBwYWdlIHNpemUgb2Yg
dGhlIENQVSwgYnV0IG5vdAo+Pj4+IG5lY2Vzc2FyaWx5IHRvIHRoZSBvbmUgb2YgdGhlIGRldmlj
ZS4KPj4+Pgo+Pj4+IFNvIEknbSBwcmV0dHkgc3VyZSB0aGUgZGV2aWNlIGRyaXZlciBzaG91bGQg
bm90IGJlIGludm9sdmVkIGluIGFueSB3YXkgdGhlCj4+Pj4gY2hvb3Npbmcgb2YgdGhlIFZBIGZv
ciB0aGUgQ1BVIG1hcHBpbmcuCj4+PiBObywgaWYgdGhlIGRldmljZSB3YW50cyB0byB1c2UgaHVn
ZSBwYWdlcyBpdCBtdXN0IGluZmx1ZW5jZSB0aGUgbW1hcAo+Pj4gVkEgb3IgaXQgY2FuJ3QgZm9y
bSBodWdlIHBnYWVzLgo+PiBObywgdGhhdCdzIHRoZSBqb2Igb2YgdGhlIGNvcmUgTU0gYW5kIG5v
dCBvZiB0aGUgaW5kaXZpZHVhbCBkcml2ZXIuCj4gVGhlIGNvcmUgbW0gZG9lc24ndCBrbm93IHRo
ZSBwYWdlIHNpemUgb2YgdGhlIGRldmljZSwgb25seSB3aGljaCBvZgo+IHNldmVyYWwgcGFnZSBs
ZXZlbHMgdGhlIGFyY2ggc3VwcG9ydHMuIFRoZSBkZXZpY2UgbXVzdCBiZSBpbnZvbGV2ZAo+IGhl
cmUuCgpXaHk/IFNlZSB5b3UgY2FuIGhhdmUgYSBkZXZpY2Ugd2hpY2ggaGFzIGZvciBleGFtcGxl
IDI1NktpQiBwYWdlcywgYnV0IAppdCBzaG91bGQgcGVyZmVjdGx5IHdvcmsgdGhhdCB0aGUgQ1BV
IG1hcHBpbmcgaXMgYWxpZ25lZCB0byBvbmx5IDRLaUIuCgpBcyBsb25nIGFzIHlvdSBkb24ndCBk
byB0aGluZ3MgbGlrZSBzaGFyZWQgdmlydHVhbCBtZW1vcnkgYmV0d2VlbiBkZXZpY2UgCmFuZCBD
UFUgdGhlIFZBIGFkZHJlc3NlcyB1c2VkIG9uIHRoZSBDUFUgc2hvdWxkIGJlIGNvbXBsZXRlbHkg
aXJyZWxldmFudCAKZm9yIHRoZSBkZXZpY2UuCgpSZWdhcmRzLApDaHJpc3RpYW4uCgo+Cj4gSmFz
b24KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1k
ZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczov
L2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
