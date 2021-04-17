Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D6C8B362F67
	for <lists+dri-devel@lfdr.de>; Sat, 17 Apr 2021 12:59:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D3DF6E088;
	Sat, 17 Apr 2021 10:59:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2075.outbound.protection.outlook.com [40.107.220.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 832B36E088
 for <dri-devel@lists.freedesktop.org>; Sat, 17 Apr 2021 10:59:46 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UFuTTQ5dGrbvyB2jo0YALLCsJDmNp6wnHyazaBQ4LKFq5MX7XdMDBp3HxL84UL0EvDshsect8bzamjA7hWXRQg7W077LKOYNi4X1lyrMzd1f8gGgMhZSrVZNdmaU5GfKOvCNVbPnpxtfI62eLwjBWB0SnGvqfqlcHGyxyDxVehZpNoW7PRDpbaMQrDL54bKJGizB4AorJjr+x4sOiA/a85L4cf9r/zycNyANQoBA4I/vMU6cMK+KXZcyZlVsNbzoPjElBnX86NWMT7x0r2CDmZw4YBydD0DgfL6Bp0E/Pk3/rqrhoPgJ5OrUY2hBCYD65wZiCYj+3EADxJGKWaStOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FWiRsND0vKe/WAo3EALBXIxlfUpd3DaCFSoD4xiZ1N4=;
 b=Jo+OWQzNeq+vZWD0/9deLobCIu6LTSB2N0cywRyl4uVVicKjt6Gakp6ge7DZY98i/Dcw/95st9/5DB0ptPNVDGYKJxeaELM2JxT5mmZ9asQqR8/WHSVwZKyLilst3Dh+2dniNglF4CnDZe2yLk6QeLzIxZgh1dhs1fb1QYdjPu/WlptrrwdSS/tT5m4ozBjn/Hjg0gCiJjQ/1xhXvHC3+tBU50H4sL0slAC/PYkpmbv4Rx90byHuJkXQPZALKXYpVeKI6D7K8vKNCEQ6hkZ6d1lmQg17DCvpF0/lNTu0rPeK1HNf37g5lwey2btKnPZleUI/W26fwffkx9uf62Bv4g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FWiRsND0vKe/WAo3EALBXIxlfUpd3DaCFSoD4xiZ1N4=;
 b=PmmQZ34aXiR5SQ4VdFDtvFIGQ/7XHnu3guzZJYCGFkjgFffjOeH3mZ71UekezUDSGRMUkODzHi8Uc9HJQMI6xWXjzVAq71GW5+h/EMsHcvmNhdUQ20t+wcqvdca41rFRedJxliNzHgdwhO3rUy3P4+62YJC5qDleOIiqcj7rqVU=
Authentication-Results: infradead.org; dkim=none (message not signed)
 header.d=none;infradead.org; dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by MN2PR12MB4223.namprd12.prod.outlook.com (2603:10b6:208:1d3::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4042.16; Sat, 17 Apr
 2021 10:59:42 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::6d4d:4674:1cf6:8d34]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::6d4d:4674:1cf6:8d34%6]) with mapi id 15.20.4042.020; Sat, 17 Apr 2021
 10:59:41 +0000
Subject: Re: [PATCH v4] dma-buf: Add DmaBufTotal counter in meminfo
To: Peter Enderborg <peter.enderborg@sony.com>, linux-kernel@vger.kernel.org, 
 linux-fsdevel@vger.kernel.org, Sumit Semwal <sumit.semwal@linaro.org>,
 Alexey Dobriyan <adobriyan@gmail.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Muchun Song <songmuchun@bytedance.com>, Roman Gushchin <guro@fb.com>,
 Shakeel Butt <shakeelb@google.com>, Michal Hocko <mhocko@suse.com>,
 NeilBrown <neilb@suse.de>, Sami Tolvanen <samitolvanen@google.com>,
 Mike Rapoport <rppt@kernel.org>, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 Matthew Wilcox <willy@infradead.org>
