Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A0E0602063
	for <lists+dri-devel@lfdr.de>; Tue, 18 Oct 2022 03:22:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7668610E030;
	Tue, 18 Oct 2022 01:22:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from 186.whitelist.crbl.net (186.whitelist.crbl.net
 [162.243.126.186])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C4B110E030;
 Tue, 18 Oct 2022 01:22:35 +0000 (UTC)
Received: from ([60.208.111.195])
 by unicom145.biz-email.net ((D)) with ASMTP (SSL) id MAN00125;
 Tue, 18 Oct 2022 08:47:25 +0800
Received: from jtjnmail201619.home.langchao.com (10.100.2.19) by
 jtjnmail201624.home.langchao.com (10.100.2.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.12; Tue, 18 Oct 2022 08:47:24 +0800
Received: from jtjnmail201619.home.langchao.com ([fe80::c426:eceb:41d0:3372])
 by jtjnmail201619.home.langchao.com ([fe80::c426:eceb:41d0:3372%2])
 with mapi id 15.01.2507.012; Tue, 18 Oct 2022 08:47:24 +0800
From: =?utf-8?B?dG9tb3Jyb3cgV2FuZyAo546L5b635piOKQ==?= <wangdeming@inspur.com>
To: "felix.kuehling@amd.com" <felix.kuehling@amd.com>
Subject: =?utf-8?B?562U5aSNOiBbUEFUQ0hdIGRybS9hbWRrZmQ6IHVzZSB2bWFfbG9va3VwKCkg?=
 =?utf-8?Q?instead_of_find=5Fvma()?=
Thread-Topic: [PATCH] drm/amdkfd: use vma_lookup() instead of find_vma()
Thread-Index: AQHY2vZO6b6Y9HXq4kWrbMYt0exbfK4SgyyAgADbmcA=
Date: Tue, 18 Oct 2022 00:47:24 +0000
Message-ID: <2dc397050eed4d11ade7b9020fe2e298@inspur.com>
References: <20221007024818.4921-1-wangdeming@inspur.com>
 <a1d36d76-396a-0bf0-26b7-c009fbae5dd0@amd.com>
In-Reply-To: <a1d36d76-396a-0bf0-26b7-c009fbae5dd0@amd.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
x-originating-ip: [10.200.104.82]
Content-Type: multipart/signed; protocol="application/x-pkcs7-signature";
 micalg=SHA1; boundary="----=_NextPart_000_0009_01D8E2CE.3D0137E0"
MIME-Version: 1.0
tUid: 20221018084725b822b4c2c956701375f65a334ee6c27f
X-Abuse-Reports-To: service@corp-email.com
Abuse-Reports-To: service@corp-email.com
X-Complaints-To: service@corp-email.com
X-Report-Abuse-To: service@corp-email.com
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
Cc: "Xinhui.Pan@amd.com" <Xinhui.Pan@amd.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "alexander.deucher@amd.com" <alexander.deucher@amd.com>,
 "christian.koenig@amd.com" <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

------=_NextPart_000_0009_01D8E2CE.3D0137E0
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi,
The function vma_lookup show below.  Vma valid check is included in it. =
Or, What other questions do you have?

static inline
struct vm_area_struct *vma_lookup(struct mm_struct *mm, unsigned long =
addr)
 {
         struct vm_area_struct *vma =3D find_vma(mm, addr);

         if (vma && addr < vma->vm_start)
                 vma =3D NULL;

         return vma;
 }


> from: Felix Kuehling <felix.kuehling@amd.com>
> time: 2022=E5=B9=B410=E6=9C=8818=E6=97=A5 3:35
> to: tomorrow Wang (=E7=8E=8B=E5=BE=B7=E6=98=8E) =
<wangdeming@inspur.com>;
> airlied@gmail.com; daniel@ffwll.ch; alexander.deucher@amd.com;
> christian.koenig@amd.com; Xinhui.Pan@amd.com
> linux-kernel@vger.kernel.org
> sub: Re: [PATCH] drm/amdkfd: use vma_lookup() instead of find_vma()
>=20
>=20
> On 2022-10-06 22:48, Deming Wang wrote:
> > Using vma_lookup() verifies the start address is contained in the
> > found vma.  This results in easier to read the code.
>=20
> Thank you for the patches. This and your other patch look good to me.
> However, you missed one use of find_vma in svm_range_is_valid. Is that =
an
> oversight or is there a reason why we need to use find_vma there?
>=20
> If you're going to respin it, you may also squash the two patches into =
one.
>=20
> Thanks,
>    Felix
>=20
>=20
> >
> > Signed-off-by: Deming Wang <wangdeming@inspur.com>
> > ---
> >   drivers/gpu/drm/amd/amdkfd/kfd_svm.c | 12 ++++++------
> >   1 file changed, 6 insertions(+), 6 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_svm.c
> > b/drivers/gpu/drm/amd/amdkfd/kfd_svm.c
> > index 64fdf63093a0..cabcc2ca3c23 100644
> > --- a/drivers/gpu/drm/amd/amdkfd/kfd_svm.c
> > +++ b/drivers/gpu/drm/amd/amdkfd/kfd_svm.c
> > @@ -1586,8 +1586,8 @@ static int svm_range_validate_and_map(struct
> mm_struct *mm,
> >   		unsigned long npages;
> >   		bool readonly;
> >
> > -		vma =3D find_vma(mm, addr);
> > -		if (!vma || addr < vma->vm_start) {
> > +		vma =3D vma_lookup(mm, addr);
> > +		if (!vma) {
> >   			r =3D -EFAULT;
> >   			goto unreserve_out;
> >   		}
> > @@ -2542,8 +2542,8 @@ svm_range_get_range_boundaries(struct
> kfd_process *p, int64_t addr,
> >   	struct interval_tree_node *node;
> >   	unsigned long start_limit, end_limit;
> >
> > -	vma =3D find_vma(p->mm, addr << PAGE_SHIFT);
> > -	if (!vma || (addr << PAGE_SHIFT) < vma->vm_start) {
> > +	vma =3D vma_lookup(p->mm, addr << PAGE_SHIFT);
> > +	if (!vma) {
> >   		pr_debug("VMA does not exist in address [0x%llx]\n", addr);
> >   		return -EFAULT;
> >   	}
> > @@ -2871,8 +2871,8 @@ svm_range_restore_pages(struct amdgpu_device
> *adev, unsigned int pasid,
> >   	/* __do_munmap removed VMA, return success as we are handling =
stale
> >   	 * retry fault.
> >   	 */
> > -	vma =3D find_vma(mm, addr << PAGE_SHIFT);
> > -	if (!vma || (addr << PAGE_SHIFT) < vma->vm_start) {
> > +	vma =3D vma_lookup(mm, addr << PAGE_SHIFT);
> > +	if (!vma) {
> >   		pr_debug("address 0x%llx VMA is removed\n", addr);
> >   		r =3D 0;
> >   		goto out_unlock_range;

------=_NextPart_000_0009_01D8E2CE.3D0137E0
Content-Type: application/pkcs7-signature; name="smime.p7s"
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="smime.p7s"

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
AgICAIAwDgYIKoZIhvcNAwQCAgCAMAcGBSsOAwIHMAoGCCqGSIb3DQMHMB0GA1UdDgQWBBT2m8+B
pv3zOH+FCDvTbpfMkvPbAzAfBgNVHSMEGDAWgBReWQOmtExYYJFO9h61pTmmMsE1ajCCAQ8GA1Ud
HwSCAQYwggECMIH/oIH8oIH5hoG6bGRhcDovLy9DTj1JTlNQVVItQ0EsQ049SlRDQTIwMTIsQ049
Q0RQLENOPVB1YmxpYyUyMEtleSUyMFNlcnZpY2VzLENOPVNlcnZpY2VzLENOPUNvbmZpZ3VyYXRp
b24sREM9aG9tZSxEQz1sYW5nY2hhbyxEQz1jb20/Y2VydGlmaWNhdGVSZXZvY2F0aW9uTGlzdD9i
YXNlP29iamVjdENsYXNzPWNSTERpc3RyaWJ1dGlvblBvaW50hjpodHRwOi8vSlRDQTIwMTIuaG9t
ZS5sYW5nY2hhby5jb20vQ2VydEVucm9sbC9JTlNQVVItQ0EuY3JsMIIBKQYIKwYBBQUHAQEEggEb
MIIBFzCBsQYIKwYBBQUHMAKGgaRsZGFwOi8vL0NOPUlOU1BVUi1DQSxDTj1BSUEsQ049UHVibGlj
JTIwS2V5JTIwU2VydmljZXMsQ049U2VydmljZXMsQ049Q29uZmlndXJhdGlvbixEQz1ob21lLERD
PWxhbmdjaGFvLERDPWNvbT9jQUNlcnRpZmljYXRlP2Jhc2U/b2JqZWN0Q2xhc3M9Y2VydGlmaWNh
dGlvbkF1dGhvcml0eTBhBggrBgEFBQcwAoZVaHR0cDovL0pUQ0EyMDEyLmhvbWUubGFuZ2NoYW8u
Y29tL0NlcnRFbnJvbGwvSlRDQTIwMTIuaG9tZS5sYW5nY2hhby5jb21fSU5TUFVSLUNBLmNydDBH
BgNVHREEQDA+oCUGCisGAQQBgjcUAgOgFwwVd2FuZ2RlbWluZ0BpbnNwdXIuY29tgRV3YW5nZGVt
aW5nQGluc3B1ci5jb20wDQYJKoZIhvcNAQELBQADggEBAKD6Oh0Yu1g2xXDIaczYlx8WZiYqTi7t
bFCmsNT5DmNUfLaJre5UDyaWjgwW6Z/KN1X19Piy6oS8ex93gaeF4siDuQimREZoKxePJyUeyFs5
oC6kpsw95f/0RM5zhHb4I8L4AgplfwySCGAeMRr74rThzkYWfoU1AM+c8cBtViIispknx6KxJFo2
b533lCx168UKeNRb1n7pUANxFYd+1jjdRKCPrszdJcJddFmnLBetcnD4DG0ID62hnw+/g0KoAlfd
ORikFVBLobsDNy+NQ++5ZYgx1ahEQ6BESIjeWxut+2Zqis6Zbwd5ZsBhm892l5EdzJCuYe5xDEZw
0Z0bGvUxggOTMIIDjwIBATBwMFkxEzARBgoJkiaJk/IsZAEZFgNjb20xGDAWBgoJkiaJk/IsZAEZ
FghsYW5nY2hhbzEUMBIGCgmSJomT8ixkARkWBGhvbWUxEjAQBgNVBAMTCUlOU1BVUi1DQQITfgAA
1tjc3okYpZWK7QAAAADW2DAJBgUrDgMCGgUAoIIB+DAYBgkqhkiG9w0BCQMxCwYJKoZIhvcNAQcB
MBwGCSqGSIb3DQEJBTEPFw0yMjEwMTgwMDQ3MjJaMCMGCSqGSIb3DQEJBDEWBBST67mw4N90PcF4
hgqli2sF5Rg5IDB/BgkrBgEEAYI3EAQxcjBwMFkxEzARBgoJkiaJk/IsZAEZFgNjb20xGDAWBgoJ
kiaJk/IsZAEZFghsYW5nY2hhbzEUMBIGCgmSJomT8ixkARkWBGhvbWUxEjAQBgNVBAMTCUlOU1BV
Ui1DQQITfgAA1tjc3okYpZWK7QAAAADW2DCBgQYLKoZIhvcNAQkQAgsxcqBwMFkxEzARBgoJkiaJ
k/IsZAEZFgNjb20xGDAWBgoJkiaJk/IsZAEZFghsYW5nY2hhbzEUMBIGCgmSJomT8ixkARkWBGhv
bWUxEjAQBgNVBAMTCUlOU1BVUi1DQQITfgAA1tjc3okYpZWK7QAAAADW2DCBkwYJKoZIhvcNAQkP
MYGFMIGCMAoGCCqGSIb3DQMHMAsGCWCGSAFlAwQBKjALBglghkgBZQMEARYwCwYJYIZIAWUDBAEC
MA4GCCqGSIb3DQMCAgIAgDANBggqhkiG9w0DAgIBQDAHBgUrDgMCGjALBglghkgBZQMEAgMwCwYJ
YIZIAWUDBAICMAsGCWCGSAFlAwQCATANBgkqhkiG9w0BAQEFAASCAQBieZuG7cH9zIGAfzZ/LrYc
cfFwMZ2EKcBCxCB07+B4iSrawKROtNMcuvp7OEZZWPl4FMctbG28ZbzwcESf9ZY6zGO902Jmkjow
/Qj+x/D0RkIcdERgcXpp2yqoSbguNHu3sc/dQYzUTP7uyJJcmK2xPZUoZTxuB5SZVuBL17DwGe8x
hjcsFif3crFo6Y0s9zuCYToOHm0NIROT5tcvIf+vfXEX7yfJYj3QBJQnk7pLt52ayzg4Im8cdFHb
+lvX+XbY3dc/1yXVe61uDacwbvLgADF2/e//6qLDBgtiAyOtzga1IKv0xeuhfMp3v1Fnc87l77s8
NUW2PUBrBAzPmbLaAAAAAAAA

------=_NextPart_000_0009_01D8E2CE.3D0137E0--
