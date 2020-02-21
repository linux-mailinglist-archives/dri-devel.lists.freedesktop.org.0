Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 65446167C20
	for <lists+dri-devel@lfdr.de>; Fri, 21 Feb 2020 12:29:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD2596E279;
	Fri, 21 Feb 2020 11:29:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2060e.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7eaa::60e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 19BAB6E279
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Feb 2020 11:29:43 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JwBY/9FkCF8MwYYFKkT8DkxzKIoS3r+kVg5/Do4nE6zYtv/JNx/dsZmYDYst95vAK1C3hthj9VRiX8GciSPcAAwUujpWny6OntLQAv5YT3KEB+h60uIQmRWkcrYnvsqNZdAS4SbXdki0rhB6X4M/3lt4+6MXYGHdvOIHtfQshl/AZX8TSoLbnghd3ePLdu0100/L2dTBcYhWM4mblMyFpXYyanWiTdv0Lpe6VjIAqrH/+gKGzDlt83AGq6dZCzl5dqB6hejYWVqHetRm+OAJtTDV6J+KdZh98gNEWAladm6/i95D+s65XYhswm2N8KZYAHkd96LD7ejznLQZsZAdCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Hmt3vGrvGSFBcS+czkJxzgHKanOIplS1C5cTPOff40k=;
 b=GZQcrmiuTXJdV71oAa0hmIJmyOBt++mBy3I1SM3P0NcP01wtlkJDm9tVNM+MUhSfDGT8LLx6JQuJh2fV9RX7CjE/UnxlqkyK9jdjdVScOTY8BEtOFYvXyvkoAwJ0Z4zNEaqUYLgkdjP038wf5De85pep8AEkLIiNbVoU4OD2zsa2LmJ9RMxI5KesPbmH0Wr3qY05BbUvjjmyUapNplzlsH+k+Zd2N5M72ctlviEJax0YkImRUTq+Q5qGXZrXMtylV5TsiYP/Id6KQhn/hFGv3zazdJ7bzaIjZMVtFNcGvMdHvwZWVnCK5Cu2PxoRDscJTBUnC90qVYAjDchPKetitg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Hmt3vGrvGSFBcS+czkJxzgHKanOIplS1C5cTPOff40k=;
 b=13dBOwPwQWoe/8BDWj/sk4Ndxwe+c/Nxj5Gocx/EX3muvOVFZFVP6tEwvuGGuYds6kfjXZnmzPbVzWNoTkBmwG5O6IZ7B5KAZIEuoY/ssqpuY+o0mdGJwHPL478qopuAoHtRJPiCAqR0Xs1DXn9+je5sDg7i7fEP8Yf/ZXy0neA=
Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Nirmoy.Das@amd.com; 
Received: from DM5PR12MB2376.namprd12.prod.outlook.com (2603:10b6:4:b9::11) by
 DM5PR12MB1546.namprd12.prod.outlook.com (2603:10b6:4:8::23) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2750.17; Fri, 21 Feb 2020 11:29:42 +0000
Received: from DM5PR12MB2376.namprd12.prod.outlook.com
 ([fe80::ac12:6413:cd14:4904]) by DM5PR12MB2376.namprd12.prod.outlook.com
 ([fe80::ac12:6413:cd14:4904%4]) with mapi id 15.20.2750.021; Fri, 21 Feb 2020
 11:29:42 +0000
Subject: Re: [PATCH v3 0/8] do not store GPU address in TTM
To: dri-devel@lists.freedesktop.org
References: <20200219135322.56463-1-nirmoy.das@amd.com>
 <b3b7511f-34f3-521c-ebdb-b5f002ab80ab@shipmail.org>
From: Nirmoy <nirmodas@amd.com>
Message-ID: <dccf9199-9ed1-4fc5-e7d6-af9473de8130@amd.com>
Date: Fri, 21 Feb 2020 12:32:36 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
In-Reply-To: <b3b7511f-34f3-521c-ebdb-b5f002ab80ab@shipmail.org>
Content-Language: en-US
X-ClientProxiedBy: AM4PR08CA0059.eurprd08.prod.outlook.com
 (2603:10a6:205:2::30) To DM5PR12MB2376.namprd12.prod.outlook.com
 (2603:10b6:4:b9::11)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2003:c5:8f29:2d00:c87d:54e8:39bb:eb0f]
 (2003:c5:8f29:2d00:c87d:54e8:39bb:eb0f) by
 AM4PR08CA0059.eurprd08.prod.outlook.com (2603:10a6:205:2::30) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2750.18 via Frontend Transport; Fri, 21 Feb 2020 11:29:41 +0000
