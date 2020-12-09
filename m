Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EF552D417B
	for <lists+dri-devel@lfdr.de>; Wed,  9 Dec 2020 12:57:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D09C6EA08;
	Wed,  9 Dec 2020 11:57:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2040.outbound.protection.outlook.com [40.107.220.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2BB166EA08
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Dec 2020 11:57:37 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GmQVMolT7B2LWgVHlmKuUevENzhX4kFsN+PUwpk6BDoZ8Mc47DW1w6UthgooY98OpEcYR4OJd7KWYCIUgBNqvwnl/4Gr6n0shF3QvS9lVNI6dXssayKMTi1E3fJdK3N74t8sSH25qm6CJwzR2CHdbM1XMvISL7RTpGgbz5u3fmoSZAOqZ4O3m+Tu+rh9D6dh73fBDUNpmT7LFpdtjJLEEKN+Nh3y3oPaPQT/dok9aAJSQ5cSOBinI0g6xtm6GAP1Fq7k+0VYXxtq41AVxwcGyowPRxNJFp1OnBNs9FCZI1tAl3K8reqPAHiw/gaGPhhuc7l/KEcpYGqyg2kglY50WQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6INRtafFncptkjnZpIomgPqBDMOfiNTlr5ZEtgfFXJw=;
 b=B2Zm1nD5Nl6aZMnkjd35RuolGX8RvdL2Ub5kcmR5NUza4S/uEwOSUv18d5nMAhIKKwpadKO+tVTv8DVKIPzsWWR541D5fy2EiEd2+d2Qban4pZnJw0cbDI/vtHXsdihVif2V/JiQ7+0brGRTFYaNdY6g20PCWrvBAnOcdA4p8jsQx35QvYcp29EKRSKtvDPtK4qeg5mqOZDP+29uAsaBjkzUIDObPZrVu8W8zLvoZCak45sPCX1J+o+2+r0pu1VUN3SzoJlTpETuPFKDdS1zN6Jh9HCyiIa2KVGRbsrcCyaUTw6X4b2SEivn4fJDTbA6nfa8CHUPpa6nWWRXAjaGLg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6INRtafFncptkjnZpIomgPqBDMOfiNTlr5ZEtgfFXJw=;
 b=GWSMnI8aQX8DcYEj5IylFCMkWqRUbotEA6VX6TGG4po1DeXEBLLHiw6vWjEmqIEM18qUlt9Am1L67lzO6o4cSOjX9UvrhW0lwUh1bwTgk9BfBJWN1wJ42Lu3qTATutqcoUUCc+ZV+v/CG4OuQIia+P/QBYMDn5bOHuQO0JQxQE0=
Authentication-Results: amd.com; dkim=none (message not signed)
 header.d=none;amd.com; dmarc=none action=none header.from=amd.com;
Received: from DM6PR12MB3916.namprd12.prod.outlook.com (2603:10b6:5:1ca::21)
 by DM5PR12MB1131.namprd12.prod.outlook.com (2603:10b6:3:73::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3632.18; Wed, 9 Dec
 2020 11:57:36 +0000
Received: from DM6PR12MB3916.namprd12.prod.outlook.com
 ([fe80::7080:fa49:2223:5f4e]) by DM6PR12MB3916.namprd12.prod.outlook.com
 ([fe80::7080:fa49:2223:5f4e%7]) with mapi id 15.20.3632.023; Wed, 9 Dec 2020
 11:57:36 +0000
Subject: Re: [PATCH v2 1/1] drm/amdgpu: clean up bo in vce and vcn test
To: Nirmoy Das <nirmoy.das@amd.com>, dri-devel@lists.freedesktop.org
References: <20201209115132.98188-1-nirmoy.das@amd.com>
From: Nirmoy <nirmodas@amd.com>
Message-ID: <b6989ff8-72b2-faf5-76f7-a9b97f9286f2@amd.com>
Date: Wed, 9 Dec 2020 12:57:31 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
In-Reply-To: <20201209115132.98188-1-nirmoy.das@amd.com>
Content-Language: en-US
X-Originating-IP: [165.204.84.11]
X-ClientProxiedBy: BN6PR19CA0053.namprd19.prod.outlook.com
 (2603:10b6:404:e3::15) To DM6PR12MB3916.namprd12.prod.outlook.com
 (2603:10b6:5:1ca::21)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [172.31.4.35] (165.204.84.11) by
 BN6PR19CA0053.namprd19.prod.outlook.com (2603:10b6:404:e3::15) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3654.12 via Frontend Transport; Wed, 9 Dec 2020 11:57:34 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 9d15958d-5a24-4e8b-0497-08d89c399e94
X-MS-TrafficTypeDiagnostic: DM5PR12MB1131:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM5PR12MB1131FCAA95EBC9D857B789F68BCC0@DM5PR12MB1131.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5516;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 811JXXT9+By5HOUK9ukvgY2baVK3o1lcb5dQkb7E+R9SLMaHQu3WYBCFsuiroxFIU+c1pWulo0ZpxNJ0lVptOGEFMW9TtiWFcTJtU0YEdpWZByPZ+Ky1qMKwrRkLDz4L01guT92I9A54gyO/jILHv+eJpmekqheMRLR5Nnu3k0/grOlpgnZ/HncIVWR7MN1eSet67POriUv2lLh3IX1nMXEKwrp3n/TnGrS9ourHEsLVzQzGQWig1d+S5Z7Rg0/3fKHSdlrtBrFq5E5kBgoRfNqzDPcO/84L9UJzVGlMvv6utpvn+VavlOkSFmq6N9SLPuyKlY5/fps1wtWJsGNXoW7U1Z7zF0uifzam0xgmqbGusVoXtqKC/90QPIdDfH+xmwRP9kKzyXUqdBgSFGUbp+O0mewSPGic2rYVgAs8qt2tlNzIyl9g4VwhZLHNE0dw
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB3916.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(376002)(366004)(136003)(8936002)(53546011)(36756003)(34490700003)(26005)(52116002)(83380400001)(31696002)(66574015)(4326008)(508600001)(2906002)(186003)(16576012)(6486002)(2616005)(956004)(5660300002)(66946007)(31686004)(66476007)(6666004)(8676002)(16526019)(66556008)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?b1hCMVNkWWFpTTluY2J5SllnNi90YVUrRWxRblhEZlYwOEdXak1JU3gvU0Y0?=
 =?utf-8?B?YVNJenBhQWVnZXVNeDBpcUFVcXl0aGxCMFdsNVRCQzMzZFlXa3VFQ2xhSTNP?=
 =?utf-8?B?WmpObmpFZEJaR000eThnOStRTVEwekZjZ3VTOTJLSUZIRnRaU1RFS2FOb2lV?=
 =?utf-8?B?VGZmMWFoVXl5TFZhWGZnclBDcDdPUms1TVhBWUpzaDdRbzVCVFhsb0VuWDRH?=
 =?utf-8?B?VHcrN0ovcEZQK096WjR1RWdvNjdEZ2J2RmVueTVrSzMwcUdQTjZOSXpWMTlF?=
 =?utf-8?B?WXhtQU9wcyt1ZUQ0bU5hODhtY2hoYjhNdHFFOVp4eWZ0TVlaK0U0dW9IbHFm?=
 =?utf-8?B?UFRTVG04Vm9Ddm5RUEFkaEMxbzh5bVF6Z1A5NVlDWWlLSWdtNzByYU1US3pX?=
 =?utf-8?B?QjlET0lvQS9yMXRNZ3V1Nks1SGE2Q0lGaGRLQkx3cTZ4Y2xsRHNJbktUSTU1?=
 =?utf-8?B?SWlyT1loWXJVTUZVak5xSVU0THRxazJ0WVJBbk5JUmpiY2JyODNUcU9IbU44?=
 =?utf-8?B?VFl3cnFFVCtCWCtHTlZSOXJkNXUwQ2hHaStvSzAvMi9MMDIvVmFJY1VsQStY?=
 =?utf-8?B?ZnVsayt4RGpOT0pxc1N5b0xQMXRnS09lV2hOck9iNmc1TStENzJOc0g3LzQy?=
 =?utf-8?B?b29XaFFVWEttMklMUGp4bFZVQnY2Zmw1VlFPRCswOE9hOGZhV0FaSzFNeGtH?=
 =?utf-8?B?WWpwRzJ4ak9FL0dhaUgvQTFkbE1MMDBJVHd4dnJheHZyWXhMRVFwNFUxTE1K?=
 =?utf-8?B?QmN4UlZqbXlrODZ0cjhKNkJtSU93NkxHVW5mMmpwNXNMdkIzbHk5a3VDbkNj?=
 =?utf-8?B?aGFxaFR1NzBYWlJxSXV0dUZ2T3UyYndjL2hJVmxQS1kwN1JvYmdHUVRwR2ZY?=
 =?utf-8?B?TEtZNHpvdzN6TDNhcVFxY09VN1FsTm1jQmY1OUZRRW5NR1FVVW5rQk81a0dV?=
 =?utf-8?B?NURZUk1hUzU5L3lpMCtHVVl3alVsY25pekJJWnVRUUpvVzc0R01YckViUC85?=
 =?utf-8?B?NHpHTEFMRU0waXo4UEUyaUIwZk9taWZPUEdreWRKWityY1FSODhTOXk5QmUz?=
 =?utf-8?B?RXRkZjlPRFdyWStmNkpPZ1VUT3VXN2pRMEgwYXhCMHZXMkJVVStCK21lRTkv?=
 =?utf-8?B?ODZvVnI1ZWhoYW1WT2p1YTVDMXBjclVMMjFoNUo1bHplOFRubzlUOHRCT3Vs?=
 =?utf-8?B?NjhsNGd0UVNCQ3NheG0xQzJpcDEwTHJRZ3BleEZhR0tYTUR4UEJZOE5SUGFJ?=
 =?utf-8?B?VjVsOEFUNWxxNk80UzljVDh4dmNMTStjQUZMeVhGTkdtY3ZJakVKS3dsdU9y?=
 =?utf-8?Q?1jibnwYeJqbKV0GXVWGddXay5N+NFfLvbT?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB3916.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Dec 2020 11:57:35.9215 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-Network-Message-Id: 9d15958d-5a24-4e8b-0497-08d89c399e94
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PsOE4+tCJ+D/l/ruuJoAK8QYlsE5OL7dlIYxZXyfJZAK7coVsvJZVjHekS88mhDVK9PWG4Hi2vnaCBBiz6BtQg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1131
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
Cc: Christian.Koenig@amd.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgQ2hyaXN0aWFuLAoKCkNhbiB5b3UgcGxlYXNlIHBpY2sgdGhpcyB1cCBmb3IgZHJtLW1pc2Mt
bmV4dD8KCgpUaGFua3MsCgpOaXJtb3kKCk9uIDEyLzkvMjAgMTI6NTEgUE0sIE5pcm1veSBEYXMg
d3JvdGU6Cj4gQk8gY3JlYXRlZCB3aXRoIGFtZGdwdV9ib19jcmVhdGVfcmVzZXJ2ZWQoKSB3YXNu
J3QgY2xlYW4KPiBwcm9wZXJseSBiZWZvcmUsIHdoaWNoIGNhdXNlczoKPgo+IFsgICAyMS4wNTYy
MThdIFdBUk5JTkc6IENQVTogMCBQSUQ6IDcgYXQgZHJpdmVycy9ncHUvZHJtL3R0bS90dG1fYm8u
Yzo1MTggdHRtX2JvX3JlbGVhc2UrMHgyYmYvMHgzMTAgW3R0bV0KPiA8c25pcD4KPiBbICAgMjEu
MDU2NDMwXSBDYWxsIFRyYWNlOgo+IFsgICAyMS4wNTY1MjVdICBhbWRncHVfYm9fdW5yZWYrMHgx
YS8weDMwIFthbWRncHVdCj4gWyAgIDIxLjA1NjYzNV0gIGFtZGdwdV92Y25fZGVjX3NlbmRfbXNn
KzB4MWIyLzB4MjcwIFthbWRncHVdCj4gWyAgIDIxLjA1Njc0MF0gIGFtZGdwdV92Y25fZGVjX2dl
dF9jcmVhdGVfbXNnLmNvbnN0cHJvcC4wKzB4ZDgvMHgxMDAgW2FtZGdwdV0KPiBbICAgMjEuMDU2
ODQzXSAgYW1kZ3B1X3Zjbl9kZWNfcmluZ190ZXN0X2liKzB4MjcvMHgxODAgW2FtZGdwdV0KPiBb
ICAgMjEuMDU2OTM2XSAgYW1kZ3B1X2liX3JpbmdfdGVzdHMrMHhmMS8weDE1MCBbYW1kZ3B1XQo+
IFsgICAyMS4wNTcwMjRdICBhbWRncHVfZGV2aWNlX2RlbGF5ZWRfaW5pdF93b3JrX2hhbmRsZXIr
MHgxMS8weDMwIFthbWRncHVdCj4gWyAgIDIxLjA1NzAzMF0gIHByb2Nlc3Nfb25lX3dvcmsrMHgx
ZGYvMHgzNzAKPiBbICAgMjEuMDU3MDMzXSAgd29ya2VyX3RocmVhZCsweDQ2LzB4MzQwCj4gWyAg
IDIxLjA1NzAzNF0gID8gcHJvY2Vzc19vbmVfd29yaysweDM3MC8weDM3MAo+IFsgICAyMS4wNTcw
MzddICBrdGhyZWFkKzB4MTFiLzB4MTQwCj4gWyAgIDIxLjA1NzAzOV0gID8gX19rdGhyZWFkX2Jp
bmRfbWFzaysweDYwLzB4NjAKPiBbICAgMjEuMDU3MDQzXSAgcmV0X2Zyb21fZm9yaysweDIyLzB4
MzAKPgo+IFNpZ25lZC1vZmYtYnk6IE5pcm1veSBEYXMgPG5pcm1veS5kYXNAYW1kLmNvbT4KPiBS
ZXZpZXdlZC1ieTogQ2hyaXN0aWFuIEvDtm5pZyA8Y2hyaXN0aWFuLmtvZW5pZ0BhbWQuY29tPgo+
IC0tLQo+ICAgZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3ZjZS5jIHwgMiArLQo+
ICAgZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3Zjbi5jIHwgOSArKysrKystLS0K
PiAgIDIgZmlsZXMgY2hhbmdlZCwgNyBpbnNlcnRpb25zKCspLCA0IGRlbGV0aW9ucygtKQo+Cj4g
ZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV92Y2UuYyBiL2Ry
aXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV92Y2UuYwo+IGluZGV4IGVjYWEyZDc0ODNi
Mi4uNzhhNGRkOWJmMTFmIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1
L2FtZGdwdV92Y2UuYwo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV92
Y2UuYwo+IEBAIC0xMTUxLDYgKzExNTEsNiBAQCBpbnQgYW1kZ3B1X3ZjZV9yaW5nX3Rlc3RfaWIo
c3RydWN0IGFtZGdwdV9yaW5nICpyaW5nLCBsb25nIHRpbWVvdXQpCj4gICBlcnJvcjoKPiAgIAlk
bWFfZmVuY2VfcHV0KGZlbmNlKTsKPiAgIAlhbWRncHVfYm9fdW5yZXNlcnZlKGJvKTsKPiAtCWFt
ZGdwdV9ib191bnJlZigmYm8pOwo+ICsJYW1kZ3B1X2JvX2ZyZWVfa2VybmVsKCZibywgTlVMTCwg
TlVMTCk7Cj4gICAJcmV0dXJuIHI7Cj4gICB9Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2Ry
bS9hbWQvYW1kZ3B1L2FtZGdwdV92Y24uYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2Ft
ZGdwdV92Y24uYwo+IGluZGV4IDdlMTlhNjY1NjcxNS4uOTIxYjgxMDU0YzFiIDEwMDY0NAo+IC0t
LSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV92Y24uYwo+ICsrKyBiL2RyaXZl
cnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV92Y24uYwo+IEBAIC00NjUsNiArNDY1LDcgQEAg
c3RhdGljIGludCBhbWRncHVfdmNuX2RlY19zZW5kX21zZyhzdHJ1Y3QgYW1kZ3B1X3JpbmcgKnJp
bmcsCj4gICAJc3RydWN0IGFtZGdwdV9qb2IgKmpvYjsKPiAgIAlzdHJ1Y3QgYW1kZ3B1X2liICpp
YjsKPiAgIAl1aW50NjRfdCBhZGRyOwo+ICsJdm9pZCAqbXNnID0gTlVMTDsKPiAgIAlpbnQgaSwg
cjsKPgo+ICAgCXIgPSBhbWRncHVfam9iX2FsbG9jX3dpdGhfaWIoYWRldiwgNjQsCj4gQEAgLTQ3
NCw2ICs0NzUsNyBAQCBzdGF0aWMgaW50IGFtZGdwdV92Y25fZGVjX3NlbmRfbXNnKHN0cnVjdCBh
bWRncHVfcmluZyAqcmluZywKPgo+ICAgCWliID0gJmpvYi0+aWJzWzBdOwo+ICAgCWFkZHIgPSBh
bWRncHVfYm9fZ3B1X29mZnNldChibyk7Cj4gKwltc2cgPSBhbWRncHVfYm9fa3B0cihibyk7Cj4g
ICAJaWItPnB0clswXSA9IFBBQ0tFVDAoYWRldi0+dmNuLmludGVybmFsLmRhdGEwLCAwKTsKPiAg
IAlpYi0+cHRyWzFdID0gYWRkcjsKPiAgIAlpYi0+cHRyWzJdID0gUEFDS0VUMChhZGV2LT52Y24u
aW50ZXJuYWwuZGF0YTEsIDApOwo+IEBAIC00OTIsNyArNDk0LDcgQEAgc3RhdGljIGludCBhbWRn
cHVfdmNuX2RlY19zZW5kX21zZyhzdHJ1Y3QgYW1kZ3B1X3JpbmcgKnJpbmcsCj4KPiAgIAlhbWRn
cHVfYm9fZmVuY2UoYm8sIGYsIGZhbHNlKTsKPiAgIAlhbWRncHVfYm9fdW5yZXNlcnZlKGJvKTsK
PiAtCWFtZGdwdV9ib191bnJlZigmYm8pOwo+ICsJYW1kZ3B1X2JvX2ZyZWVfa2VybmVsKCZibywg
TlVMTCwgKHZvaWQgKiopJm1zZyk7Cj4KPiAgIAlpZiAoZmVuY2UpCj4gICAJCSpmZW5jZSA9IGRt
YV9mZW5jZV9nZXQoZik7Cj4gQEAgLTUwNSw3ICs1MDcsNyBAQCBzdGF0aWMgaW50IGFtZGdwdV92
Y25fZGVjX3NlbmRfbXNnKHN0cnVjdCBhbWRncHVfcmluZyAqcmluZywKPgo+ICAgZXJyOgo+ICAg
CWFtZGdwdV9ib191bnJlc2VydmUoYm8pOwo+IC0JYW1kZ3B1X2JvX3VucmVmKCZibyk7Cj4gKwlh
bWRncHVfYm9fZnJlZV9rZXJuZWwoJmJvLCBOVUxMLCAodm9pZCAqKikmbXNnKTsKPiAgIAlyZXR1
cm4gcjsKPiAgIH0KPgo+IEBAIC03NjEsNiArNzYzLDcgQEAgaW50IGFtZGdwdV92Y25fZW5jX3Jp
bmdfdGVzdF9pYihzdHJ1Y3QgYW1kZ3B1X3JpbmcgKnJpbmcsIGxvbmcgdGltZW91dCkKPiAgIGVy
cm9yOgo+ICAgCWRtYV9mZW5jZV9wdXQoZmVuY2UpOwo+ICAgCWFtZGdwdV9ib191bnJlc2VydmUo
Ym8pOwo+IC0JYW1kZ3B1X2JvX3VucmVmKCZibyk7Cj4gKwlhbWRncHVfYm9fZnJlZV9rZXJuZWwo
JmJvLCBOVUxMLCBOVUxMKTsKPiArCj4gICAJcmV0dXJuIHI7Cj4gICB9Cj4gLS0KPiAyLjI5LjIK
PgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2
ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9s
aXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
