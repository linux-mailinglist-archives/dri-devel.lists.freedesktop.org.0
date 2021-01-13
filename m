Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F2A102F466E
	for <lists+dri-devel@lfdr.de>; Wed, 13 Jan 2021 09:25:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 15E1F89AB5;
	Wed, 13 Jan 2021 08:25:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2065.outbound.protection.outlook.com [40.107.92.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E33789AB5
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Jan 2021 08:25:44 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=T4k7GE7HRpDtawONEaMXbik9spmbMyR4ueKUwkIdf/RpzG3IzBqlvLl2hMNpt8WHgnOxVMKN8rm1j1bkx3Z7qT90t1DGxguNAHfv+3sPiPk8ji/B4l6LhIuweaBcJjvUqCRYorUjUM8g9hDAonbjHyE230Z1BCDds762v9DSQ7ZZe/NDWTxYI9AUCwL+YNzBIDbgHQKz6hxb62ZJA/NrfqT3XkG2azi4NP5vIbJRt8Q+PNflYEZBmwhQUjrDaNwobLJvMKu1u59uxyC550X66LaGqoYimzmiFryGZJB0u36FKNtRqnNcX3vc2bFSZQ3UW5qIFhKB+hZD3ZJqKaEwzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PRFC0lLMK7lqMd2SVZlqGAUU231yurNUx//FaU9vSR0=;
 b=G7FZeW9Yyv50x9IWxuOKyptA4aBZNTVghrJMSGKm++2LpQp+ssn2NcqZC9BFt71sAGSJiBaCv6jjCF80kOw2Ti377Eu6Tx15+p5ZcvGo83lr81FnIRCPjlp14sGQt7YdjUwmUGNr7A/2e4XZHgVxDF1Llx1vUhgyBB4WTtqmwJ0UaeDK3W0N/TjtzdGWGUeJw30GNgb/RRVD6d5V8QhmUZH11zR++qJomQc952Sp1pUw+HbWMnOJ24p5VGREbe+8O24iqDBCQw3vfqYdqTwKXty+1hE9Drb1vc82ktTJnJb8fJGTJANC4uf9Tx1x8CfiiX9BC7VRjH5R6CNK6VTxeQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PRFC0lLMK7lqMd2SVZlqGAUU231yurNUx//FaU9vSR0=;
 b=cDNtxbD9Sr8WBg0Pzk3Xv4+LGOF4r8tzPHrUHy1CCZ+eAOMeelnYtegVcdAI9fOeTdbQdhPjlTNG2MWcnwWz2Ll28+jmxMqjbG2Y8R+Ne+Vt1DnOGPXEEl4KYhyNDENXdWLMBC06asdMSE06iFfQOREaS7yQqWSqnCyh5eysDWI=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by BL0PR12MB4962.namprd12.prod.outlook.com (2603:10b6:208:17e::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3763.9; Wed, 13 Jan
 2021 08:25:42 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::44f:9f01:ece7:f0e5]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::44f:9f01:ece7:f0e5%3]) with mapi id 15.20.3742.012; Wed, 13 Jan 2021
 08:25:41 +0000
Subject: Re: [PATCH 5.11 regression fix] drm/ttm: fix combining __GFP_HIGHMEM
 and __GFP_DMA32 flag for DMA32 pools
To: Hans de Goede <hdegoede@redhat.com>, Huang Rui <ray.huang@amd.com>,
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@linux.ie>
References: <20210112183249.437759-1-hdegoede@redhat.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <2711188c-c6c8-edd2-d77d-21ae68f119fc@amd.com>
Date: Wed, 13 Jan 2021 09:25:22 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <20210112183249.437759-1-hdegoede@redhat.com>
Content-Language: en-US
X-Originating-IP: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
X-ClientProxiedBy: AM4PR0101CA0062.eurprd01.prod.exchangelabs.com
 (2603:10a6:200:41::30) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
 (2a02:908:1252:fb60:be8a:bd56:1f94:86e7) by
 AM4PR0101CA0062.eurprd01.prod.exchangelabs.com (2603:10a6:200:41::30) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3763.10 via Frontend
 Transport; Wed, 13 Jan 2021 08:25:39 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 6ea44992-ca67-4ba5-cf66-08d8b79cd0da
