Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B91342ED4CD
	for <lists+dri-devel@lfdr.de>; Thu,  7 Jan 2021 17:53:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1AC4F6E4C7;
	Thu,  7 Jan 2021 16:53:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2075.outbound.protection.outlook.com [40.107.94.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 33AC26E4C7;
 Thu,  7 Jan 2021 16:53:28 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cntsH/NZJNMCIhqyNUjs0dQxrF83RSGFQwrBVXJOPC5O7rj7mdVUZ/WC1xiGiDRLZ5DXD3ymx5nWK7bD7NnXu1pJ1h0DpQLgLW01FcjjBYTRcqpN10eqdcB6VPXBt0fMmzlge+4zvpj5gM7nPHYYAPPTV4eDr7Wyg9BybEkGBSe8ZkQEiVpohU508FMmKLPL4sdEM+KmmbXXnzK0wIPivl7FnYb2Hv6/8AgNXftcTvg0RLl4OFth6tEqxZF01lCtIdcTdOTS/UGdJvieHVGw5vV+Qv+rEg+jRtgvYdjJ4hhR3uMXfMyiP72JDVXZz2hJ0nar5c/XZPAtcWmFj45s8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OCiDXeWtYgRolvDbcj9qJC/JpLDAHaSD7v0naa3+5tw=;
 b=VkwiWTUS8XV58AdTOuavdn+h373iICXw1qLW6PMv2WI+v3uPLRut8lW24TcG3ZeAQp54GqlwPPEL3D1SxSdg7qv99V8NXmHA5HuE3eytdIPB+eNoRBdncROHZ8OfK+flcTkmf8w9dGBLYZ/RnDr0Qn1X00WDfbyHOpTYgqDHRRm16H4u6sLV1rFY5NZQTEXa6L2D+WJjnm5WZA38PPPxZIb+b3RpyRPlN6m2Ixlgpo0orBJf9L+zKXXPmgD1jg8h74XVC7cwH18bjmWY9/NY0ZBTco1lvSHiHjhYH0Wa4vYd61HyT2L/2Z463tkWuYJdSewVEhngEjkIgRcZz5wAAw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OCiDXeWtYgRolvDbcj9qJC/JpLDAHaSD7v0naa3+5tw=;
 b=N5C7fz2cXk5/mwEdoYIYHELZ7zEABPUmpFCb/wqv50qS7rMZ9dS2yQG/0qB3gTgwVZ90FB8PPoz12/oxbAt1GYeyVdPXTBcbjOUS4zvMs2aPSmxOCKHqVEeDT0j+s62ffFkJtjoqbBS3nZ7dR1mrDDtsv2p+1WLWB5y51VCmUO0=
Authentication-Results: ffwll.ch; dkim=none (message not signed)
 header.d=none;ffwll.ch; dmarc=none action=none header.from=amd.com;
Received: from BL0PR12MB4948.namprd12.prod.outlook.com (2603:10b6:208:1cc::20)
 by MN2PR12MB4144.namprd12.prod.outlook.com (2603:10b6:208:15f::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3742.6; Thu, 7 Jan
 2021 16:53:27 +0000
Received: from BL0PR12MB4948.namprd12.prod.outlook.com
 ([fe80::9425:559:83c0:991b]) by BL0PR12MB4948.namprd12.prod.outlook.com
 ([fe80::9425:559:83c0:991b%9]) with mapi id 15.20.3742.006; Thu, 7 Jan 2021
 16:53:27 +0000
Subject: Re: [PATCH 29/35] drm/amdgpu: svm bo enable_signal call condition
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
References: <20210107030127.20393-1-Felix.Kuehling@amd.com>
 <20210107030127.20393-30-Felix.Kuehling@amd.com>
 <b16fcc27-fe4e-88a2-4f23-dcfa9ba69264@gmail.com>
 <4875fe7b-737c-60ae-9494-4008d7f8b19f@amd.com>
 <32203969-465d-166a-ea8f-e011a4f80d8c@amd.com>
From: Felix Kuehling <felix.kuehling@amd.com>
Message-ID: <532a32ce-aa29-cab5-c0b6-5b30b59a57d5@amd.com>
Date: Thu, 7 Jan 2021 11:53:25 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <32203969-465d-166a-ea8f-e011a4f80d8c@amd.com>
Content-Language: en-US
X-Originating-IP: [142.117.121.176]
X-ClientProxiedBy: YT1PR01CA0077.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2d::16) To BL0PR12MB4948.namprd12.prod.outlook.com
 (2603:10b6:208:1cc::20)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.2.100] (142.117.121.176) by
 YT1PR01CA0077.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:2d::16) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3742.6 via Frontend Transport; Thu, 7 Jan 2021 16:53:26 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: b4963fab-af2a-4225-4ae7-08d8b32cc0fc
