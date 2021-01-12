Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 30CEE2F2D55
	for <lists+dri-devel@lfdr.de>; Tue, 12 Jan 2021 12:01:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E52546E1BD;
	Tue, 12 Jan 2021 11:01:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2056.outbound.protection.outlook.com [40.107.94.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8712A6E1BD;
 Tue, 12 Jan 2021 11:01:44 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mkOEgFurejsNIpDfhs75fVYd+otdaxzcM0BT12vx5e80ioLle8oDQp2KtNE56dTEzKryvIL5CxRa2XbMUXAgmXdHEzhJ3ZYNCtrjhg80ywiYm9lBMlNhZhoYUa/5f0CLo0EhFLmA6mlDecvBzswoyKAZT7VqkHmNr6WqW9S3U3bmsRh0l5wusGruEi3AcsLYoULLE90noGsvpdsK6XygQfNs6Wz+rpBpInDWd8M9Bf8M+4NvBLGsCYxwCwg/j7fdhFF3Q+PG0nG1dBb3tfe0iyHgQs1TV2yz7ppa2DBymBK8t6UMPWkxWFgtOms2dtClrCGGugYAiGBnCuqKWF/X8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FCgRYxymNlcL3cQ5sNPhy2nWhoBGvU38LLobp8a/M7E=;
 b=OTiJGU/FebTSECnk7CDMWOrY+9QDQd0DHeW/zVt30ngDZfz5pseJmbEO9VOWGlO/TzBnsBC25gAAFikq0w3zm2Z5xdoBxb1dye8xacJvs4hfMwXXwInYsNhzQpD7V/g5krBeVycX/IyHTesWCoVK8GeC/EC9D9WkLP21Ee8IbPn2BIveNzS/HkXC0BNOKaEPp2LkAph5Xmv0AHINdUQ+Lo8fnFfJ89kSmvNEMIVsac8wiTQiH7cFK85/oHRGcioYsTb3gUbpymVDH0Gu6NWvArnCQtwl2d59tIgOO9Ze6tvD/LcuJcoiXZLRchO7OZTqb550FEqkxjAZfuI7XbMsbw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FCgRYxymNlcL3cQ5sNPhy2nWhoBGvU38LLobp8a/M7E=;
 b=Ny0t2nsztwbu3fyFlO0MEmkDWOrwEgGTxatxh9Cy/CR+zW16dZe4oJzIRZhyIwMYdT2KaX2D+3SqU0KGd9O9N5I+bZIb/y95zDbMkV5Nro8WzdaYkfuTG28YKdl/ssLDt8Z1ut57YZ5gyjeLuvcxIt5FxHYRgFUwE6Kwg3VoDEE=
Authentication-Results: raptorengineering.com; dkim=none (message not signed)
 header.d=none; raptorengineering.com;
 dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by MN2PR12MB3725.namprd12.prod.outlook.com (2603:10b6:208:162::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3742.12; Tue, 12 Jan
 2021 11:01:42 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::44f:9f01:ece7:f0e5]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::44f:9f01:ece7:f0e5%3]) with mapi id 15.20.3742.012; Tue, 12 Jan 2021
 11:01:42 +0000
Subject: Re: [PATCH] amdgpu: Avoid sleeping during FPU critical sections
To: Jeremy Cline <jcline@redhat.com>
References: <20210108215838.470637-1-jcline@redhat.com>
 <3c94f9d6-501d-271c-ca83-1cf4229cb3ab@amd.com> <20210111153917.GA22594@xps13>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <817d44ea-0f1e-b13a-86d4-3da6a47752bd@amd.com>
Date: Tue, 12 Jan 2021 12:01:35 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <20210111153917.GA22594@xps13>
Content-Language: en-US
X-Originating-IP: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
X-ClientProxiedBy: AM4PR0302CA0012.eurprd03.prod.outlook.com
 (2603:10a6:205:2::25) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
 (2a02:908:1252:fb60:be8a:bd56:1f94:86e7) by
 AM4PR0302CA0012.eurprd03.prod.outlook.com (2603:10a6:205:2::25) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3763.9 via Frontend
 Transport; Tue, 12 Jan 2021 11:01:40 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 13c5860f-314b-4345-acc6-08d8b6e97183
