Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BA94B3E1D14
	for <lists+dri-devel@lfdr.de>; Thu,  5 Aug 2021 21:58:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F2126E8E4;
	Thu,  5 Aug 2021 19:58:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2048.outbound.protection.outlook.com [40.107.94.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D64E66E8E4
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Aug 2021 19:58:40 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kIUck4CgW8xO8ugjoFMzAuOjKgx4h87VLnOQkW/wyC3G6wPZduwnsjZFfGh2QY9hAe93rVEtg+0+OIIKvwyJXHVt9g8CHwuc02N9MG/jmO+YdwCo7UEoCQZNdjcxPstyZe41whodFUvgJP7fYt+fGRNsCRR7zbJDMjfWVzdOVqio83pRxlU6aoHRimwy6+6QpxxZv4iv0S2iBkbyK+qh+QCsMxiDMeZqTRg0NO8Zq9Hkmm7EODtkEZ0eeOffo8l9aaMcSM9qrYL61QNdXU84jrwJyrqeykr6j9TZxb+KHPTF0hS9g+Cgc7pW/hBWFS1mTARTlEsOVLvsohYy/VmQ5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=G9wzdtRGbArFjXRAemPA+pknQ5qaD4XSWpYbq314Z7Y=;
 b=nH2O7Ur1wJ8sOMApczdOca/3kjkPC5Ys23ZGeMkRsMGpVToeEdY6ePCyfea/RagtvlAWKIaq14cNq43UBfkTbEtQgAo/bfpxkOrPK5sFs2uZU1DZiyZ7ouWsZaJ6bhmdnta4yZUIWlc5Ea/OpOntI2ZFVbFySdbMmdIRJbllO2M6B44DjOIoiIWrKgGUduvwmCOHVn2NDJwwVFUkvcSamqhuhJjTwf850BAVR1Ag7W6kM38zSsLFj1yChNXE7dYuiLaqIO5PAv/G0zffUORyatyoA3emjLpPCB4ZwzaMdcxRCIe+XPeU8ZHVcH4SK4eeqcGO2q3AZFk4irRQ978Zzw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=G9wzdtRGbArFjXRAemPA+pknQ5qaD4XSWpYbq314Z7Y=;
 b=Wnp2LHYKI9DWzmJZi1LcKkB7DrvOVIGUilwZcJvF+4BfcETcSZpZsoA5MjZLaPHkRQcEjpBxP3klm0iwwdX8fRZ8ZJd2ExIY7G27gmeI25YpIjJPrIu/CKufo+ZTXTJMpAQftdVagC+sgzJ+xd5VbH+4UepuKmbjKzY3FpdEjNKTxRJfWhouVMfeni2315YXOQukhFPEdUrHyG6469W7wLfRafGOeWu8wgE2BTqlfV//EpckBnFBzH7/yxFLJw/rt9NuiJkXYcKnuNUl6JgLkyZgLS2IF3WYy51C4QI1SKXxxX0L0+N1HCfE7+bfE9eXR8OM7jJaBBOGPEJq2tHwMw==
Authentication-Results: amd.com; dkim=none (message not signed)
 header.d=none;amd.com; dmarc=none action=none header.from=nvidia.com;
Received: from MN2PR12MB3823.namprd12.prod.outlook.com (2603:10b6:208:168::26)
 by MN2PR12MB4472.namprd12.prod.outlook.com (2603:10b6:208:267::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4373.20; Thu, 5 Aug
 2021 19:58:38 +0000
Received: from MN2PR12MB3823.namprd12.prod.outlook.com
 ([fe80::dcee:535c:30e:95f4]) by MN2PR12MB3823.namprd12.prod.outlook.com
 ([fe80::dcee:535c:30e:95f4%6]) with mapi id 15.20.4394.017; Thu, 5 Aug 2021
 19:58:38 +0000
From: Zi Yan <ziy@nvidia.com>
To: Christian =?utf-8?q?K=C3=B6nig?= <christian.koenig@amd.com>
Cc: David Hildenbrand <david@redhat.com>, linux-mm@kvack.org,
 Matthew Wilcox <willy@infradead.org>, Vlastimil Babka <vbabka@suse.cz>,
 "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>,
 Mike Kravetz <mike.kravetz@oracle.com>, Michal Hocko <mhocko@kernel.org>,
 John Hubbard <jhubbard@nvidia.com>, linux-kernel@vger.kernel.org,
 Dave Young <dyoung@redhat.com>, Jonathan Corbet <corbet@lwn.net>,
 David Airlie <airlied@linux.ie>, kexec@lists.infradead.org,
 linux-doc@vger.kernel.org, dri-devel@lists.freedesktop.org
Subject: Re: [RFC PATCH 13/15] mm: convert MAX_ORDER sized static arrays to
 dynamic ones.
Date: Thu, 05 Aug 2021 15:58:32 -0400
X-Mailer: MailMate (1.14r5812)
Message-ID: <0D3441BA-2A11-4BCA-BFD5-CAB8EB915B8F@nvidia.com>
In-Reply-To: <586dda97-dc64-ade2-6736-a531e225acbc@amd.com>
References: <20210805190253.2795604-1-zi.yan@sent.com>
 <20210805190253.2795604-14-zi.yan@sent.com>
 <586dda97-dc64-ade2-6736-a531e225acbc@amd.com>
Content-Type: multipart/signed;
 boundary="=_MailMate_4B2EA1D0-8700-4B85-88FC-290FD6C94B08_=";
 micalg=pgp-sha512; protocol="application/pgp-signature"
X-ClientProxiedBy: MN2PR11CA0014.namprd11.prod.outlook.com
 (2603:10b6:208:23b::19) To MN2PR12MB3823.namprd12.prod.outlook.com
 (2603:10b6:208:168::26)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [10.2.50.235] (216.228.112.22) by
 MN2PR11CA0014.namprd11.prod.outlook.com (2603:10b6:208:23b::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4394.16 via Frontend
 Transport; Thu, 5 Aug 2021 19:58:35 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9c573dbf-dbeb-4aa5-b45b-08d9584b6ab6
X-MS-TrafficTypeDiagnostic: MN2PR12MB4472:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MN2PR12MB447226D15FF1AF80746762EBC2F29@MN2PR12MB4472.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: nhEtB1Pd/haTrVCalgs2kG77Y2fBwfhWJpek3opMFPNAdr4yZGjz2BS7Sp+Z5HriTMatgKmDDI9i0dZL8/PWaLEaylw1DcVlkghGkW9rhpucPX/SS6jKJZAvihnImZbFeMCt/S3qnpZH+ClTFjDOrX5navgpieI56xc0rBRxo8rVSTIZTMmHwbNs0aHHjQUeJP2LwzQ7HKVG825AgWsJQGlmb/re3QFOmtBNYH1KBzmkzbm0j+im9iwhQZsRi6sTAgccb539rjxnExY3vh7L+TL/RLB/Ir8WmAEJDWq++B3yY/sZkpBsYN6P0jJPVuxOrU4f3os0JDL2Onrzf7q2Mv1aJv/GS7DLM88VzWS4mYnaTcAawZQFVV6vgTsb7if4wGRjmmsI32z4KdZxyqHgNrpwRzOK//yplUBPVwo7op7LbLwTVvV+gARcF+Hmp72bL0bEeKgk6Bec+m3TkyFe6Ge5XJKCniqkDnvhgnX6KQP8r8d/l0e3b8Fryw+MglqWYWfNeDalGGuQyaLeLkP1Wb1eWI1veanGrFnn8PXGAdSwqO7TTax6XLKhL2iqpxHU0M/ESnUFwtww0yqfOS9hv/UcsZ2W7QafuTUU06yVqD96bOg1fKX1zNtgjZJgIkAUSgmxWV68RgwMusz438i7t284tulSMZig85GXcmfAtMiXK1D1S9P2dPgoOePW5q2UXyPZzmWKhr/p4x+dv50cJ7GVfLFQsuUepRhSnnldEqU=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3823.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(39860400002)(136003)(376002)(366004)(346002)(53546011)(54906003)(36756003)(6486002)(26005)(2906002)(6916009)(6666004)(33964004)(86362001)(2616005)(956004)(7416002)(21480400003)(33656002)(83380400001)(316002)(186003)(8676002)(66946007)(66574015)(478600001)(66476007)(66556008)(16576012)(4326008)(5660300002)(8936002)(38100700002)(235185007)(45980500001)(72826004);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aWt2b1E5TTNWTzgrNGJQUHVhMXc4bFhWbEREZWF0UTlpYnRxMkdicUEwZ1NO?=
 =?utf-8?B?RDFXQ0szUUtFT2lGS2U3Qms1aFVMNEZGazB3WnJRRU0yR1ZMMWVJb0h6MU9K?=
 =?utf-8?B?cDZkT2lqMXd4Sm1jYkduOFhVQ0pObnZHSkxzSURhS3FpaGEzUk1GWW1yZ3po?=
 =?utf-8?B?K21pbDVhOGphU0p5WXN0SmNmcWlzOEhCSmVBY1hPNzJ2am5ZUFlWMGlIVG84?=
 =?utf-8?B?Mnd5QTlNd0FCM212ZXV0SUlHMkhueWh6a3lFMUZKeW1ZSk4yTmpMQndYYTI0?=
 =?utf-8?B?OEg4akkvcmVYR3MzcDZhU21BZUdsSTdJRGZRY0VJb292a0xKQ3ZDWnRDalQ0?=
 =?utf-8?B?Q01iWTVWcTA3SDNZVmpHNUJVc2ptSFJLb0pVMmQyTVU5OTBKUTJYY2tOTE1D?=
 =?utf-8?B?dXhlbUhwM3NuOTJZZzFPdmhFMUVSK0lmMUR1QmlLbVAvL2dldytIY3VqOWhW?=
 =?utf-8?B?Z1g2czFTQXlqRUt0VjB3dmtSdGErRFhDTEpsSVArd0tjVkJLQVRpb01hZHg3?=
 =?utf-8?B?YUk4cjNCdkdibFc2ZXJ5L0VjRGRUQWlMeUZJbmNZbFVUTlc1VU1kMWR2Uzlq?=
 =?utf-8?B?anJta0VIa2dqZGw4MEY5QjlEZEJ0ckxjaERydmdsYUtBcFRDN3hOUWl1SmEw?=
 =?utf-8?B?eDFmdlZmZ2FRcENXU3lpVys0UFdSQmZ6QWNQdjJWRFJMYmdUOXNwZXF2cnhs?=
 =?utf-8?B?bnFnTnVSUXU1QklvMzFPWWJLek5DeWZwZHY0bU1sdWFxaXZ5Ukl2WDZYT0U1?=
 =?utf-8?B?b3U2NDZDQzZDVFphdkYzYVBkOGpnMGR0NkJRRUlPWEJucy9CNTZiUmQvVTd3?=
 =?utf-8?B?aUZybmtXckM2MXgzMndDRUlwSmNNZ2c1UnVGdUNJcEFHRXE1bkNPdEZQajZQ?=
 =?utf-8?B?Y3AvYzdqUmNvZHNMcHBoeTNneEFBRFhpbTVZNGN6dXRmVDIzaTdXSFNiMmpq?=
 =?utf-8?B?aU14OGVuQjNUT3oySDFkUURRY0NINGxxa2V4anZBeG5vRDNreEx1L21lVGlq?=
 =?utf-8?B?eDVHbllGaEFWTEl6MlRvVVRBMUtzMVZzRFFrY1dZV1ZDcE9EZDhITHlrMnJ6?=
 =?utf-8?B?ZUJBQ0t6dGlwU2JDNGtLOG4zWDkxbnFzOEVDRVo2d2RZL0hEVXdGS2xKZnRB?=
 =?utf-8?B?TTU1WCtNbXFrODlYeW5JNWFmVm5FWTM5VEJzY25zMlpWZ3FLR2d5TWhUUHVx?=
 =?utf-8?B?TkJ4a0RGQUF6ekVuYTVsQXBHOURYallqOENBRTVDLzZHVk15OWt1RUVMVFRP?=
 =?utf-8?B?ak1sbGthNzlsL3J3MzM5NWlrcVUxUDl4T2hxRk5icmd6K0QvUDVpek9RKzBn?=
 =?utf-8?B?NWpKaWNlalJ3WkVmYzFHMlFsQmtHMU45MWlQNFl1K2ZPL1hWSm9QdzJLcWV5?=
 =?utf-8?B?bU9WcU5aYzhrTWNySmp4cS9lc28xRndOSER0WkZVMTc4VWVsQ0N0c2ZaSXAr?=
 =?utf-8?B?MzNxc041c3NtRzBxRXRtK0dKV2JIZjN2V2o3YlNYdWREV0s5VlhRbVhFMmJI?=
 =?utf-8?B?NDdhTS83aU1GcU9yMkdSR2s0dmdUY1dyem9za3g5UFpZQ29IcmtFa0ZGVm1u?=
 =?utf-8?B?bE45bTl3L0FRQzFxVG56anVGUWdadmRqRHNOdnA5QStrY2hkSUhjU1k3MkVn?=
 =?utf-8?B?NHY3S1Z2Y2h0OUFsbTJRblBhV2UxanFXb1k2a3g0RGNTM1R5SHpxOEFUMXBO?=
 =?utf-8?B?Y3Z2M2cvS05RdVdnajRxamJrSXRuQkxzZmM1ZDZtMnBpR25zekRJcnFxWEhz?=
 =?utf-8?Q?MQOzEPGKmKVGwZDip8nSlLfknIPqL4Azr1ECC9z?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9c573dbf-dbeb-4aa5-b45b-08d9584b6ab6
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3823.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Aug 2021 19:58:38.7804 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ah5mMsCdOryIVnCLVv5w6kpQWcIrKHXrLhgzTuHvlXppQLCA9ArudkfDurDpKZkb
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4472
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--=_MailMate_4B2EA1D0-8700-4B85-88FC-290FD6C94B08_=
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 5 Aug 2021, at 15:16, Christian K=C3=B6nig wrote:

> Am 05.08.21 um 21:02 schrieb Zi Yan:
>> From: Zi Yan <ziy@nvidia.com>
>>
>> This prepares for the upcoming changes to make MAX_ORDER a boot time
>> parameter instead of compilation time constant. All static arrays with=

>> MAX_ORDER size are converted to pointers and their memory is allocated=

>> at runtime.
>
> Well in general I strongly suggest to not use the patter kmalloc(sizeof=
(some struct) * MAX_ORDER,...) instead use kmalloc_array, kcalloc etc..
>
> Then when a array is embedded at the end of a structure you can use a t=
railing array and the struct_size() macro to determine the allocation siz=
e.

Sure. Will fix it.

>
> Additional to that separating the patch into changes for TTM to make th=
e maximum allocation order independent from MAX_ORDER would be rather goo=
d to have I think.

Can you elaborate a little bit more on =E2=80=9Cmake the maximum allocati=
on order independent from MAX_ORDER=E2=80=9D? From what I understand of t=
tm_pool_alloc(), it tries to get num_pages pages by allocating as large p=
ages as possible, starting from MAX_ORDER. What is the rationale behind t=
his algorithm? Why not just call alloc_page(order=3D0) num_pages times? I=
s it mean to reduce the number of calls to alloc_page? The allocated page=
s do not need to get as high as MAX_ORDER, is that the case? If yes, I pr=
obably can keep ttm pool as static arrays with length of MIN_MAX_ORDER, w=
hich I introduce in Patch 14 as the lower bound of boot time parameter MA=
X_ORDER. Let me know your thoughts.

Thanks.

=E2=80=94
Best Regards,
Yan, Zi

--=_MailMate_4B2EA1D0-8700-4B85-88FC-290FD6C94B08_=
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQJDBAEBCgAtFiEEh7yFAW3gwjwQ4C9anbJR82th+ooFAmEMQugPHHppeUBudmlk
aWEuY29tAAoJEJ2yUfNrYfqK9IAP/1sWI6g4F8/TjyPqAnf9fJ900swOrmgQEmZg
z5Gy4K0ZkagwjucAwQq+dAw/Ebii5ZtQx2mqjx5aSyfp+I1ErcNJ0qNqKTWTjcQD
g/3hssNG6gmrf6mMstWHtediyWMkhH4WMCixpHocBZwE+3/zyyMtGHyOkLuAd5Ul
1nKtZc7CjgFM3FN3UeyV24HqLodhNIDYcQ5RHcHH+rNGBtoyScuZysYHFXBgNpkL
84S2xolvUObyDIHaVPPOhMI+zLZEJ8q3hOp+2ARqDS/2PsA9jtU+ICJjV4sslwnu
chz1J49n36SwEf+Kq5Cgm5iTrOnp7ziBthQgxDk99qRNoV/pgI4Wb7AEI6EeYiDp
6ImZD3ZzhQ7dXGGpaRCYBmYDQGSN+UAUZJlccq5QYhtSWwjAgfkAtBkD7tE9FZgc
AGXJS5XZDvRDD145vPvwWSYbMslQsWvTUiX37JubqF6rtplLfNy9P/REPaq2bkJX
TCqBYWfrprvo6wfdvjmdFbBGV+K/VWMXlri8U3Uf7QTNrAccY/oXODCF1m/kn0w8
4aUFr8I1I5SI+HgLRz12CHxzn151Py2aubN2DtIFN/+lpKUyOd3eSAPoA+O1W0rY
yEHamf+O9gZ00Kw9cqf25zxpGuGsBDKGOpecmD+yI5lb0B05+zHpsnM9PeCWO3Vq
FaQ3HpsL
=DyTs
-----END PGP SIGNATURE-----

--=_MailMate_4B2EA1D0-8700-4B85-88FC-290FD6C94B08_=--
