Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E58136EE0B
	for <lists+dri-devel@lfdr.de>; Thu, 29 Apr 2021 18:21:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC7B16F3BE;
	Thu, 29 Apr 2021 16:21:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2073.outbound.protection.outlook.com [40.107.93.73])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A86B6F3B3;
 Thu, 29 Apr 2021 16:21:46 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QQO5E+rH1A8OYuNSTYQNMwJemZiao5ZQWyedLMkVM0rNJmRRM5FYpK8DfIyKX/aqXWDyeq5ai49N/+ZdWA12c823Wi7Dg8xwFtNMigfbQsgNqZdAywTKnJoLRcrwLrwOhQeAX9Itm6RCo90P/An17JnkDP5dTASCPhxNYfhmmQLCsWEJbhk80kmTox5tvJxN2UfqhGP1GGG/Y+EvWcbxbJcFo5GqtAK4TGSXFJ6PZqoY+KvYCIhfedMi18p1EGEqgU9i0YOvDfQkfEup+VZLT++WBM5rrgXiA91jKKxqE2qOhG3nfdAB+bARWjR6PtCQhx5jk/wbk0rku8R5+UoVJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0u4kwoTZkp0gQAx62plYAUc+XDs+Gy1jHax+dJPAHhk=;
 b=Yp54DoUx8YMGrAxP4J7cYkhyXZ0TNSXQTZA8HAFvE2xLKBLxLEDFECPmCZW1cT+5QtfKFxbsySrRM4vQWURueRVPxDnsWZO7CEQ9lS6tWdOj0NohGGLq5EcDUmG7C/GN8R8Oj4IXBPJOhZ2a6dYbvwmc1AqBTayuXbuzBs9b2nO7dBrCVhA62c99zeLIbVF28wpId6jTtFRrcnGzC9TafofMJyHJaMYB9GPs/LP/FiMNlEnLoofBrXwsFXt+9kygzp4C/GG0XXa/s34Ty4hBszgH2jJj+TP2kC1zPTiP8e3pnW1rZZGIdC2/nUexgnF8UqpjX3l8Ged2i9usClu/7w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0u4kwoTZkp0gQAx62plYAUc+XDs+Gy1jHax+dJPAHhk=;
 b=0NZhXrMCzE9x+12HsJWsCCYGnW9myznIqdMswLNuocuqQpDhHA6JJcpXut7TTkCNwDWxDJCvV3Wf8Ts/9hniGMLXlH+WhnkQOiaBVzrK9Ehqt6NocTTGWzttEjMejnVi3eLGS3eHqNvSscdh2k0qLuaSaI49CyQGNICyWhQUBec=
Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=amd.com;
Received: from SN6PR12MB4623.namprd12.prod.outlook.com (2603:10b6:805:e9::17)
 by SA0PR12MB4416.namprd12.prod.outlook.com (2603:10b6:806:99::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4065.21; Thu, 29 Apr
 2021 16:21:44 +0000
Received: from SN6PR12MB4623.namprd12.prod.outlook.com
 ([fe80::ad51:8c49:b171:856c]) by SN6PR12MB4623.namprd12.prod.outlook.com
 ([fe80::ad51:8c49:b171:856c%7]) with mapi id 15.20.4065.026; Thu, 29 Apr 2021
 16:21:44 +0000
Subject: Re: [PATCH v5 20/27] drm: Scope all DRM IOCTLs with drm_dev_enter/exit
To: Felix Kuehling <felix.kuehling@amd.com>, Daniel Vetter <daniel@ffwll.ch>
References: <20210428151207.1212258-1-andrey.grodzovsky@amd.com>
 <20210428151207.1212258-21-andrey.grodzovsky@amd.com>
 <YIqXJ5LA6wKl/yzZ@phenom.ffwll.local> <YIqZZW9iFyGCyOmU@phenom.ffwll.local>
 <95935e46-408b-4fee-a7b4-691e9db4f455@amd.com>
 <e760ada9-b4a7-c6ab-18f7-0bcc1b5442c2@amd.com>
From: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
Message-ID: <a0cfd25b-f9fd-5788-d2d8-331b69102622@amd.com>
Date: Thu, 29 Apr 2021 12:21:40 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
In-Reply-To: <e760ada9-b4a7-c6ab-18f7-0bcc1b5442c2@amd.com>
Content-Language: en-US
X-Originating-IP: [2607:fea8:3edf:49b0:497:888:9bb9:54f1]
X-ClientProxiedBy: YTOPR0101CA0012.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:15::25) To SN6PR12MB4623.namprd12.prod.outlook.com
 (2603:10b6:805:e9::17)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2607:fea8:3edf:49b0:497:888:9bb9:54f1]
 (2607:fea8:3edf:49b0:497:888:9bb9:54f1) by
 YTOPR0101CA0012.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b00:15::25) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4065.25 via Frontend
 Transport; Thu, 29 Apr 2021 16:21:43 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3dc37bff-3673-4ba3-3db6-08d90b2ae0f4