References: <20210417104032.5521-1-peter.enderborg@sony.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <d983aef9-3dde-54cc-59a0-d9d42130b513@amd.com>
Date: Sat, 17 Apr 2021 12:59:34 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
In-Reply-To: <20210417104032.5521-1-peter.enderborg@sony.com>
Content-Language: en-US
X-Originating-IP: [2a02:908:1252:fb60:ab38:d4e:d9c0:1b68]
X-ClientProxiedBy: AM0PR03CA0015.eurprd03.prod.outlook.com
 (2603:10a6:208:14::28) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:ab38:d4e:d9c0:1b68]
 (2a02:908:1252:fb60:ab38:d4e:d9c0:1b68) by
 AM0PR03CA0015.eurprd03.prod.outlook.com (2603:10a6:208:14::28) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4042.16 via Frontend Transport; Sat, 17 Apr 2021 10:59:39 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 627eeb0b-4122-4c81-9df0-08d9018fe6af
X-MS-TrafficTypeDiagnostic: MN2PR12MB4223:
X-Microsoft-Antispam-PRVS: <MN2PR12MB4223FEB9E3E609A84B025E4B834B9@MN2PR12MB4223.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3631;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: HHL6mzCZvtb6A5pVl773rfJpc1iqGUe44v1Vp/HIdbcwEZZaXsx3PXgGiSD/3/bi+HkTdPuzrD97InCySFydoNJ83hej331z0fi8ARg192ma3WEkVWJMLFG5GKnBAzI35qCPyyGGZyl7MamLJyX+EtRCZQwW4RO83/cvRQeeAZV43APhQVVAjiHGfbzhZ6ALogOYZHni/yBj4nB9iRUEm8AjdBl/fpuFX0tQre1RGtVEZCSp7BZ3QY3ITXztxM191dr+wluwUq/CRrXoHxe9gcwc5jx2zybtHEaLFrdA+EK6iWSEsQWiSUMcf9J5+B6QN8wco8tskP4wAnj5zpKaD0sU9RdhiZlDy9/rX8VMqqLYrDIcxiOZs5Jkj3DmqPcLDEN47ZvpUza0KWywCevmgfB8sfGzBlamh9UKhQIaCfwiLe6fhxsM5vvpHVOEL61hSr8tRjzvDeMfuzTFZqiJ4voLsJV2naCFEdJF3Xa7Lr5nlYtrDA630lYrTyvQtkp/NneJyBUy6kuFPpobA0NLJOzCeQyulRY+x9jRaYfpEhoHnpQFVWNLEo/+E0NYtCjRTi+3dWh6Oc399v1AeCmGL64E25wxTOUv4FEMn2sUtZSaz2hfEQ/qzzDvp2hslsWhIikP/CIbEiVVcN0+j/k1vKf5UnYYqATEnyX0lNy3E8z4u61kSBaImfXjxw5UJ6OKmtjtGMfgdPcvGz8aqs/y9Q==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(376002)(366004)(39860400002)(136003)(396003)(2906002)(8676002)(478600001)(66946007)(66476007)(2616005)(36756003)(16526019)(186003)(66556008)(7416002)(6666004)(110136005)(5660300002)(83380400001)(8936002)(66574015)(316002)(86362001)(52116002)(38100700002)(921005)(31686004)(6486002)(31696002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?blpCUFN3RStQSXB5ZVppTERQWkpNSHVYeFV5b0dkV1FGS2NPRjFlb0w0dTlS?=
 =?utf-8?B?bGd2WHg2SEpKOTFnMUZhMjFBdkxwV3pFZ1I5WDZJZnVMbllqN21XS0ZsMzhn?=
 =?utf-8?B?YTN6eWYzRkhrMUh0eHgxRmRkL1Y2UVFhbkl4N2tFQXhmcUt1cFZkaXc0Y2tO?=
 =?utf-8?B?MUpDbkRMampxQnB5T2hLS0szYjgweTQyWlYwbm90ODBwb3Nsem1VTjRQcTBJ?=
 =?utf-8?B?eFU4bzNkYlk3QlRUZkg3eDNoOTREeXVZNnhYYUkyNHp5enZ4T3NQNjhCTXdr?=
 =?utf-8?B?VFZCc2k5b3pjRnFSVFF5NEU2Ykx4UlJ5Qzc5bWNYdWVTVUs2M1A3ak5CNHVI?=
 =?utf-8?B?QmJOTnpwbk15VjNjL3ZJeUZxbnM5SDc3UEF4Ty9nSlNCdEF0b3J1MC91VFdJ?=
 =?utf-8?B?cUo1RDRBSG5yRGJXZ0dCcGxRNCtYSDFoUFovQlRKVGd4T2h3UjM1bENFNGhi?=
 =?utf-8?B?Nk5aeE1nYVFROFJYWmR3dE10LzljeHdmZFFPdFJuTTZVcjNVTm1BYkt3RjNK?=
 =?utf-8?B?T0RMeUZIUW14eHFFMk5sZlBTTmNLSlBrRExjTG40SjE0aFdyYzlaVjZiYzAy?=
 =?utf-8?B?b1p2UWgxM0cySCt1QXVKVSt1ZXVHeEpPd3FyK29Yd01Ma2wxeFRWVHl1bUJW?=
 =?utf-8?B?cXBjVURDZ1dtRDdKR2JmbkM5RkdUN0tETytzaUFjeGhhYy8zUys1d3dBRGhH?=
 =?utf-8?B?U3JHdkw0TDVwRnFBK1RUQTV5c2lHYkt0TDVwUEd0eng1Vjl6VUNLNGJmV2Ns?=
 =?utf-8?B?RTNqTUt4c0FKM3FJQjNvT2dXMDE4SVVEb2dYUWNBbC9qVXREemFUR0ZHMGtC?=
 =?utf-8?B?eVlNVXlDZlpzdWZCbGt5RDl3NUtFUmJFQkNNYW13bC9TYVhKdnEydDFKREFF?=
 =?utf-8?B?WkxhK3U1UWtBekRkcDE4bkgyUjk1TUV6TmFZL3dvdE5HTEdTN1poMXc5cHlC?=
 =?utf-8?B?c0dKSnZZWU1hOEFyakpmV1ArVzdNdERoNFdNSTRyTW5KM25EZFZiSGJQTzVI?=
 =?utf-8?B?QlRheCthZ1ZScjROSS9GQlZ3NmVUa0MrUk5rays3UHkxaDJtQ2RsM1BmOFJm?=
 =?utf-8?B?cy9raG1xZ25zTjRJais4MCsrejN3TXhFWWlQbHBBTU5nSWU5ZDNsWXNWNmdP?=
 =?utf-8?B?WjhQRUlxdGJOV2RBTlFNZTdjT3JzYWQ1eTg3WU5FaE1MMGJXeGFvcXFIRU9q?=
 =?utf-8?B?dmlTZ3RGM25RVnJBZFBHU2JUc3IrRmJQQ2NRbXY0Ylo1TjQranRSdW1sNG41?=
 =?utf-8?B?cFJhMHhMcEcrcHZETWZYVTVsQll5SXBLSVlQRlZnSWJsV1JCcVZuNlpRaEJT?=
 =?utf-8?B?elV4dnJDUWJlZkprbCs3RkFyOHQxcUFwOXdsZEliUFBpdE5BSERmRFk5RjBh?=
 =?utf-8?B?bm5VNitabTloc0J3R1BnbndWcEc5RVYrR2ZIZHc3Q2tPTXBxTGtiNnE5SDYx?=
 =?utf-8?B?ZVUrYzlPVG8xWjhxL2FTczl0UmlJZmVJV25ES2pWWjZqNzZNdlZ3aDc2bDhF?=
 =?utf-8?B?VDBRbHRsL0QvRHNkQWZsbGU5VzI1U3htRHRJdlJLMHgrMEExN3hrMEh3cTFS?=
 =?utf-8?B?K2U3S2J3TFpHTTNodC9vN0lZQVJNeHRseWdTdXY5cDdPOFRWSHM5ZmM4dnBR?=
 =?utf-8?B?ZHFFVVFYWEkrbENRRDNORDd6a2hyRFVFSVkrY3JzOVkzZlpYZVNzTjYxVi9I?=
 =?utf-8?B?dXlmQ3ZMdmNyOG5ZZTdyaHB6Y1l5dkdNWk1kSXhsUnBKQUxpNTJoTEErWTMr?=
 =?utf-8?B?UXBScTlmUU92RDV2VGlRbXFJUklkZ3FvMmFsdkVCNDhjL2ZTaUQ3dC9nRG83?=
 =?utf-8?B?SkJsV3ZPMDFtWTNQdGEyNmhRdUFOYUl0cFZnM1VoaTlnNktzUnpkU0l3dHQ3?=
 =?utf-8?Q?uhQN+x98lBO40?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 627eeb0b-4122-4c81-9df0-08d9018fe6af
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Apr 2021 10:59:41.5603 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kL/SHxQZk9j7ARcHzajSMabRLKKRtas2FLc0H6Yp2121BH5h1cRqV7zYSLorBx8b
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4223
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QW0gMTcuMDQuMjEgdW0gMTI6NDAgc2NocmllYiBQZXRlciBFbmRlcmJvcmc6Cj4gVGhpcyBhZGRz
IGEgdG90YWwgdXNlZCBkbWEtYnVmIG1lbW9yeS4gRGV0YWlscwo+IGNhbiBiZSBmb3VuZCBpbiBk
ZWJ1Z2ZzLCBob3dldmVyIGl0IGlzIG5vdCBmb3IgZXZlcnlvbmUKPiBhbmQgbm90IGFsd2F5cyBh
dmFpbGFibGUuIGRtYS1idWYgYXJlIGluZGlyZWN0IGFsbG9jYXRlZCBieQo+IHVzZXJzcGFjZS4g
U28gd2l0aCB0aGlzIHZhbHVlIHdlIGNhbiBtb25pdG9yIGFuZCBkZXRlY3QKPiB1c2Vyc3BhY2Ug
YXBwbGljYXRpb25zIHRoYXQgaGF2ZSBwcm9ibGVtcy4KPgo+IFNpZ25lZC1vZmYtYnk6IFBldGVy
IEVuZGVyYm9yZyA8cGV0ZXIuZW5kZXJib3JnQHNvbnkuY29tPgoKUmV2aWV3ZWQtYnk6IENocmlz
dGlhbiBLw7ZuaWcgPGNocmlzdGlhbi5rb2VuaWdAYW1kLmNvbT4KCkhvdyBkbyB5b3Ugd2FudCB0
byB1cHN0cmVhbSB0aGlzPwoKPiAtLS0KPiAgIGRyaXZlcnMvZG1hLWJ1Zi9kbWEtYnVmLmMgfCAx
MyArKysrKysrKysrKysrCj4gICBmcy9wcm9jL21lbWluZm8uYyAgICAgICAgIHwgIDUgKysrKy0K
PiAgIGluY2x1ZGUvbGludXgvZG1hLWJ1Zi5oICAgfCAgMSArCj4gICAzIGZpbGVzIGNoYW5nZWQs
IDE4IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKPgo+IGRpZmYgLS1naXQgYS9kcml2ZXJz
L2RtYS1idWYvZG1hLWJ1Zi5jIGIvZHJpdmVycy9kbWEtYnVmL2RtYS1idWYuYwo+IGluZGV4IGYy
NjRiNzBjMzgzZS4uMTk3ZTVjNDVkZDI2IDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZG1hLWJ1Zi9k
bWEtYnVmLmMKPiArKysgYi9kcml2ZXJzL2RtYS1idWYvZG1hLWJ1Zi5jCj4gQEAgLTM3LDYgKzM3
LDcgQEAgc3RydWN0IGRtYV9idWZfbGlzdCB7Cj4gICB9Owo+ICAgCj4gICBzdGF0aWMgc3RydWN0
IGRtYV9idWZfbGlzdCBkYl9saXN0Owo+ICtzdGF0aWMgYXRvbWljX2xvbmdfdCBkbWFfYnVmX2ds
b2JhbF9hbGxvY2F0ZWQ7Cj4gICAKPiAgIHN0YXRpYyBjaGFyICpkbWFidWZmc19kbmFtZShzdHJ1
Y3QgZGVudHJ5ICpkZW50cnksIGNoYXIgKmJ1ZmZlciwgaW50IGJ1ZmxlbikKPiAgIHsKPiBAQCAt
NzksNiArODAsNyBAQCBzdGF0aWMgdm9pZCBkbWFfYnVmX3JlbGVhc2Uoc3RydWN0IGRlbnRyeSAq
ZGVudHJ5KQo+ICAgCWlmIChkbWFidWYtPnJlc3YgPT0gKHN0cnVjdCBkbWFfcmVzdiAqKSZkbWFi
dWZbMV0pCj4gICAJCWRtYV9yZXN2X2ZpbmkoZG1hYnVmLT5yZXN2KTsKPiAgIAo+ICsJYXRvbWlj
X2xvbmdfc3ViKGRtYWJ1Zi0+c2l6ZSwgJmRtYV9idWZfZ2xvYmFsX2FsbG9jYXRlZCk7Cj4gICAJ
bW9kdWxlX3B1dChkbWFidWYtPm93bmVyKTsKPiAgIAlrZnJlZShkbWFidWYtPm5hbWUpOwo+ICAg
CWtmcmVlKGRtYWJ1Zik7Cj4gQEAgLTU4Niw2ICs1ODgsNyBAQCBzdHJ1Y3QgZG1hX2J1ZiAqZG1h
X2J1Zl9leHBvcnQoY29uc3Qgc3RydWN0IGRtYV9idWZfZXhwb3J0X2luZm8gKmV4cF9pbmZvKQo+
ICAgCW11dGV4X2xvY2soJmRiX2xpc3QubG9jayk7Cj4gICAJbGlzdF9hZGQoJmRtYWJ1Zi0+bGlz
dF9ub2RlLCAmZGJfbGlzdC5oZWFkKTsKPiAgIAltdXRleF91bmxvY2soJmRiX2xpc3QubG9jayk7
Cj4gKwlhdG9taWNfbG9uZ19hZGQoZG1hYnVmLT5zaXplLCAmZG1hX2J1Zl9nbG9iYWxfYWxsb2Nh
dGVkKTsKPiAgIAo+ICAgCXJldHVybiBkbWFidWY7Cj4gICAKPiBAQCAtMTM0Niw2ICsxMzQ5LDE2
IEBAIHZvaWQgZG1hX2J1Zl92dW5tYXAoc3RydWN0IGRtYV9idWYgKmRtYWJ1Ziwgc3RydWN0IGRt
YV9idWZfbWFwICptYXApCj4gICB9Cj4gICBFWFBPUlRfU1lNQk9MX0dQTChkbWFfYnVmX3Z1bm1h
cCk7Cj4gICAKPiArLyoqCj4gKyAqIGRtYV9idWZfYWxsb2NhdGVkX3BhZ2VzIC0gUmV0dXJuIHRo
ZSB1c2VkIG5yIG9mIHBhZ2VzCj4gKyAqIGFsbG9jYXRlZCBmb3IgZG1hLWJ1Zgo+ICsgKi8KPiAr
bG9uZyBkbWFfYnVmX2FsbG9jYXRlZF9wYWdlcyh2b2lkKQo+ICt7Cj4gKwlyZXR1cm4gYXRvbWlj
X2xvbmdfcmVhZCgmZG1hX2J1Zl9nbG9iYWxfYWxsb2NhdGVkKSA+PiBQQUdFX1NISUZUOwo+ICt9
Cj4gK0VYUE9SVF9TWU1CT0xfR1BMKGRtYV9idWZfYWxsb2NhdGVkX3BhZ2VzKTsKPiArCj4gICAj
aWZkZWYgQ09ORklHX0RFQlVHX0ZTCj4gICBzdGF0aWMgaW50IGRtYV9idWZfZGVidWdfc2hvdyhz
dHJ1Y3Qgc2VxX2ZpbGUgKnMsIHZvaWQgKnVudXNlZCkKPiAgIHsKPiBkaWZmIC0tZ2l0IGEvZnMv
cHJvYy9tZW1pbmZvLmMgYi9mcy9wcm9jL21lbWluZm8uYwo+IGluZGV4IDZmYTc2MWM5Y2M3OC4u
Y2NjN2M0MGM4ZGI3IDEwMDY0NAo+IC0tLSBhL2ZzL3Byb2MvbWVtaW5mby5jCj4gKysrIGIvZnMv
cHJvYy9tZW1pbmZvLmMKPiBAQCAtMTYsNiArMTYsNyBAQAo+ICAgI2lmZGVmIENPTkZJR19DTUEK
PiAgICNpbmNsdWRlIDxsaW51eC9jbWEuaD4KPiAgICNlbmRpZgo+ICsjaW5jbHVkZSA8bGludXgv
ZG1hLWJ1Zi5oPgo+ICAgI2luY2x1ZGUgPGFzbS9wYWdlLmg+Cj4gICAjaW5jbHVkZSAiaW50ZXJu
YWwuaCIKPiAgIAo+IEBAIC0xNDUsNyArMTQ2LDkgQEAgc3RhdGljIGludCBtZW1pbmZvX3Byb2Nf
c2hvdyhzdHJ1Y3Qgc2VxX2ZpbGUgKm0sIHZvaWQgKnYpCj4gICAJc2hvd192YWxfa2IobSwgIkNt
YUZyZWU6ICAgICAgICAiLAo+ICAgCQkgICAgZ2xvYmFsX3pvbmVfcGFnZV9zdGF0ZShOUl9GUkVF
X0NNQV9QQUdFUykpOwo+ICAgI2VuZGlmCj4gLQo+ICsjaWZkZWYgQ09ORklHX0RNQV9TSEFSRURf
QlVGRkVSCj4gKwlzaG93X3ZhbF9rYihtLCAiRG1hQnVmVG90YWw6ICAgICIsIGRtYV9idWZfYWxs
b2NhdGVkX3BhZ2VzKCkpOwo+ICsjZW5kaWYKPiAgIAlodWdldGxiX3JlcG9ydF9tZW1pbmZvKG0p
Owo+ICAgCj4gICAJYXJjaF9yZXBvcnRfbWVtaW5mbyhtKTsKPiBkaWZmIC0tZ2l0IGEvaW5jbHVk
ZS9saW51eC9kbWEtYnVmLmggYi9pbmNsdWRlL2xpbnV4L2RtYS1idWYuaAo+IGluZGV4IGVmZGM1
NmI5ZDk1Zi4uNWIwNTgxNmJkMmNkIDEwMDY0NAo+IC0tLSBhL2luY2x1ZGUvbGludXgvZG1hLWJ1
Zi5oCj4gKysrIGIvaW5jbHVkZS9saW51eC9kbWEtYnVmLmgKPiBAQCAtNTA3LDQgKzUwNyw1IEBA
IGludCBkbWFfYnVmX21tYXAoc3RydWN0IGRtYV9idWYgKiwgc3RydWN0IHZtX2FyZWFfc3RydWN0
ICosCj4gICAJCSB1bnNpZ25lZCBsb25nKTsKPiAgIGludCBkbWFfYnVmX3ZtYXAoc3RydWN0IGRt
YV9idWYgKmRtYWJ1Ziwgc3RydWN0IGRtYV9idWZfbWFwICptYXApOwo+ICAgdm9pZCBkbWFfYnVm
X3Z1bm1hcChzdHJ1Y3QgZG1hX2J1ZiAqZG1hYnVmLCBzdHJ1Y3QgZG1hX2J1Zl9tYXAgKm1hcCk7
Cj4gK2xvbmcgZG1hX2J1Zl9hbGxvY2F0ZWRfcGFnZXModm9pZCk7Cj4gICAjZW5kaWYgLyogX19E
TUFfQlVGX0hfXyAqLwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Au
b3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRl
dmVsCg==