X-MS-TrafficTypeDiagnostic: MN2PR12MB4144:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MN2PR12MB41443DBC04626C791369E61F92AF0@MN2PR12MB4144.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: fgUATaQc5lcxHckMdAPlihHJOFMMtMS1AGqWexW/PDjC+7WWkl8cW762WbcJhsN8BNRouMnFQJ2OXdoi86Jsw4mnGa8b7HfSnKT9WJfSwEfhmkEuS5FM2g91aZ4q0zwGitB8/ZHgOydj9J7M3Yq+1wr2op7LWjtcie+0zm+qSy8U1HA1Pb9x4VAabzMMbma5g20KGrx2zckwsNbXY1lFFCLWVl16f6GV51fi+sBlgktBD17MmaTigDNKRo1sLHbOe0ggZBSuSqAu8y1PouF6xDv7UPU/nSGVjsVHeRQeDVdTzj3Gcu5srf7t3/2TSAisogMnIq5hkWD/6wjzEKbtEg8ed7cKhczhbIoJzKqqiy9nh4ESrbcthf0VWsH5G+Rxa/H2k5UANOPpxexgsRvwSok3bZq1+RWRNvOweaAE2Qc0PHbrPQ0F3vSfCxWzke16AkWo1i7QK0mqLQpJmj1qDBeIonhZAEi8pBW54IhqfvBde8n/PqNtU7z/UW0ZEkx/uZDhtXBOF3jfMLJZpfu3fA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR12MB4948.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(376002)(366004)(346002)(396003)(39860400002)(16526019)(66556008)(6486002)(86362001)(66476007)(66946007)(186003)(36756003)(31686004)(5660300002)(8676002)(8936002)(2906002)(26005)(956004)(2616005)(478600001)(44832011)(52116002)(31696002)(4326008)(83380400001)(66574015)(316002)(16576012)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?TUJEVUJyeDdMdjNyS3I2aGk4NzVtWjJPWmFVbExHU1JWNmZtTk9WeURWSk1C?=
 =?utf-8?B?QjR6bzZseVhMNFBVaFNtbkFrc254clg3SHQrRXV2V1I0bU9vdU13WURlUWRj?=
 =?utf-8?B?VTVBZWhGSDlGZjNvaGxqbE5PRWwwSGVuUXFPdFdMS1ZCL3J5anM3VUR1amUy?=
 =?utf-8?B?b3JsTWtYeUhGM1pBemRYaHYrOFlHWGxXdUpXdS9EMC8wbDJTZ3A3L1BmRUI0?=
 =?utf-8?B?Y0ErRmt6Qkg0QUxpdHloK1NJam1ibmhEcGJrdjd0TnllK0g5QUcyT1QrcTAz?=
 =?utf-8?B?UmZ6a2h6VGxEUStkcTBXcmdwc0tTUC91STkxa2RpYXhjNFVrQUsveURwanhY?=
 =?utf-8?B?amlDZnNOdmE1TDhXUXRNbktuTGpyOWZJZnNmQStzYU1wdjA5VnJSSTFXYm9t?=
 =?utf-8?B?RHJZbDBvYzdUMy9zenh0RWhWbUowbndhN2F0Q1M0YTFJWGptQ3NPN3pOZk45?=
 =?utf-8?B?NldTVllMWEdiK1VEQWNBNDZJcWNHSEFjZ24zVU41REVFaFpVMmVMbFB3aW1a?=
 =?utf-8?B?ZmZNcHdncE9BUzd2WUgxT2xhTVk4TzJva1lacFB4STA2UC92VXJKY2lJQVhZ?=
 =?utf-8?B?dGZNUktudm1pdmJ1dDQvMEw5czZxVzJTVDVBUG16a1J2Z2xHcXluVVROM3Vq?=
 =?utf-8?B?QjlnbTY2U0toaGd6SmxwRkNCQVo0VG1LaktPYUR3Zk83VU91YXVrTHkvVHZT?=
 =?utf-8?B?UWhCKzZqejZGN1VNdzJISUUxdnFTcytkelVEMmRTcGxiZUpxUHltNmdld3lK?=
 =?utf-8?B?U3JyaDZjcGNRUVF6bVRxaXhHdlIwMTM5L05kQ1JTMmYzcXFpNmU1OG84RzBi?=
 =?utf-8?B?bjZuK29HZytuVmxSekZQekcyU3FGTFFObnN3STFha0FTTlEvNjB3OW9XMHJj?=
 =?utf-8?B?d3ZQYVVud2dwQUhoNDhDc1JjOERtdXlXNEQ3c21HZHpnd3RKV1BkeisweS9o?=
 =?utf-8?B?NUh5QmpTT1UwY0lrQ1U0OGZxRFNGTTZYdVhaZ1Qwc2c1d0ZJV1dQMnFyNDhx?=
 =?utf-8?B?azJyWnU2cHJOeGg2c3Ric0kxZHF2WUgrU1B1RFo1SkV2WUtsN3Zjbjh1STc1?=
 =?utf-8?B?NzZiWTFDemcwdGlUY1Nzc3d1ckJxMGFiLzZIcU4xbUF0K3AyVXM3MVVUVzZD?=
 =?utf-8?B?cWQ2Si9jd25YZnJLU3owMEZOWW9oM2QzQitWU3g3aVQwQ2plMXQwNGp6V0Fr?=
 =?utf-8?B?bmw4M2dxWlRlSWhjOC9Jc0JRQVdGdFI0YnhRckVvWmI1Z2FBbW8zSStHUG94?=
 =?utf-8?B?OG5VN3d5eDhvV0haUmJndHluVTFlMytmV1p5V21Tbyt6NEdFS2JpNWRvZnBo?=
 =?utf-8?Q?RrXUkAHhhC0cDE95gDNVKOhLbEgFz8ZWim?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB4948.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jan 2021 16:53:26.9134 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-Network-Message-Id: b4963fab-af2a-4225-4ae7-08d8b32cc0fc
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jY5Y9oJl2URmROckNI5ty0ninfWtg/QM5G13pAGZ8/nVEaBFabK56IDuuTrEADxGfkfHvB9OGVptVvCc6rciiw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4144
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
Cc: alex.sierra@amd.com, philip.yang@amd.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QW0gMjAyMS0wMS0wNyB1bSAxMToyOCBhLm0uIHNjaHJpZWIgQ2hyaXN0aWFuIEvDtm5pZzoKPiBB
bSAwNy4wMS4yMSB1bSAxNzoxNiBzY2hyaWViIEZlbGl4IEt1ZWhsaW5nOgo+PiBBbSAyMDIxLTAx
LTA3IHVtIDU6NTYgYS5tLiBzY2hyaWViIENocmlzdGlhbiBLw7ZuaWc6Cj4+Cj4+PiBBbSAwNy4w
MS4yMSB1bSAwNDowMSBzY2hyaWViIEZlbGl4IEt1ZWhsaW5nOgo+Pj4+IEZyb206IEFsZXggU2ll
cnJhIDxhbGV4LnNpZXJyYUBhbWQuY29tPgo+Pj4+Cj4+Pj4gW3doeV0KPj4+PiBUbyBzdXBwb3J0
IHN2bSBibyBldmljdGlvbiBtZWNoYW5pc20uCj4+Pj4KPj4+PiBbaG93XQo+Pj4+IElmIHRoZSBC
TyBjcmF0ZWQgaGFzIEFNREdQVV9BTURLRkRfQ1JFQVRFX1NWTV9CTyBmbGFnIHNldCwKPj4+PiBl
bmFibGVfc2lnbmFsIGNhbGxiYWNrIHdpbGwgYmUgY2FsbGVkIGluc2lkZSBhbWRncHVfZXZpY3Rf
ZmxhZ3MuCj4+Pj4gVGhpcyBhbHNvIGNhdXNlcyBndXR0aW5nIG9mIHRoZSBCTyBieSByZW1vdmlu
ZyBhbGwgcGxhY2VtZW50cywKPj4+PiBzbyB0aGF0IFRUTSB3b24ndCBhY3R1YWxseSBkbyBhbiBl
dmljdGlvbi4gSW5zdGVhZCBpdCB3aWxsIGRpc2NhcmQKPj4+PiB0aGUgbWVtb3J5IGhlbGQgYnkg
dGhlIEJPLiBUaGlzIGlzIG5lZWRlZCBmb3IgSE1NIG1pZ3JhdGlvbiB0byB1c2VyCj4+Pj4gbW9k
ZSBzeXN0ZW0gbWVtb3J5IHBhZ2VzLgo+Pj4gSSBkb24ndCB0aGluayB0aGF0IHRoaXMgd2lsbCB3
b3JrLiBXaGF0IGV4YWN0bHkgYXJlIHlvdSBkb2luZyBoZXJlPwo+PiBXZSBkaXNjdXNzZWQgdGhp
cyBhIHdoaWxlIGFnbyB3aGVuIHdlIHRhbGtlZCBhYm91dCBwaXBlbGluZWQgZ3V0dGluZy4KPj4g
QW5kIHlvdSBhY3R1YWxseSBoZWxwZWQgdXMgb3V0IHdpdGggYSBmaXggZm9yIHRoYXQKPj4gKGh0
dHBzOi8vcGF0Y2h3b3JrLmZyZWVkZXNrdG9wLm9yZy9wYXRjaC8zNzkwMzkvKS4KPgo+IFRoYXQn
cyBub3Qgd2hhdCBJIG1lYW50LiBUaGUgcGlwZWxpbmVkIGd1dHRpbmcgaXMgb2ssIGJ1dCB3aHkg
dGhlCj4gZW5hYmxlX3NpZ25hbGluZygpPwoKVGhhdCdzIHdoYXQgdHJpZ2dlcnMgb3VyIGV2aWN0
aW9uIGZlbmNlIGNhbGxiYWNrCmFtZGtmZF9mZW5jZV9lbmFibGVfc2lnbmFsaW5nIHRoYXQgc2No
ZWR1bGVzIHRoZSB3b3JrZXIgZG9pbmcgdGhlCmV2aWN0aW9uLiBXaXRob3V0IHBpcGVsaW5lZCBn
dXR0aW5nIHdlJ2QgYmUgZ2V0dGluZyB0aGF0IGNhbGxiYWNrIGZyb20KdGhlIEdQVSBzY2hlZHVs
ZXIgd2hlbiBpdCB0cmllcyB0byBleGVjdXRlIHRoZSBqb2IgdGhhdCBkb2VzIHRoZQptaWdyYXRp
b24uIFdpdGggcGlwZWxpbmVkIGd1dHRpbmcgd2UgaGF2ZSB0byBjYWxsIHRoaXMgc29tZXdoZXJl
IG91cnNlbHZlcy4KCkkgZ3Vlc3Mgd2UgY291bGQgc2NoZWR1bGUgdGhlIGV2aWN0aW9uIHdvcmtl
ciBkaXJlY3RseSB3aXRob3V0IGdvaW5nCnRocm91Z2ggdGhlIGZlbmNlIGNhbGxiYWNrLiBJIHRo
aW5rIHdlIGRpZCBpdCB0aGlzIHdheSBiZWNhdXNlIGl0J3MgbW9yZQpzaW1pbGFyIHRvIG91ciBL
RkQgQk8gZXZpY3Rpb24gaGFuZGxpbmcgd2hlcmUgdGhlIHdvcmtlciBnZXRzIHNjaGVkdWxlZApi
eSB0aGUgZmVuY2UgY2FsbGJhY2suCgpSZWdhcmRzLArCoCBGZWxpeAoKCj4KPiBDaHJpc3RpYW4u
Cj4KPj4KPj4gU1ZNIEJPcyBhcmUgQk9zIGluIFZSQU0gY29udGFpbmluZyBkYXRhIGZvciBITU0g
cmFuZ2VzLiBXaGVuIHN1Y2ggYSBCTwo+PiBpcyBldmljdGVkIGJ5IFRUTSwgd2UgZG8gYW4gSE1N
IG1pZ3JhdGlvbiBvZiB0aGUgZGF0YSB0byBzeXN0ZW0gbWVtb3J5Cj4+ICh0cmlnZ2VyZWQgYnkg
a2dkMmtmZF9zY2hlZHVsZV9ldmljdF9hbmRfcmVzdG9yZV9wcm9jZXNzIGluIHBhdGNoIDMwKS4K
Pj4gVGhhdCBtZWFucyB3ZSBkb24ndCBuZWVkIFRUTSB0byBjb3B5IHRoZSBCTyBjb250ZW50cyB0
byBHVFQgYW55IG1vcmUuCj4+IEluc3RlYWQgd2Ugd2FudCB0byB1c2UgcGlwZWxpbmVkIGd1dHRp
bmcgdG8gYWxsb3cgdGhlIFZSQU0gdG8gYmUgZnJlZWQKPj4gb25jZSB0aGUgZmVuY2Ugc2lnbmFs
cyB0aGF0IHRoZSBITU0gbWlncmF0aW9uIGlzIGRvbmUgKHRoZQo+PiBkbWFfZmVuY2Vfc2lnbmFs
IGNhbGwgbmVhciB0aGUgZW5kIG9mIHN2bV9yYW5nZV9ldmljdF9zdm1fYm9fd29ya2VyIGluCj4+
IHBhdGNoIDI4KS4KPj4KPj4gUmVnYXJkcywKPj4gwqDCoCBGZWxpeAo+Pgo+Pgo+Pj4gQXMgRGFu
aWVsIHBvaW50ZWQgb3V0IEhNTSBhbmQgZG1hX2ZlbmNlcyBhcmUgZnVuZGFtZW50YWxseQo+Pj4g
aW5jb21wYXRpYmxlLgo+Pj4KPj4+IENocmlzdGlhbi4KPj4+Cj4+Pj4gU2lnbmVkLW9mZi1ieTog
QWxleCBTaWVycmEgPGFsZXguc2llcnJhQGFtZC5jb20+Cj4+Pj4gU2lnbmVkLW9mZi1ieTogRmVs
aXggS3VlaGxpbmcgPEZlbGl4Lkt1ZWhsaW5nQGFtZC5jb20+Cj4+Pj4gLS0tCj4+Pj4gwqDCoCBk
cml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfdHRtLmMgfCAxNCArKysrKysrKysrKysr
Kwo+Pj4+IMKgwqAgMSBmaWxlIGNoYW5nZWQsIDE0IGluc2VydGlvbnMoKykKPj4+Pgo+Pj4+IGRp
ZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfdHRtLmMKPj4+PiBi
L2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV90dG0uYwo+Pj4+IGluZGV4IGY0MjNm
NDJjYjliNS4uNjJkNGRhOTVkMjJkIDEwMDY0NAo+Pj4+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9h
bWQvYW1kZ3B1L2FtZGdwdV90dG0uYwo+Pj4+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1k
Z3B1L2FtZGdwdV90dG0uYwo+Pj4+IEBAIC0xMDcsNiArMTA3LDIwIEBAIHN0YXRpYyB2b2lkIGFt
ZGdwdV9ldmljdF9mbGFncyhzdHJ1Y3QKPj4+PiB0dG1fYnVmZmVyX29iamVjdCAqYm8sCj4+Pj4g
wqDCoMKgwqDCoMKgIH0KPj4+PiDCoMKgIMKgwqDCoMKgwqAgYWJvID0gdHRtX3RvX2FtZGdwdV9i
byhibyk7Cj4+Pj4gK8KgwqDCoCBpZiAoYWJvLT5mbGFncyAmIEFNREdQVV9BTURLRkRfQ1JFQVRF
X1NWTV9CTykgewo+Pj4+ICvCoMKgwqDCoMKgwqDCoCBzdHJ1Y3QgZG1hX2ZlbmNlICpmZW5jZTsK
Pj4+PiArwqDCoMKgwqDCoMKgwqAgc3RydWN0IGRtYV9yZXN2ICpyZXN2ID0gJmJvLT5iYXNlLl9y
ZXN2Owo+Pj4+ICsKPj4+PiArwqDCoMKgwqDCoMKgwqAgcmN1X3JlYWRfbG9jaygpOwo+Pj4+ICvC
oMKgwqDCoMKgwqDCoCBmZW5jZSA9IHJjdV9kZXJlZmVyZW5jZShyZXN2LT5mZW5jZV9leGNsKTsK
Pj4+PiArwqDCoMKgwqDCoMKgwqAgaWYgKGZlbmNlICYmICFmZW5jZS0+b3BzLT5zaWduYWxlZCkK
Pj4+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBkbWFfZmVuY2VfZW5hYmxlX3N3X3NpZ25hbGlu
ZyhmZW5jZSk7Cj4+Pj4gKwo+Pj4+ICvCoMKgwqDCoMKgwqDCoCBwbGFjZW1lbnQtPm51bV9wbGFj
ZW1lbnQgPSAwOwo+Pj4+ICvCoMKgwqDCoMKgwqDCoCBwbGFjZW1lbnQtPm51bV9idXN5X3BsYWNl
bWVudCA9IDA7Cj4+Pj4gK8KgwqDCoMKgwqDCoMKgIHJjdV9yZWFkX3VubG9jaygpOwo+Pj4+ICvC
oMKgwqDCoMKgwqDCoCByZXR1cm47Cj4+Pj4gK8KgwqDCoCB9Cj4+Pj4gwqDCoMKgwqDCoMKgIHN3
aXRjaCAoYm8tPm1lbS5tZW1fdHlwZSkgewo+Pj4+IMKgwqDCoMKgwqDCoCBjYXNlIEFNREdQVV9Q
TF9HRFM6Cj4+Pj4gwqDCoMKgwqDCoMKgIGNhc2UgQU1ER1BVX1BMX0dXUzoKPgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBs
aXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVz
a3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