X-MS-TrafficTypeDiagnostic: SA0PR12MB4416:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SA0PR12MB44160306BEA2917CF7EEF5C0EA5F9@SA0PR12MB4416.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5516;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: w7fH41+Zi2EP5QaSF5AStZIjs+tMbCaOigzBX7awsfifi0lyt/NQND0vBUa2MkYAy4dH8TGRlGhyUnixA830xG7qujNZhWwYYyKW31C0QA/XUzRDG1kOMhw8cT+D3QiMF+qIfqKvUwB6kI34pFH/nUAhvQ2YgqYPjT2/7wwL1mn0mCwzOg0hqk+M/y0PyDAgpYof6ggaOpr8fv7Xd+ktIHkzc7HUrGrLe1zCEVpltY70r55D+YckoDV+KMdBGnRNcE3ZMb8Tym+aCYJo4KP9bNYfyEEOYqlhK2zEABkfnS/Udrlv6YmDIt22CuP0oHvkhhwGZWCig4L8X79shft01xMDPz+sZ78Yb9qmkLuRDRuhS+rPUrC1h55VpRJVswyWz18hol0nspihG4rgmHjifTtniHNXpWu+Cl5SsXvEXGcQKzmEj0vPmMmo/Htor9MQcG/yfEJzwrIYzVb/3JX4i4LZuQ4JNMWNMPMnCRLeGTIqVfCsrI3PATX+x/iICDS/XzYpQscJhnb/feChooIzyLf8fXG/K0RNaFaYaquQCN+2IkcxoBfJepWbJk1EJ5jx6izns4XFqxorUDhEQ40BF2LNNRQbxcsrh8qre2COD40qAukLcWpdPrDoUMXpTykvPx1/mxutRapzlpXyMM01rq+uHsjHcXusXxiH91BZahYrGTdeZY5FTfLdJd7WP1VstzkFveyr+n4BJBumEz85Dw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR12MB4623.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39840400004)(136003)(396003)(346002)(376002)(366004)(31686004)(66476007)(31696002)(4326008)(86362001)(66556008)(83380400001)(6486002)(186003)(16526019)(316002)(8676002)(5660300002)(2616005)(38100700002)(2906002)(966005)(53546011)(478600001)(36756003)(66946007)(8936002)(110136005)(52116002)(44832011)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?M29GcjR0UysydzNMRjE5dG9qQVNUeXZ3cGVlenhuTS9NcHNOMWo2dGlGVWJB?=
 =?utf-8?B?NFhTN0JpTVMxMFIzcXZSUnhxQjJUK0hFQlVReWdaVG5KdmEvb3pCcVZQWEs5?=
 =?utf-8?B?QVBwSGVmQ0Q1TXhINDFoZ0FiVCtNUFFGYlkvYVZQek1GQlhvNjBzY3FoQUtk?=
 =?utf-8?B?dHRpWE9aT3NWdmZ6Y0Mwb2tMWTVFTFJOMCt5NVVhWWRNK1dUMlpVVEpOMXhF?=
 =?utf-8?B?NmFHcExHMnhWM0taTGtRRkUraW1sazJGd01sWGwxRm0ydDlNSjNqN1VXQXFT?=
 =?utf-8?B?TWhQQUg1Zkt0aE1IVks0UHl3cnN1cWRDWE5MUllhOHRxajBoN2NPWWxBQjhh?=
 =?utf-8?B?WXgzanJTeHcyQy9qQlI2S1F5bGt6NEswNGxsUHM2M0JLWEl1RTJ3ZWdWcmpX?=
 =?utf-8?B?QmcxQWdUODNUZWdJd3N5dURCWTRkbWU1Q3VZZEZJdEh1VitJYkRUT3BIZVVR?=
 =?utf-8?B?NTFNQTZUUFhFaVlvNDVYOGdyejcrOFFJOENNN1pWNmUvQ3E1Z2U3WTJaNk9F?=
 =?utf-8?B?ZEN4R1pxOHNxQ3JjaWJjKzdOUmxNbkhnOU50em9XMFNnWGVYQzBXL2k0VlJK?=
 =?utf-8?B?OWh5K3pmVGZ2ZzQ0UzcxcXZwckVCT3BPa3JVc3hQYk5aUk5qb2V4Z0pzblJm?=
 =?utf-8?B?NDdzSElLZUtTTEttRHUzQVd3V1JEUGVQNTJ1RVpZamNVUTIrSFlmSXR6WUln?=
 =?utf-8?B?MXhRR0VVM0xEMzg5cWtTcHo0SGNJVFl2Tjc2Nk1ndGhBeEtmUkN0aGVSRTlG?=
 =?utf-8?B?QWRmMUp2OTBlMjJJYmtuTGN1MmZubU5oQVltQlRMSUowc3psTnRMcExMSEx5?=
 =?utf-8?B?LytIN2FqcnN5cWN0b25pK2d0RUppNGR6dFhiSmRkaHN2ZUFmUEZSeFBvSUJC?=
 =?utf-8?B?cFJRMWxQZktvODR6c3h1cERYTGRLb0xUSVRTWjBjL3FKNEFaUVlZZDhBOEN0?=
 =?utf-8?B?aWU3bXNyOFhiWjl5M3M2RTIvUFRiS1RqVTUwL1ZkUDdhU0FvMnhFUXp2bXhF?=
 =?utf-8?B?MUdlVUptUjNvVzB3bmQzSEh3ZEM0Ym91am9kNFRCR1pvcWhxUmpSZC91Ym03?=
 =?utf-8?B?WC9NZzRNajlsUmJ4NVFrQ0pmVC9JV2pZblp2bFJUTFVNSXUvajc5dDZac0Y4?=
 =?utf-8?B?Q1VpKzFpc1JINHBwR3N3dzZ5K0VsaTd5YlJFalhUVjVXa1Rnd2tKdm1zczlt?=
 =?utf-8?B?T1FCWlh1ZHNJVUVJMTJWY1VmVWF5eHRlYjc0am5xc1RaV1g0SWpVSzU3RndV?=
 =?utf-8?B?Vkc1Y2lqWm84dXYwSXJCYko3dVIrNGFvSHNHejZMN3BvYkI5T1Q3V2hhSGlR?=
 =?utf-8?B?ODlQVmVwYmJraHJUcWpBT1l3SVVPdEFRWEFXVVJsS3FQSmZHVnZhZ2RmRm9E?=
 =?utf-8?B?QkVNZGgwM1hEdCt3SVl6TGZFbHZJVU51Mkt0dHkzaWR0bDZyRXpHN2g0KzZQ?=
 =?utf-8?B?dHBTbVlhOGpLb3FvMlU1dUdkTlF3bTRIOUhsaktrT1NDMEx6ejA1elZJUWFB?=
 =?utf-8?B?UUxyODdZNk5VRGFEaEJHUUpoZ2paZGFrZzdGM0plakZYM2luc0ltYmpWcGx2?=
 =?utf-8?B?MmplSU40K2kzN09yR1ZwZXhpZ0ZUazY5cm01a3pZK0E1T3BmY1FobUpLdmJJ?=
 =?utf-8?B?WEM4UENDVlE2VFV2Uy9PSUFMdHI1cHljb1duTFVPZFZKdDUyTHo4eGlLa0xa?=
 =?utf-8?B?NEN4U1ZYQ3dXRW01RGVtaHEwZDdWN2lLcDhJVkxKWUltMjRvbElhbTBBbXkw?=
 =?utf-8?B?dnJtVFZHK3M5ay9FWFRwWkdsYzgrMEdRUHlZZ2xSdHF6RVlSMVhiNUdyNlJY?=
 =?utf-8?B?Yy9Rb2szeVJuRXVLNVZ5bFdsdVlEQ1ZGZ3VlSFBoNEhuS1k0WkV3ZGU3TWUw?=
 =?utf-8?Q?d02hoP5NsHZKW?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3dc37bff-3673-4ba3-3db6-08d90b2ae0f4