X-MS-TrafficTypeDiagnostic: MN2PR12MB3725:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MN2PR12MB3725FA66BE65AAD59E7E087D83AA0@MN2PR12MB3725.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: i55sH9jy8wWqN09SEYYzE5SL+NE0e0kyjH06IrQ1fP7y+PYEZmEMZQNZIUddExqsDYSbupexDbCMNeKJPBoeuHLjGTmOF06z0f5/HNhk+pycnE4AOD399mdAZDKtmSa0qvOXuV9P5drBMSCsoPp7UmXRzeP9+rp6N2NwMNu/oKGjCoojs9gAgWnnt2UCh0D6m1sZ4hd0896rpeEL+37RVQEo256Ro6zRxlKKt0VS47fzheuXZhcT6Kg2Pi0jB+39Fwf95kWkV3VvweE/KHv6eBXC4YMqBVa5kV4yTRQ5poobIFGj4qVzP6gjQoWI3jG/GPvVS1FXAjdTcA3d0Nog1ImAXafzuagRzcXXcTeWAqd5b/xb3wj2+HkA+FitQw2Sqke+F996nRb4vESrm6SjoKPMF2EtRAzAI2X9TqRurmiyPyKyLqk8X4hnTk5rAQViPXnUFDBEMPxxiQ+SxVckSmSU7LZYuyQ8I8dwNle28Eg=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(376002)(346002)(396003)(39860400002)(366004)(478600001)(8676002)(2906002)(316002)(83380400001)(31696002)(66476007)(54906003)(36756003)(31686004)(52116002)(6666004)(4326008)(186003)(6916009)(6486002)(2616005)(86362001)(66946007)(8936002)(66556008)(16526019)(5660300002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?TEtqeWt3QkQrc05aejRwVGVJdWh4emhVSExwellSQjlYSmtZVENxS2lBUFNu?=
 =?utf-8?B?dzV6RC9INUJZVU1tb0lyS3EyTUppbkVSQUc4bFZ3c3lNZW04VDdjOFhKTWRE?=
 =?utf-8?B?bUhKT0M2SHkrS0s1Zy9Sb3BtNmY4Z2NNVHN2V3BuaTJ3SlgzNmU4TUpOTWl4?=
 =?utf-8?B?bSt1cUhJNDgvWm9wMVdwNmxRYVNOWklSUUsyWldweWNPUk42bVh0R0hqa1dR?=
 =?utf-8?B?MXI4QVAxSzlyeEhjSkV1VGxmMWo2anp3aGhmMzBNU0E3RHNYSHFBME5neVpy?=
 =?utf-8?B?cjAxdGdsZVl6NjJlNHlTQVIzSzFpcXA0UXl4dUpZUmFpeHhSekFGejdjK1or?=
 =?utf-8?B?alVMUHNjRXJBRHQyeWcxQzZFeDV1bDFPOThXSkZmT2xpRWRSTWhTdTFyci8w?=
 =?utf-8?B?SEVMZUE5aW9pUFB2UTFYWTZQeFg4bHRUdktXV3dVOGR4aEF4dDB1eURYanIx?=
 =?utf-8?B?UU12UTkxRVcrWmlLRnNUd1AxMkg4Wmg1NkdZZlh1dDJtcFU4Q29FR1NSM0ow?=
 =?utf-8?B?Z1ZSZVVqbFBaWmhPYlFxaU1HalptN1k1M0M2aUZjMkw3bUVRUXVhQ1VBUkJ1?=
 =?utf-8?B?N3crUVhVaTlRdHlmZnpmUjlGTnhOaVFNVzVlUXdTZnRRWUJoWUxLeVR1QWs4?=
 =?utf-8?B?TGtIQWVEdDdIK2p1ZDZCVUFicjRzOTJ4NXRoYW54c0xtcHBtWEpiMUdJZysx?=
 =?utf-8?B?a1ZtTzJjeEZ2NnNDdUMwNFVCWjlVSzRjZXZIREhpcFlnbGJybmRoWDUydGlm?=
 =?utf-8?B?SUxFSDFBZHJla3VOVHFZNzZJaWpJSVZzU0hwT04zK0Q1MnAza1Y0b080d0JG?=
 =?utf-8?B?WHdrTkZEaXQ1YllEYWZKeDliMmRkajZvMmp5blh0dTdlMFV0QU8wbXR0OUxq?=
 =?utf-8?B?WUNnUnNwYUl4VVdLQ21EL1dEMElKYU94cFR6WFZtZW5rb1c4bVppRVozVkQy?=
 =?utf-8?B?blZHM3p1d1FnK3FybzNCclJxbHdyQXhBVWdRZ0d3aGlIaUFORFZ6ZjRzWXky?=
 =?utf-8?B?ZWFtS0NuakZoWHpCVVZPb01obCtjQkc1TGxoNVVwUnV0MytjcVN3ZGZhTzA2?=
 =?utf-8?B?QmxiQkFWbVlkZm42T0NvOWExTnFMK0dPcTVLcjRqdmdLMzBlL2RuSmEzdUF0?=
 =?utf-8?B?K1EyTWtnek9rK29sbXBreU0zemF4SHYyMzBVODB5TEJDOHBwR3pWb2FGWFNX?=
 =?utf-8?B?YVhoUGhmMDQrZFhGeVlla3JwcmpjY3BWaFBzUm5zSE1nM3U4bDNFM3p0OENS?=
 =?utf-8?B?Wkgza2VTYVJqZ21BU1NyVmIyTE5mckNxb2krcWZzVmkxOFNkbWNEbHU3M2w0?=
 =?utf-8?B?VzhiRDB0cDZ2bTJaVmp2QWV5aFBMK1A3YjQxbG5LNDRYZHFQUk5WdEpXTSt3?=
 =?utf-8?B?cmd6aWtwdWpzRFRCRDhRTDNkTjNrTnlxaWdVdzUwZEFaN2s0RVViT0pPMUFm?=
 =?utf-8?Q?yA7/q/ku?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jan 2021 11:01:41.9586 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-Network-Message-Id: 13c5860f-314b-4345-acc6-08d8b6e97183
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: F0pBfPJFSKkyy0gbbfrNzGHQ4u7nwPAcwKFwi+ZIoK/83gvyKHBJ4N2Wjg+wIYwc
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3725
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
Cc: Leo Li <sunpeng.li@amd.com>, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
 Timothy Pearson <tpearson@raptorengineering.com>,
 dri-devel@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QW0gMTEuMDEuMjEgdW0gMTY6Mzkgc2NocmllYiBKZXJlbXkgQ2xpbmU6Cj4gSGksCj4KPiBPbiBN
b24sIEphbiAxMSwgMjAyMSBhdCAwOTo1Mzo1NkFNICswMTAwLCBDaHJpc3RpYW4gS8O2bmlnIHdy
b3RlOgo+PiBBbSAwOC4wMS4yMSB1bSAyMjo1OCBzY2hyaWViIEplcmVteSBDbGluZToKPj4+IGRj
bjIwX3Jlc291cmNlX2NvbnN0cnVjdCgpIGluY2x1ZGVzIGEgbnVtYmVyIG9mIGt6YWxsb2MoR0ZQ
X0tFUk5FTCkKPj4+IGNhbGxzIHdoaWNoIGNhbiBzbGVlcCwgYnV0IGtlcm5lbF9mcHVfYmVnaW4o
KSBkaXNhYmxlcyBwcmVlbXB0aW9uIGFuZAo+Pj4gc2xlZXBpbmcgaW4gdGhpcyBjb250ZXh0IGlz
IGludmFsaWQuCj4+Pgo+Pj4gVGhlIG9ubHkgcGxhY2VzIHRoZSBGUFUgYXBwZWFycyB0byBiZSBy
ZXF1aXJlZCBpcyBpbiB0aGUKPj4+IGluaXRfc29jX2JvdW5kaW5nX2JveCgpIGZ1bmN0aW9uIGFu
ZCB3aGVuIGNhbGN1bGF0aW5nIHRoZQo+Pj4ge21pbixtYXh9X2ZpbGxfY2xrX21oei4gTmFycm93
IHRoZSBzY29wZSB0byBqdXN0IHRoZXNlIHR3byBwYXJ0cyB0bwo+Pj4gYXZvaWQgc2xlZXBpbmcg
d2hpbGUgdXNpbmcgdGhlIEZQVS4KPj4+Cj4+PiBGaXhlczogN2E4YTM0MzBiZTE1ICgiYW1kZ3B1
OiBXcmFwIEZQVSBkZXBlbmRlbnQgZnVuY3Rpb25zIGluIGRjMjAiKQo+Pj4gQ2M6IFRpbW90aHkg
UGVhcnNvbiA8dHBlYXJzb25AcmFwdG9yZW5naW5lZXJpbmcuY29tPgo+Pj4gU2lnbmVkLW9mZi1i
eTogSmVyZW15IENsaW5lIDxqY2xpbmVAcmVkaGF0LmNvbT4KPj4gR29vZCBjYXRjaCwgYnV0IEkg
d291bGQgcmF0aGVyIHJlcGxhY2UgdGhlIGt6YWxsb2MoR0ZQX0tFUk5FTCkgd2l0aCBhCj4+IGt6
YWxsb2MoR0ZQX0FUT01JQykgZm9yIG5vdy4KPj4KPj4gV2UgaGF2ZSB0b25zIG9mIHByb2JsZW1z
IHdpdGggdGhpcyBEQ19GUF9TVEFSVCgpL0RDX0ZQX0VORCgpIGFubm90YXRpb25zIGFuZAo+PiBh
cmUgZXZlbiBpbiB0aGUgcHJvY2VzcyBvZiBtb3ZpbmcgdGhlbSBvdXQgb2YgdGhlIGZpbGUgYmVj
YXVzZSB0aGUgY29tcGlsZXMKPj4gdGVuZCB0byBjbHV0dGVyIEZQIHJlZ2lzdGVycyBldmVuIG91
dHNpZGUgb2YgdGhlIGFubm90YXRlZCByYW5nZXMgb24gc29tZQo+PiBhcmNoaXRlY3R1cmVzLgo+
Pgo+IFRoYW5rcyBmb3IgdGhlIHJldmlldy4gSXMgaXQgYWNjZXB0YWJsZSB0byBtb3ZlIHRoZSBE
Q19GUF9FTkQoKQo+IGFubm90YXRpb24gdXAgdG8gdGhlIGxhc3QgdXNhZ2U/IEtlZXBpbmcgaXQg
d2hlcmUgaXQgaXMgaXMgcHJvYmFibHkKPiBkby1hYmxlLCBidXQgY292ZXJzIHRoaW5ncyBsaWtl
IGNhbGxzIHRvIHJlc291cmNlX2NvbnN0cnVjdCgpIHdoaWNoCj4gbWFrZXMgdXNlIG9mIHN0cnVj
dCByZXNvdXJjZV9jcmVhdGVfZnVuY3MuIEknbSBndWVzc2luZyBvbmx5IGEgc3ViLXNldAo+IG9m
IHRoZSBpbXBsZW1lbnRhdGlvbnMgYXJlIGNhbGxlZCB2aWEgdGhpcyBmdW5jdGlvbiwgYnV0IGhh
dmluZyBhbgo+IGludGVyZmFjZSB3aGljaCBjYW4ndCBzbGVlcCBzb21ldGltZXMgZG9lc24ndCBz
b3VuZCBhcHBlYWxpbmcuCj4KPiBIYXBweSB0byBkbyBpdCwgYnV0IGJlZm9yZSBJIGdvIGRvd24g
dGhhdCByb2FkIEkganVzdCB3YW50ZWQgdG8gbWFrZQo+IHN1cmUgdGhhdCdzIHdoYXQgeW91IGhh
ZCBpbiBtaW5kLgoKSSBjYW4ndCBmdWxseSBqdWRnZSB0aGF0IGVpdGhlci4gSGFycnkgYW5kIHRo
ZSByZXN0IG9mIG91ciBEQyB0ZWFtIG5lZWRzIAp0byBkZWNpZGUgdGhhdC4KClRoYW5rcywKQ2hy
aXN0aWFuLgoKPgo+IFRoYW5rcywKPiBKZXJlbXkKPgo+Pj4gLS0tCj4+PiAgICBkcml2ZXJzL2dw
dS9kcm0vYW1kL2Rpc3BsYXkvZGMvZGNuMjAvZGNuMjBfcmVzb3VyY2UuYyB8IDggKysrKy0tLS0K
Pj4+ICAgIDEgZmlsZSBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKyksIDQgZGVsZXRpb25zKC0pCj4+
Pgo+Pj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9kY24yMC9k
Y24yMF9yZXNvdXJjZS5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2RjbjIwL2Rj
bjIwX3Jlc291cmNlLmMKPj4+IGluZGV4IGUwNGVjZjBmYzBkYi4uYTRmYTViZjAxNmMxIDEwMDY0
NAo+Pj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2RjbjIwL2RjbjIwX3Jl
c291cmNlLmMKPj4+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9kY24yMC9k
Y24yMF9yZXNvdXJjZS5jCj4+PiBAQCAtMzYyMiw2ICszNjIyLDcgQEAgc3RhdGljIGJvb2wgaW5p
dF9zb2NfYm91bmRpbmdfYm94KHN0cnVjdCBkYyAqZGMsCj4+PiAgICAJaWYgKGJiICYmIEFTSUNS
RVZfSVNfTkFWSTEyX1AoZGMtPmN0eC0+YXNpY19pZC5od19pbnRlcm5hbF9yZXYpKSB7Cj4+PiAg
ICAJCWludCBpOwo+Pj4gKwkJRENfRlBfU1RBUlQoKTsKPj4+ICAgIAkJZGNuMl8wX252MTJfc29j
LnNyX2V4aXRfdGltZV91cyA9Cj4+PiAgICAJCQkJZml4ZWQxNl90b19kb3VibGVfdG9fY3B1KGJi
LT5zcl9leGl0X3RpbWVfdXMpOwo+Pj4gICAgCQlkY24yXzBfbnYxMl9zb2Muc3JfZW50ZXJfcGx1
c19leGl0X3RpbWVfdXMgPQo+Pj4gQEAgLTM3MjEsNiArMzcyMiw3IEBAIHN0YXRpYyBib29sIGlu
aXRfc29jX2JvdW5kaW5nX2JveChzdHJ1Y3QgZGMgKmRjLAo+Pj4gICAgCQkJZGNuMl8wX252MTJf
c29jLmNsb2NrX2xpbWl0c1tpXS5kcmFtX3NwZWVkX210cyA9Cj4+PiAgICAJCQkJCWZpeGVkMTZf
dG9fZG91YmxlX3RvX2NwdShiYi0+Y2xvY2tfbGltaXRzW2ldLmRyYW1fc3BlZWRfbXRzKTsKPj4+
ICAgIAkJfQo+Pj4gKwkJRENfRlBfRU5EKCk7Cj4+PiAgICAJfQo+Pj4gICAgCWlmIChwb29sLT5i
YXNlLnBwX3NtdSkgewo+Pj4gQEAgLTM3NzcsOCArMzc3OSw2IEBAIHN0YXRpYyBib29sIGRjbjIw
X3Jlc291cmNlX2NvbnN0cnVjdCgKPj4+ICAgIAllbnVtIGRtbF9wcm9qZWN0IGRtbF9wcm9qZWN0
X3ZlcnNpb24gPQo+Pj4gICAgCQkJZ2V0X2RtbF9wcm9qZWN0X3ZlcnNpb24oY3R4LT5hc2ljX2lk
Lmh3X2ludGVybmFsX3Jldik7Cj4+PiAtCURDX0ZQX1NUQVJUKCk7Cj4+PiAtCj4+PiAgICAJY3R4
LT5kY19iaW9zLT5yZWdzID0gJmJpb3NfcmVnczsKPj4+ICAgIAlwb29sLT5iYXNlLmZ1bmNzID0g
JmRjbjIwX3Jlc19wb29sX2Z1bmNzOwo+Pj4gQEAgLTM5NTksOCArMzk1OSwxMCBAQCBzdGF0aWMg
Ym9vbCBkY24yMF9yZXNvdXJjZV9jb25zdHJ1Y3QoCj4+PiAgICAJCQkJcmFuZ2VzLnJlYWRlcl93
bV9zZXRzW2ldLndtX2luc3QgPSBpOwo+Pj4gICAgCQkJCXJhbmdlcy5yZWFkZXJfd21fc2V0c1tp
XS5taW5fZHJhaW5fY2xrX21oeiA9IFBQX1NNVV9XTV9TRVRfUkFOR0VfQ0xLX1VOQ09OU1RSQUlO
RURfTUlOOwo+Pj4gICAgCQkJCXJhbmdlcy5yZWFkZXJfd21fc2V0c1tpXS5tYXhfZHJhaW5fY2xr
X21oeiA9IFBQX1NNVV9XTV9TRVRfUkFOR0VfQ0xLX1VOQ09OU1RSQUlORURfTUFYOwo+Pj4gKwkJ
CQlEQ19GUF9TVEFSVCgpOwo+Pj4gICAgCQkJCXJhbmdlcy5yZWFkZXJfd21fc2V0c1tpXS5taW5f
ZmlsbF9jbGtfbWh6ID0gKGkgPiAwKSA/IChsb2FkZWRfYmItPmNsb2NrX2xpbWl0c1tpIC0gMV0u
ZHJhbV9zcGVlZF9tdHMgLyAxNikgKyAxIDogMDsKPj4+ICAgIAkJCQlyYW5nZXMucmVhZGVyX3dt
X3NldHNbaV0ubWF4X2ZpbGxfY2xrX21oeiA9IGxvYWRlZF9iYi0+Y2xvY2tfbGltaXRzW2ldLmRy
YW1fc3BlZWRfbXRzIC8gMTY7Cj4+PiArCQkJCURDX0ZQX0VORCgpOwo+Pj4gICAgCQkJCXJhbmdl
cy5udW1fcmVhZGVyX3dtX3NldHMgPSBpICsgMTsKPj4+ICAgIAkJCX0KPj4+IEBAIC00MTI1LDEy
ICs0MTI3LDEwIEBAIHN0YXRpYyBib29sIGRjbjIwX3Jlc291cmNlX2NvbnN0cnVjdCgKPj4+ICAg
IAkJcG9vbC0+YmFzZS5vZW1fZGV2aWNlID0gTlVMTDsKPj4+ICAgIAl9Cj4+PiAtCURDX0ZQX0VO
RCgpOwo+Pj4gICAgCXJldHVybiB0cnVlOwo+Pj4gICAgY3JlYXRlX2ZhaWw6Cj4+PiAtCURDX0ZQ
X0VORCgpOwo+Pj4gICAgCWRjbjIwX3Jlc291cmNlX2Rlc3RydWN0KHBvb2wpOwo+Pj4gICAgCXJl
dHVybiBmYWxzZTsKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9y
ZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZl
bAo=