X-MS-TrafficTypeDiagnostic: BL0PR12MB4962:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BL0PR12MB49628495D089CBD5FC3FE41A83A90@BL0PR12MB4962.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6430;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: EGKkD8fc78OXHeMg7UkqMx25+IYtGu33HIrubCNiB6+P2kcR1z4oVDmN0l/5t7/urzxQvVFhh+HZvIjygN93EJQVCl/Cj36mB8bfVILL/l1EcdQzSzmzNEt20QrhR0Uco8q31C3jKKmfO37THYvob14lWc+giCGR+s0nsxrvhbD4kwqoOCjvBegJOwaegDuGKeLBqxjpUxJw2LEPtp2o/b2L5QoQKR5qgTBVy0kp/d/QHJQnkEmDWDhoE0XOP7KPhi//kJqTZwNNy/oXuYlV0Pivac7+SG2042is6BvUZTGDlCguPVYvjXEerneYKWc3IXHG1veW7rn/9IYGZzItYK8lQcNQY7voI7NyNckjBLQqOqkV1prmsqUPJANV8Z9/nvdZTgbESuu0A4VhrohRuU6aWuPUxUxwq6Sb8Pzb384E476Ro3pGAZDzqe74pvPR
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39860400002)(396003)(136003)(366004)(376002)(346002)(45080400002)(8676002)(36756003)(31696002)(83380400001)(6486002)(8936002)(478600001)(110136005)(66556008)(66476007)(2616005)(2906002)(16526019)(31686004)(86362001)(4326008)(316002)(5660300002)(186003)(52116002)(66946007)(66574015)(6666004)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?a3FwSzMxMTNwRWZyTVFvbzlZU3hvd3hWMUpBUHVJdG9vUkp5V240amJFMFhr?=
 =?utf-8?B?MnBZT2pDUmNIOC9Mby9TTUtWa3BNaFQwUlZleFovd3I2L3EzaU41TVRUYzJa?=
 =?utf-8?B?Ull3VlBjZE1TUTZJNXJidW5Jbi80REZiZHh2TDlZYTlHTFk2ZFZuKzZZQVdm?=
 =?utf-8?B?S21zNzNtT2NiaFd3amRrZmNlaUhiU29ndTI1NFdIYzVvazdod29Qa2JaUkVT?=
 =?utf-8?B?MTBnejNsTmxROFdCcndtUi9sVzBCMVZ0TFRHT0tkMnpaVEx3aU9WTWx5K3Zy?=
 =?utf-8?B?cm8xSjNPNXozMlJlbmpUcnFnamFmc3dRV3dRSStZQ1E0N3JhS0lvNkZyNXBE?=
 =?utf-8?B?ZmNKbW9WMnZpczZZci9SeWdjVCt6WmE1Y3BKaGZwblFvdHNXUXgxY1ZoYm55?=
 =?utf-8?B?ZXJreTFmVlZMelE5NktIK05IRVMrWmNUOGw0bENvOURkaEhCVnBqS2xONUdR?=
 =?utf-8?B?Q1A2Qys2c0FuYkpOcUxJbFdYbTFiUWRIZTdmUHFDNWdpY1VHTllUdWFGZGZo?=
 =?utf-8?B?L0paYlFpUHNOaE92WUJKSGtwSmRBZ0ZjNU9TMVlJWHdrcEZ3V3JZNVg1V0l0?=
 =?utf-8?B?akUveldHQVptTHBkblFmZVlrNnVGME00R0I1VTJ6SDFweVRQWUo1TFp2TkZV?=
 =?utf-8?B?RitBZ2Evbkp6ZFFWQnZEVDJYUzFtRnZPa1V3NkN6eGNDUDNXU0FPbkZaeTFm?=
 =?utf-8?B?V1I3M1dPYTYxcDAwTkpKYVRyZmhDRFg0MmphaTFrWEZLdDFCN29jYy81S0Nt?=
 =?utf-8?B?WkFJVHZHVWlnNEVKdERwY2xoYVdPdS9WZk02Z2hOL0V4UlRlcWhtc2pPMHps?=
 =?utf-8?B?MUtBYW5TWnhPazBucmwxaXVVZUNBWnFOTmMxVXRodU8vbFZSWHoxUmg4YWRX?=
 =?utf-8?B?MWQ3OEQ3QmFSTEpxTVlOVUhEam43RjdwZ2NIaTRoRjBQVXdlcVJKN1g2bXoy?=
 =?utf-8?B?cDd2a3hWVjlkZTRGUDh2WFJDcitZVmcrRkhoakJWbEtsSVJyajZ4UEhTdmp5?=
 =?utf-8?B?dVpPQ3puV0UyY28rRGNtdWpyaHVwbm9pUnBhTXpSczQ1TEtBenljOXBVcmtV?=
 =?utf-8?B?TDZ0NlpST1VhNjRJeFJpbGZoT1ZNd0Ivc3J4b0dyS2MwbmhPcFVFNjIxeWE1?=
 =?utf-8?B?NEFrWUNxYllYY3BGTkdTMmhEblpZa1FYK3J5WXlJak9oeUJVOUcvK0JHUW1I?=
 =?utf-8?B?RVc5YlNRSDVEM2d3bnhCNGdBdXVLVzQ4dC9USStqbjZlMjRjRTZQL204ZCtB?=
 =?utf-8?B?eUtZUEV0YlFUaUc4K2lrQlozemF1aDhPaEpBSjRWWmJSSHo2WE5sSkJCVCtq?=
 =?utf-8?B?RHNudU1NWFBFTmR4MTh4aUtPUFBPL3F6ZHZja0xSeFdwanFyMHhvQnRZL1Fy?=
 =?utf-8?B?Z3p5OWg1MVkwUXNlZlV3UGM1aWhNd3NhOHJXM1Jzeis1ZzJ5dmZCRmUycnFY?=
 =?utf-8?Q?mzyBd8VF?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jan 2021 08:25:41.7178 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-Network-Message-Id: 6ea44992-ca67-4ba5-cf66-08d8b79cd0da
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7fOepApruPY15mWZlvmJOpxSQJmSHMUl6alxVE3j8XobTYva5vPlwdmmZjTiYxYd
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR12MB4962
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
Cc: dri-devel@lists.freedesktop.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgSGFucywKCkFtIDEyLjAxLjIxIHVtIDE5OjMyIHNjaHJpZWIgSGFucyBkZSBHb2VkZToKPiBH
RlBfVFJBTlNIVUdFX0xJR0hUIGluY2x1ZGVzIF9fR0ZQX0hJR0hNRU0gYW5kIGNvbWJpbmluZwo+
IF9fR0ZQX0hJR0hNRU0gd2l0aCBfX0dGUF9ETUEzMiBpcyBub3QgYWxsb3dlZC4KPgo+IFNvIHdl
IG11c3Qgbm90IHNldCBhZGQgR0ZQX1RSQU5TSFVHRV9MSUdIVCB0byB0aGUgZ2ZwX2ZsYWdzIHdo
ZW4KPiBhbGxvY2F0aW5nIHBhZ2VzIGZyb20gYSBkbWEzMiBwb29sLgoKVGhpcyB3b24ndCB3b3Jr
IHNpbmNlIHdlIHN0aWxsIG5lZWQgdGhlIF9fR0ZQX05PTUVNQUxMT0MgZmxhZy4KCkkgd2lsbCBn
byBhaGVhZCBhbmQganVzdCByZXBsYWNlIHRoZSB1c2FnZSBvZiBHRlBfVFJBTlNIVUdFX0xJR0hU
IHdpdGggCnRoZSByZWFsIGZsYWdzIHdlIG5lZWQuCgpUaGFua3MgZm9yIHRoZSByZXBvcnQsCkNo
cmlzdGlhbi4KCj4KPiBUaGlzIGZpeGVzIHRoZSBmb2xsb3dpbmcgb29wcyB3aGVuIHVzaW5nIGEg
ZHJpdmVyIHdoaWNoIHVzZXMgRE1BMzIKPiBwb29scyBzdWNoIGFzIHRoZSB2Ym94dmlkZW8gZHJp
dmVyOgo+Cj4gWyAgNDE5Ljg1MjE5NF0gLS0tLS0tLS0tLS0tWyBjdXQgaGVyZSBdLS0tLS0tLS0t
LS0tCj4gWyAgNDE5Ljg1MjIwMF0ga2VybmVsIEJVRyBhdCBpbmNsdWRlL2xpbnV4L2dmcC5oOjQ1
NyEKPiBbICA0MTkuODUyMjA4XSBpbnZhbGlkIG9wY29kZTogMDAwMCBbIzRdIFNNUCBQVEkKPiBb
ICA0MTkuODUyMjEyXSBDUFU6IDAgUElEOiAxNTIyIENvbW06IFhvcmcgVGFpbnRlZDogRyAgICAg
IEQgICAgICAgICAgIDUuMTEuMC1yYzIrICMxODcKPiBbICA0MTkuODUyMjE0XSBIYXJkd2FyZSBu
YW1lOiBpbm5vdGVrIEdtYkggVmlydHVhbEJveC9WaXJ0dWFsQm94LCBCSU9TIFZpcnR1YWxCb3gg
MTIvMDEvMjAwNgo+IFsgIDQxOS44NTIyMTZdIFJJUDogMDAxMDpfX2FsbG9jX3BhZ2VzX25vZGVt
YXNrKzB4MzFhLzB4M2QwCj4gWyAgNDE5Ljg1MjIyMl0gQ29kZTogMDAgMDAgOGIgMDUgYTggM2Ig
OTMgMDEgODUgYzAgMGYgODUgMDMgZmUgZmYgZmYgODkgZTggNDQgODkgZmEgYzEgZTggMDMgODAg
Y2EgODAgODMgZTAgMDMgODMgZjggMDEgNDQgMGYgNDQgZmEgZTkgZTkgZmQgZmYgZmYgPDBmPiAw
YiAwZiAwYiBlOSA3OSBmZCBmZiBmZiAzMSBjMCBlOSA4OCBmZCBmZiBmZiBlOCA0MSBhZCBmYiBm
ZiA0OAo+IFsgIDQxOS44NTIyMjRdIFJTUDogMDAwMDpmZmZmYjExNjQwOTZiYzYwIEVGTEFHUzog
MDAwMTAyNDcKPiBbICA0MTkuODUyMjI3XSBSQVg6IDAwMDAwMDAwMDAwMDAwMDAgUkJYOiAwMDAw
MDAwMDAwMDAwMDAwIFJDWDogMDAwMDAwMDAwMDAwZThlOAo+IFsgIDQxOS44NTIyMjldIFJEWDog
MDAwMDAwMDAwMDAwMDAwMCBSU0k6IDAwMDAwMDAwMDAwMDAwMDYgUkRJOiAwMDAwMDAwMDAwMTky
ZGM2Cj4gWyAgNDE5Ljg1MjIzMF0gUkJQOiAwMDAwMDAwMDAwMTkyZGM2IFIwODogMDAwMDAwMDAw
MDAwMDAwMCBSMDk6IDAwMDAwMDAwMDAwMDAwMDAKPiBbICA0MTkuODUyMjMyXSBSMTA6IDAwMDAw
MDAwMDAwMDAwMTcgUjExOiAwMDAwN2ZmMzAzZDBhMDAwIFIxMjogMDAwMDAwMDAwMDAwMDAwOQo+
IFsgIDQxOS44NTIyMzNdIFIxMzogMDAwMDAwMDAwMDAwMDAwOSBSMTQ6IGZmZmY4YmU0Y2FmZTA4
ODAgUjE1OiBmZmZmOGJlNWMyNmZlMDAwCj4gWyAgNDE5Ljg1MjIzNV0gRlM6ICAwMDAwN2ZmMzA0
NmUwZjAwKDAwMDApIEdTOmZmZmY4YmU1ZGJjMDAwMDAoMDAwMCkga25sR1M6MDAwMDAwMDAwMDAw
MDAwMAo+IFsgIDQxOS44NTIyMzddIENTOiAgMDAxMCBEUzogMDAwMCBFUzogMDAwMCBDUjA6IDAw
MDAwMDAwODAwNTAwMzMKPiBbICA0MTkuODUyMjM5XSBDUjI6IDAwMDA3ZmYzMDNkMGEwMDAgQ1Iz
OiAwMDAwMDAwMDBhZmQ4MDA0IENSNDogMDAwMDAwMDAwMDA3MDZmMAo+IFsgIDQxOS44NTIyNDNd
IERSMDogMDAwMDAwMDAwMDAwMDAwMCBEUjE6IDAwMDAwMDAwMDAwMDAwMDAgRFIyOiAwMDAwMDAw
MDAwMDAwMDAwCj4gWyAgNDE5Ljg1MjI0NF0gRFIzOiAwMDAwMDAwMDAwMDAwMDAwIERSNjogMDAw
MDAwMDBmZmZlMGZmMCBEUjc6IDAwMDAwMDAwMDAwMDA0MDAKPiBbICA0MTkuODUyMjQ2XSBDYWxs
IFRyYWNlOgo+IFsgIDQxOS44NTIyNTJdICB0dG1fcG9vbF9hbGxvYysweDJlOC8weDVmMCBbdHRt
XQo+IFsgIDQxOS44NTIyNjFdICB0dG1fdHRfcG9wdWxhdGUrMHg5Zi8weGUwIFt0dG1dCj4gWyAg
NDE5Ljg1MjI2N10gIHR0bV9ib192bV9mYXVsdF9yZXNlcnZlZCsweDIzNi8weDZlMCBbdHRtXQo+
IFsgIDQxOS44NTIyNzRdICB0dG1fYm9fdm1fZmF1bHQrMHg0YS8weGUwIFt0dG1dCj4gWyAgNDE5
Ljg1MjI3OV0gIF9fZG9fZmF1bHQrMHgzNy8weDExMAo+IFsgIDQxOS44NTIyODNdICBoYW5kbGVf
bW1fZmF1bHQrMHgxNDkzLzB4MTk5MAo+IFsgIDQxOS44NTIyODhdICBkb191c2VyX2FkZHJfZmF1
bHQrMHgxYzcvMHg0YzAKPiBbICA0MTkuODUyMjkyXSAgZXhjX3BhZ2VfZmF1bHQrMHg2Ny8weDI1
MAo+IFsgIDQxOS44NTIyOTVdICA/IGFzbV9leGNfcGFnZV9mYXVsdCsweDgvMHgzMAo+IFsgIDQx
OS44NTIyOTldICBhc21fZXhjX3BhZ2VfZmF1bHQrMHgxZS8weDMwCj4gWyAgNDE5Ljg1MjMwMV0g
UklQOiAwMDMzOjB4N2ZmMzA0ZjNjZGY4Cj4gWyAgNDE5Ljg1MjMwNF0gQ29kZTogODMgYzAgMDQg
ODMgZmEgMDMgN2UgZWEgYTggMGYgNzUgZWUgODMgZmEgN2YgN2UgZTEgODMgYzIgODAgODkgZDYg
YzEgZWUgMDcgOGQgNGUgMDEgNDggYzEgZTEgMDcgNDggMDEgYzEgMGYgMWYgODAgMDAgMDAgMDAg
MDAgPDBmPiAyOSAwMCA0OCA4MyBlOCA4MCAwZiAyOSA0MCA5MCAwZiAyOSA0MCBhMCAwZiAyOSA0
MCBiMCAwZiAyOSA0MAo+IFsgIDQxOS44NTIzMDZdIFJTUDogMDAyYjowMDAwN2ZmZWMzNjBlN2Q4
IEVGTEFHUzogMDAwMTAyMDYKPiBbICA0MTkuODUyMzA4XSBSQVg6IDAwMDA3ZmYzMDNkMGEwMDAg
UkJYOiAwMDAwMDAwMDAwMDAwMmUyIFJDWDogMDAwMDdmZjMwM2QwYjMwMAo+IFsgIDQxOS44NTIz
MDldIFJEWDogMDAwMDAwMDAwMDAwMTJjMCBSU0k6IDAwMDAwMDAwMDAwMDAwMjUgUkRJOiAwMDAw
MDAwMDAwMDAwMDAwCj4gWyAgNDE5Ljg1MjMxMV0gUkJQOiAwMDAwMDAwMDAwMDAxMzQwIFIwODog
MDAwMDAwMDAwMDAwMDAwMCBSMDk6IDAwMDAwMDAwMDAwMDAwMDAKPiBbICA0MTkuODUyMzEyXSBS
MTA6IDAwMDA3ZmYzMDNkMGEwMDAgUjExOiAwMDAwMDAwMDAwMDAxMzQwIFIxMjogMDAwMDdmZjMw
M2QwYTAwMAo+IFsgIDQxOS44NTIzMTNdIFIxMzogMDAwMDU1NjY2NWYxZWIzMCBSMTQ6IDAwMDAw
MDAwMDAwMDAwMDAgUjE1OiAwMDAwMDAwMDAwMDAwMDAwCj4gWyAgNDE5Ljg1MjMxOF0gTW9kdWxl
cyBsaW5rZWQgaW46IHh0X0NIRUNLU1VNIHh0X01BU1FVRVJBREUgeHRfY29ubnRyYWNrIGlwdF9S
RUpFQ1QgbmZfbmF0X3RmdHAgbmZfY29ubnRyYWNrX3RmdHAgdHVuIGJyaWRnZSBzdHAgbGxjIG5m
dF9vYmpyZWYgbmZfY29ubnRyYWNrX25ldGJpb3NfbnMgbmZfY29ubnRyYWNrX2Jyb2FkY2FzdCBu
ZnRfZmliX2luZXQgbmZ0X2ZpYl9pcHY0IG5mdF9maWJfaXB2NiBuZnRfZmliIG5mdF9yZWplY3Rf
aW5ldCBuZl9yZWplY3RfaXB2NCBuZl9yZWplY3RfaXB2NiBuZnRfcmVqZWN0IG5mdF9jdCBuZnRf
Y2hhaW5fbmF0IHJma2lsbCBpcDZ0YWJsZV9uYXQgaXA2dGFibGVfbWFuZ2xlIGlwNnRhYmxlX3Jh
dyBpcDZ0YWJsZV9zZWN1cml0eSBpcHRhYmxlX25hdCBuZl9uYXQgbmZfY29ubnRyYWNrIG5mX2Rl
ZnJhZ19pcHY2IG5mX2RlZnJhZ19pcHY0IGlwdGFibGVfbWFuZ2xlIGlwdGFibGVfcmF3IGlwdGFi
bGVfc2VjdXJpdHkgaXBfc2V0IG5mX3RhYmxlcyB2Ym94c2YgbmZuZXRsaW5rIGlwNnRhYmxlX2Zp
bHRlciBpcDZfdGFibGVzIGlwdGFibGVfZmlsdGVyIHN1bnJwYyB2ZmF0IGZhdCBpbnRlbF9yYXBs
X21zciBqb3lkZXYgaW50ZWxfcmFwbF9jb21tb24gaW50ZWxfcG93ZXJjbGFtcCBjcmN0MTBkaWZf
cGNsbXVsIGNyYzMyX3BjbG11bCBnaGFzaF9jbG11bG5pX2ludGVsIHNuZF9pbnRlbDh4MCByYXBs
IHNuZF9hYzk3X2NvZGVjIGFjOTdfYnVzIHNuZF9zZXEgc25kX3NlcV9kZXZpY2Ugc25kX3BjbSBw
Y3Nwa3Igc25kX3RpbWVyIHNuZCBzb3VuZGNvcmUgaTJjX3BpaXg0IHZib3hndWVzdCBpcF90YWJs
ZXMgdmJveHZpZGVvIGRybV92cmFtX2hlbHBlciBkcm1fa21zX2hlbHBlciBjZWMgZHJtX3R0bV9o
ZWxwZXIgdHRtIGNyYzMyY19pbnRlbCBzZXJpb19yYXcgZTEwMDAgZHJtIGRybV9wcml2YWN5X3Nj
cmVlbl9oZWxwZXIgYXRhX2dlbmVyaWMgcGF0YV9hY3BpIHZpZGVvIGZ1c2UKPiBbICA0MTkuODUy
Mzc1XSAtLS1bIGVuZCB0cmFjZSA1MTFlNTM0Njg5N2Q5NTI2IF0tLS0KPgo+IE5vdGUgaW4gY2Fz
ZSBvZiB0aGUgdmJveHZpZGVvIGRyaXZlciB0aGUgRE1BMzIgcG9vbCBpcyBhbGxvY2F0ZWQgdGhy
b3VnaAo+IGRybV92cmFtX2hlbHBlcl9hbGxvY19tbSgpIHdoaWNoIGlzIGFsc28gdXNlZCBieSB0
aGUgYm9jaHMgYW5kCj4gaGlzaWxpY29uL2hpYm1jIGRyaXZlcnMuCj4KPiBDYzogQ2hyaXN0aWFu
IEvDtm5pZyA8Y2hyaXN0aWFuLmtvZW5pZ0BhbWQuY29tPgo+IEZpeGVzOiBkMDk5ZmM4ZjU0MGEg
KCJkcm0vdHRtOiBuZXcgVFQgYmFja2VuZCBhbGxvY2F0aW9uIHBvb2wgdjMiKQo+IFNpZ25lZC1v
ZmYtYnk6IEhhbnMgZGUgR29lZGUgPGhkZWdvZWRlQHJlZGhhdC5jb20+Cj4gLS0tCj4gICBkcml2
ZXJzL2dwdS9kcm0vdHRtL3R0bV9wb29sLmMgfCA1ICsrKy0tCj4gICAxIGZpbGUgY2hhbmdlZCwg
MyBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQo+Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMv
Z3B1L2RybS90dG0vdHRtX3Bvb2wuYyBiL2RyaXZlcnMvZ3B1L2RybS90dG0vdHRtX3Bvb2wuYwo+
IGluZGV4IDdiMmY2MDYxNjc1MC4uOGIzMmZkOGM4Y2NjIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMv
Z3B1L2RybS90dG0vdHRtX3Bvb2wuYwo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS90dG0vdHRtX3Bv
b2wuYwo+IEBAIC04MCw4ICs4MCw5IEBAIHN0YXRpYyBzdHJ1Y3QgcGFnZSAqdHRtX3Bvb2xfYWxs
b2NfcGFnZShzdHJ1Y3QgdHRtX3Bvb2wgKnBvb2wsIGdmcF90IGdmcF9mbGFncywKPiAgIAl2b2lk
ICp2YWRkcjsKPiAgIAo+ICAgCWlmIChvcmRlcikgewo+IC0JCWdmcF9mbGFncyB8PSBHRlBfVFJB
TlNIVUdFX0xJR0hUIHwgX19HRlBfTk9SRVRSWSB8Cj4gLQkJCV9fR0ZQX0tTV0FQRF9SRUNMQUlN
Owo+ICsJCWlmICghcG9vbC0+dXNlX2RtYTMyKQo+ICsJCQlnZnBfZmxhZ3MgfD0gR0ZQX1RSQU5T
SFVHRV9MSUdIVDsKPiArCQlnZnBfZmxhZ3MgfD0gX19HRlBfTk9SRVRSWSB8IF9fR0ZQX0tTV0FQ
RF9SRUNMQUlNOwo+ICAgCQlnZnBfZmxhZ3MgJj0gfl9fR0ZQX01PVkFCTEU7Cj4gICAJCWdmcF9m
bGFncyAmPSB+X19HRlBfQ09NUDsKPiAgIAl9CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0
cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9kcmktZGV2ZWwK