X-MS-Exchange-CrossTenant-AuthSource: SN6PR12MB4623.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Apr 2021 16:21:44.1530 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2XJHCwDH/Qwx4ISkWtqr5xpt2Jhy0xqRfU9hzOkFt64w4NwEeoOT/IwAPX15jd73kApHvlnUexX1umE5M++5iw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB4416
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
Cc: ckoenig.leichtzumerken@gmail.com, gregkh@linuxfoundation.org,
 daniel.vetter@ffwll.ch, amd-gfx@lists.freedesktop.org, helgaas@kernel.org,
 dri-devel@lists.freedesktop.org, linux-pci@vger.kernel.org,
 Alexander.Deucher@amd.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

CgpPbiAyMDIxLTA0LTI5IDEyOjE1IHAubS4sIEZlbGl4IEt1ZWhsaW5nIHdyb3RlOgo+IEFtIDIw
MjEtMDQtMjkgdW0gMTI6MDQgcC5tLiBzY2hyaWViIEFuZHJleSBHcm9kem92c2t5Ogo+PiBTbyBh
cyBJIHVuZGVyc3RhbmQgeW91ciBwcmVmZXJyZWQgYXBwcm9hY2ggaXMgdGhhdCBJIHNjb3BlIGFu
eQo+PiBiYWNrX2VuZCwgSFcgc3BlY2lmaWMgZnVuY3Rpb24gd2l0aCBkcm1fZGV2X2VudGVyL2V4
aXQgYmVjYXVzZSB0aGF0Cj4+IHdoZXJlIE1NSU8KPj4gYWNjZXNzIHRha2VzIHBsYWNlLiBCdXQg
YmVzaWRlcyBleHBsaWNpdCBNTUlPIGFjY2VzcyB0aG9yb3VnaAo+PiByZWdpc3RlciBhY2Nlc3Nv
cnMgaW4gdGhlIEhXIGJhY2stZW5kIHRoZXJlIGlzIGFsc28gaW5kaXJlY3QgTU1JTyBhY2Nlc3MK
Pj4gdGFraW5nIHBsYWNlIHRocm91Z2hvdXQgdGhlIGNvZGUgaW4gdGhlIGRyaXZlciBiZWNhdXNl
IG9mIHZhcmlvdXMgVlJBTQo+PiBCT3Mgd2hpY2ggcHJvdmlkZSBDUFUgYWNjZXNzIHRvIFZSQU0g
dGhyb3VnaCB0aGUgVlJBTSBCQVIuIFRoaXMga2luZCBvZgo+PiBhY2Nlc3MgaXMgc3ByZWFkIGFs
bCBvdmVyIGluIHRoZSBkcml2ZXIgYW5kIGV2ZW4gaW4gbWlkLWxheWVycyBzdWNoIGFzCj4+IFRU
TSBhbmQgbm90IGxpbWl0ZWQgdG8gSFcgYmFjay1lbmQgZnVuY3Rpb25zLiBJdCBtZWFucyBpdCdz
IG11Y2ggaGFyZGVyCj4+IHRvIHNwb3Qgc3VjaCBwbGFjZXMgdG8gc3VyZ2ljYWxseSBzY29wZSB0
aGVtIHdpdGggZHJtX2Rldl9lbnRlci9leGl0IGFuZAo+PiBhbHNvIHRoYXQgYW55IG5ldyBzdWNo
IGNvZGUgaW50cm9kdWNlZCB3aWxsIGltbWVkaWF0ZWx5IGJyZWFrIGhvdCB1bnBsdWcKPj4gYmVj
YXVzZSB0aGUgZGV2ZWxvcGVycyBjYW4ndCBiZSBleHBlY3RlZCB0byByZW1lbWJlciBtYWtpbmcg
dGhlaXIgY29kZQo+PiByb2J1c3QgdG8gdGhpcyBzcGVjaWZpYyB1c2UgY2FzZS4gVGhhdCB3aHkg
d2hlbiB3ZSBkaXNjdXNzZWQgaW50ZXJuYWxseQo+PiB3aGF0IGFwcHJvYWNoIHRvIHRha2UgdG8g
cHJvdGVjdGluZyBjb2RlIHdpdGggZHJtX2Rldl9lbnRlci9leGl0IHdlCj4+IG9wdGVkIGZvciB1
c2luZyB0aGUgd2lkZXN0IGF2YWlsYWJsZSBzY29wZS4KPiAKPiBWUkFNIGNhbiBhbHNvIGJlIG1h
cHBlZCBpbiB1c2VyIG1vZGUuIElzIHRoZXJlIGFueXRoaW5nIHByZXZlbnRpbmcgdXNlcgo+IG1v
ZGUgZnJvbSBhY2Nlc3NpbmcgdGhlIG1lbW9yeSBhZnRlciB1bnBsdWc/IEkgZ3Vlc3MgdGhlIGJl
c3QgeW91IGNvdWxkCj4gZG8gaXMgdW5tYXAgaXQgZnJvbSB0aGUgQ1BVIHBhZ2UgdGFibGUgYW5k
IGxldCB0aGUgYXBwbGljYXRpb24gc2VnZmF1bHQKPiBvbiB0aGUgbmV4dCBhY2Nlc3MuIE9yIHJl
cGxhY2UgdGhlIG1hcHBpbmcgd2l0aCBhIGR1bW15IHBhZ2UgaW4gc3lzdGVtCj4gbWVtb3J5PwoK
V2UgaW5kZWVkIHVubWFwIGJ1dCBpbnN0ZWFkIG9mIGxldHRpbmcgaXQgc2VnZmF1bHQgaW5zZXJ0
IGR1bW15IHBhZ2Ugb24KdGhlIG5leHQgcGFnZSBmYXVsdC4gU2VlIGhlcmUgCmh0dHBzOi8vY2dp
dC5mcmVlZGVza3RvcC5vcmcvfmFncm9kem92L2xpbnV4L2NvbW1pdC8/aD1kcm0tbWlzYy1uZXh0
JmlkPTZkZGUzMzMwZmZhNDUwZTJlNmRhNGQxOWUyZmQwYmI5NGI2NmI2Y2UKQW5kIEkgYW0gYXdh
cmUgdGhhdCB0aGlzIGRvZXNuJ3QgdGFrZSBjYXJlIG9mIEtGRCB1c2VyIG1hcHBpbmcuCkFzIHlv
dSBrbm93LCB3ZSBoYWQgc29tZSBkaXNjdXNzaW9ucyB3aXRoIHlvdSBvbiB0aGlzIHRvcGljIGFu
ZCBpdCdzIG9uCm15IFRPRE8gbGlzdCB0byBmb2xsb3cgdXAgb24gdGhpcyB0byBzb2x2ZSBpdCBm
b3IgS0ZEIHRvby4KCkFuZHJleQoKPiAKPiBSZWdhcmRzLAo+ICDCoCBGZWxpeAo+IAo+IAo+Pgo+
PiBBbmRyZXkKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
ZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0
dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