X-Originating-IP: [2003:c5:8f29:2d00:c87d:54e8:39bb:eb0f]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: f6bf2dbb-cbe4-499e-e2af-08d7b6c15862
X-MS-TrafficTypeDiagnostic: DM5PR12MB1546:
X-Microsoft-Antispam-PRVS: <DM5PR12MB1546C9905FBBB14FDD0DBB858B120@DM5PR12MB1546.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6108;
X-Forefront-PRVS: 0320B28BE1
X-Forefront-Antispam-Report: SFV:NSPM;
 SFS:(10009020)(4636009)(346002)(396003)(376002)(136003)(366004)(39860400002)(189003)(199004)(81156014)(81166006)(6666004)(4326008)(31696002)(8676002)(66556008)(8936002)(66476007)(316002)(478600001)(6916009)(4744005)(31686004)(966005)(16526019)(6486002)(186003)(36756003)(2906002)(5660300002)(52116002)(2616005)(45080400002)(66946007)(66574012)(53546011);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR12MB1546;
 H:DM5PR12MB2376.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Rn2zTkI+AfqaXpCV3mREiP+SewZr9xKOymCOOSjU6XlkDPZS73ErgsnEy54KuiRSFAiv/rkxXyqZb4egG26LLdEFRNHNVYL21jWMjb82F1bscbHLPDdXg5dQnZ1yrvFQOXx2cQ7pVRJPC4cq3fAEknK+/GCZKyDX44812HoHhQQk8KAeadn/lAIXpzFVHnNgJXHTkEeWbG/AXTyZBcUEOaGdHGbRyyWeGQzvM/o0SFvgFqwalIIa+uWy5r6pHeVnk5piGfBxA7wBRP/OGyGAPrsg5+eJCcQsQ6cbIkxSnWKYYiGRlct+j5xFXDUm2g4arpnOLRvJ3H2Mc8Lo8Ouh5xLPNuwzLTlu3ablIjHC/54V7I4v76/BBSHyjPYZ0i9jZhGD6nQJws+66NFvzy6hrkN2Mc0SID2K0oiDhKPZX2/FeOoPj1cNzAszDk+KFsXP4RfLWs/OubiGhKPfBJ8xOjjK/qDu+V1lxYt/p3JAftdzzVi7FBhnhGyctvMg5pXSRiInfrvRGL6SvNDu3cSx+A==
X-MS-Exchange-AntiSpam-MessageData: TCVYO5L18un+o7J8/l974sxqxJYZJQSnnQXcwecGJo/exO0mj2CZ2dEP0Nn1rnX6mT4UarElO+pNBMn2GLMuzaX5F1wPIvV77z4oBQd0idP2EW3HQh7elF8lNxAwmcV04JT9k+8uD2k0byB2l99QpTF/ZzVkFk97w5pNKGOt9YjPIHuD1UGv/2GAOhnV+HX+Ujq0O33jM3CUgjobsPRq5A==
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f6bf2dbb-cbe4-499e-e2af-08d7b6c15862
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Feb 2020 11:29:42.5912 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GmZ2zZfwgCxRNTD4W6KS8p3axNOb6Dq+DoMk54rpci2NFhijyBZX8zar3/ebnvA492dzQgfvX66w5v+S0+0U8A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1546
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
Cc: Thomas Hellstrom <thellstrom@vmware.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Ck9uIDIvMjEvMjAgOTo0OCBBTSwgVGhvbWFzIEhlbGxzdHLDtm0gKFZNd2FyZSkgd3JvdGU6Cj4g
SGksCj4KPiBPbiAyLzE5LzIwIDI6NTMgUE0sIE5pcm1veSBEYXMgd3JvdGU6Cj4+IFdpdGggdGhp
cyBwYXRjaCBzZXJpZXMgSSBhbSB0cnlpbmcgdG8gcmVtb3ZlIEdQVSBhZGRyZXNzIGRlcGVuZGVu
Y3kgaW4KPj4gVFRNIGFuZCBtb3ZpbmcgR1BVIGFkZHJlc3MgY2FsY3VsYXRpb24gdG8gaW5kaXZp
ZHVhbCBkcm0gZHJpdmVycy4KPgo+IEZvciBmdXR1cmUgcmVmZXJlbmNlLCBjb3VsZCB5b3UgcGxl
YXNlIGFkZCBhIG1vdGl2YXRpb24gZm9yIHRoZSBzZXJpZXM/Cj4gZm9yIGV4YW1wbGUgY2xlYW51
cCwgbmVlZGVkIGJlY2F1c2UsIHNpbXBsaWZpZXMuLi4gZXRjLgoKSSB3aWxsIGFkZCBtb3JlIGRl
dGFpbHMgaW4gbXkgbmV4dCB2ZXJzaW9uIGZvciB0aGlzIHNlcmllcy4KClRoYW5rcyBmb3IgeW91
ciByZXZpZXcsCgpOaXJtb3kKCj4KPiBUaGFua3MsCj4KPiBUaG9tYXMKPgo+Cj4gX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPiBkcmktZGV2ZWwgbWFpbGlu
ZyBsaXN0Cj4gZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwo+IGh0dHBzOi8vbmFtMTEu
c2FmZWxpbmtzLnByb3RlY3Rpb24ub3V0bG9vay5jb20vP3VybD1odHRwcyUzQSUyRiUyRmxpc3Rz
LmZyZWVkZXNrdG9wLm9yZyUyRm1haWxtYW4lMkZsaXN0aW5mbyUyRmRyaS1kZXZlbCZhbXA7ZGF0
YT0wMiU3QzAxJTdDbmlybW95LmRhcyU0MGFtZC5jb20lN0NkY2FiYjY1NTNjODA0NzJiOWE5OTA4
ZDdiNmFhYzk4NiU3QzNkZDg5NjFmZTQ4ODRlNjA4ZTExYTgyZDk5NGUxODNkJTdDMCU3QzAlN0M2
MzcxNzg3MTY5NzI0OTAyNzgmYW1wO3NkYXRhPWJyVVA1bUtQYW82WFFieHk5akFSY1hxQUkxZW54
SlJZa3FJaiUyRjN4eTQlMkJNJTNEJmFtcDtyZXNlcnZlZD0wIAo+Cl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJp
LWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
